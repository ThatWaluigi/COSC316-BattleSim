//
//  BattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI

struct BattleView: View {

    var Return: () -> Void

    @StateObject private var controller = BattleController()

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
                    // Enemy Visualizer View
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
                        playerAttack: {weapon in
                            controller.PlayerAttack(weapon: weapon)    
                        },
                        weapons: [] // replace when adding player
                    )
                case .victory:
                    Text("Win")
                case .defeat:
                    Text("Lose")
                }
            }
            .frame(height: 180)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )
        }
        .ignoresSafeArea(edges: .all)
    }
}
