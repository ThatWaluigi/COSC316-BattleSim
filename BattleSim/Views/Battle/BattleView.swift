//
//  BattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI
import SwiftData

struct BattleView: View {

    var context: ModelContext
    var Return: () -> Void

    @StateObject private var controller = BattleController()

    @Query var players: [Player]

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            VStack{
                Spacer()
                PlayerHeader()
            }
            .frame(height: 70)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )

            // CENTER AREA
            HStack(spacing: 0) {

                Color.clear
                    .frame(maxWidth: 25)
                    .background(
                        UIHelper.GetBackground(type: .DividerUI)
                    )

                VStack {
                    if let enemy = controller.enemy {
                        EnemyView(enemy: enemy)
                    }
    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)

                Color.clear
                    .frame(maxWidth: 25)
                    .background(
                        UIHelper.GetBackground(type: .DividerUI)
                    )
            }

            // BOTTOM BAR
            HStack {
                switch controller.state {
                case .main:
                    ActionView(
                        onAttack: { controller.ChangeState(state: .attack) },
                        onRun: Return
                    )
                case .attack:
                    WeaponView(
                        Back: {controller.ChangeState(state: .main)},
                        playerAttack: { weapon in
                            controller.PlayerAttack(
                                weapon: weapon,
                                context: context
                            )
                        },
                        weapons: controller.GetPlayerWeapons()
                    )
                case .victory:
                    WinView(Return: {Return()},
                            controller: controller
                    )
                case .defeat:
                    LoseView(Return: {Return()},
                             HealPlayer: { controller.HealDefeatedPlayer()},
                             enemyName: controller.enemy!.name
                    )
                }
            }
            .frame(height: 180)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )
        }
        .ignoresSafeArea(edges: .all)
        .onAppear {
            if let player = players.first {
                controller.AssignPlayer(player: player)
            }

            controller.startRandomBattle(context: context)
        }
    }
}
