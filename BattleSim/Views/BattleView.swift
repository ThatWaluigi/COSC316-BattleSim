//
//  BattleView.swift
//  BattleSim
//

import SwiftUI
import SwiftData

struct BattleView: View {
    @Binding var player: PlayerObj
    var Return: () -> Void

    @Environment(\.modelContext) private var context

    @State private var enemy: BattleMonster? = nil
    @State private var selectedWeaponIndex: Int? = nil

    // animation + flow control
    @State private var isEnemyHitFlash = false
    @State private var showRewards = false

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            HStack { Spacer() }
                .frame(height: 35)
                .padding()
                .background(
                    Image("MenuUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    )
                )

            // MAIN AREA
            HStack(spacing: 0) {

                VStack { Spacer() }
                    .frame(maxWidth: 15)
                    .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))

                VStack {
                    Spacer()

                    if let enemy = enemy {
                        Text(enemy.name)
                            .font(.headline)

                        Text("HP: \(enemy.health)/\(enemy.maxHealth)")
                            .opacity(isEnemyHitFlash ? 0.3 : 1.0)
                            .animation(.easeInOut(duration: 0.15), value: isEnemyHitFlash)
                    }

                    if showRewards {
                        Text("Rewards earned!")
                            .transition(.opacity)
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)

                VStack { Spacer() }
                    .frame(maxWidth: 15)
                    .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))
            }

            // ACTION PANEL
            HStack {
                VStack {

                    // HEALTH
                    HStack {
                        Text("Health: ").bold()
                        Spacer()
                        Healthbar(health: player.health, maxHealth: player.maxHealth)
                    }
                    .padding(3)
                    .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))

                    // WEAPON SELECT
                    HStack {
                        ForEach(player.weapons.indices, id: \.self) { i in
                            Button {
                                selectedWeaponIndex = i
                            } label: {
                                Text(player.weapons[i].baseName)
                                    .padding(6)
                                    .background(
                                        selectedWeaponIndex == i
                                        ? Image("ButtonUI").resizable(
                                            capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                                            resizingMode: .tile
                                        )
                                        : nil
                                    )
                            }
                        }
                    }

                    // ATTACK
                    Button("Attack") {
                        guard
                            let enemy = enemy,
                            let index = selectedWeaponIndex
                        else { return }

                        triggerEnemyHitAnimation()

                        let result = BattleController.performTurn(
                            player: &player,
                            weaponIndex: index,
                            enemy: &self.enemy!
                        )

                        if result.enemyDied {
                            handleEnemyDeath()
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Image("ButtonUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))

                    HStack {
                        Button("Defend") { }
                        Button("Run") { }
                    }
                }

                Spacer()
            }
            .frame(height: 150)
            .padding()
            .background(Image("MenuUI").resizable(
                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                resizingMode: .tile
            ))
        }
        .ignoresSafeArea()
        .task {
            loadEnemyOnce()
        }
    }

    // MARK: - Enemy Spawn (ONLY ONCE)

    private func loadEnemyOnce() {
        guard enemy == nil else { return }

        let monsters = try? context.fetch(FetchDescriptor<Monsters>())
        let weapons = try? context.fetch(FetchDescriptor<Weapons>())

        guard let monsters, let weapons else { return }

        enemy = EnemyGen.generateEnemy(
            from: monsters,
            weapons: weapons,
            difficulty: playerDifficulty()
        )
    }

    // MARK: - Animation Hook

    private func triggerEnemyHitAnimation() {
        isEnemyHitFlash = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            isEnemyHitFlash = false
        }
    }

    // MARK: - Death Flow (NO instant return)

    private func handleEnemyDeath() {
        withAnimation {
            showRewards = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            Return()
        }
    }

    // MARK: - Difficulty source (TEMP)

    private func playerDifficulty() -> Float {
        0.2
    }
}