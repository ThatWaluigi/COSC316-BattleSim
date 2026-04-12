//
//  BattleView.swift
//  BattleSim
//

import SwiftUI
import SwiftData

struct BattleView: View {

    @Environment(\.modelContext) private var context

    @Query private var monsters: [Monsters]
    @Query private var weapons: [Weapons]
    @Query private var players: [Player]

    @State private var battleState: BattleState?
    @State private var attackFlash: Bool = false

    var Return: () -> Void

    var body: some View {

        VStack {

            if let state = battleState {

                VStack {

                    Text(state.enemy.name)

                    Text("HP: \(state.enemy.health)/\(state.enemy.maxHealth)")

                        .opacity(attackFlash ? 0.3 : 1.0)

                        .animation(.easeInOut(duration: 0.15), value: attackFlash)

                }

                HStack {

                    ForEach(players.first?.inventory ?? [], id: \.baseName) { weapon in
                        Button(weapon.baseName) {
                            attack(with: weapon)
                        }
                        .padding()
                        .background(Image("ButtonUI"))
                    }
                }

                Button("Run") {
                    Return()
                }

            } else {
                Text("Loading battle...")
                    .onAppear {
                        startBattle()
                    }
            }
        }
    }

    // MARK: Battle Actions

    private func startBattle() {
        guard let player = players.first else { return }

        battleState = BattleController.startBattle(
            monsters: monsters,
            weapons: weapons,
            difficulty: player.difficulty
        )
    }

    private func attack(with weapon: Weapons) {
        guard var state = battleState,
              let player = players.first else { return }

        attackFlash = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            attackFlash = false
        }

        let result = BattleController.playerAttack(
            state: &state,
            player: PlayerObj(
                money: 0,
                health: player.health,
                maxHealth: player.maxHealth,
                maxWeapons: player.maxWeapons,
                weapons: player.inventory
            ),
            weapon: weapon
        )

        battleState = state

        if result.enemyDied {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                Return()
            }
        }
    }
}