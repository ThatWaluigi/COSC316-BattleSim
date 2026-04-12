//
//  BattleView.swift
//  BattleSim
//

import SwiftUI

struct BattleView: View {
    @Binding var player: PlayerObj

    @State private var enemy: BattleMonster
    @State private var battleEnded = false
    @State private var didWin = false

    @State private var selectingWeapon = false
    @State private var selectedWeaponIndex: Int? = nil
    @State private var isProcessingTurn = false

    @State private var enemyShake = false
    @State private var enemyFlash = false

    var Return: () -> Void

    init(player: Binding<PlayerObj>, Return: @escaping () -> Void) {
        self._player = player
        self.Return = Return

        self._enemy = State(initialValue: BattleMonster(
            prefab: Monsters(baseName: "Slime", baseHealth: 10, baseAttack: 2, minRarity: .Common, maxRarity: .Common),
            weapon: Weapons(baseName: "Stick", baseAttack: 1, rarity: .Common),
            difficulty: 0
        ))
    }

    var body: some View {
        VStack {

            // MARK: Enemy
            Text(enemy.name)
                .offset(x: enemyShake ? -8 : 0)
                .animation(.interpolatingSpring(stiffness: 500, damping: 20), value: enemyShake)
                .opacity(enemyFlash ? 0.3 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: enemyFlash)

            Text("HP: \(enemy.health)/\(enemy.maxHealth)")
            Text("Player HP: \(player.health)/\(player.maxHealth)")

            // MARK: Weapon Select Mode
            if selectingWeapon {
                VStack {
                    Text("Select Weapon")

                    ForEach(player.weapons.indices, id: \.self) { index in
                        Button {
                            selectedWeaponIndex = index
                            selectingWeapon = false
                            resolveAttack()
                        } label: {
                            Text(player.weapons[index].baseName)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Image("ButtonUI")
                                        .resizable(
                                            capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                                            resizingMode: .tile
                                        )
                                )
                        }
                    }

                    Button("Cancel") {
                        selectingWeapon = false
                    }
                }
                .disabled(isProcessingTurn)
            }

            // MARK: Main Controls
            if !selectingWeapon {
                Button("Attack") {
                    selectingWeapon = true
                }
                .disabled(isProcessingTurn)

                Button("Defend") {
                    // optional later
                }
                .disabled(isProcessingTurn)

                Button("Run") {
                    Return()
                }
                .disabled(isProcessingTurn)
            }
        }

        // MARK: End Screen
        .overlay {
            if battleEnded {
                VStack {
                    if didWin {
                        Text("Victory")

                        Button("Claim Rewards") {
                            player.money += 10
                            Return()
                        }
                    } else {
                        Text("Defeat")

                        Button("Return") {
                            Return()
                        }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.8))
            }
        }
    }

    // MARK: Combat Logic
    private func resolveAttack() {
        guard let index = selectedWeaponIndex else { return }
        guard !isProcessingTurn else { return }

        isProcessingTurn = true

        // Player attack
        let result = BattleController.performTurn(
            player: &player,
            weaponIndex: index,
            enemy: &enemy
        )

        // Enemy hit animation
        enemyShake = true
        enemyFlash = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            enemyShake = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            enemyFlash = false
        }

        // End checks
        if result.enemyDied {
            battleEnded = true
            didWin = true
            isProcessingTurn = false
            return
        }

        if result.playerDied {
            battleEnded = true
            didWin = false
            isProcessingTurn = false
            return
        }

        // Enemy turn delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {

            let playerDied = player.takeDamage(
                amount: enemy.attack + enemy.weapon.baseAttack
            )

            if playerDied {
                battleEnded = true
                didWin = false
            }

            isProcessingTurn = false
        }
    }
}