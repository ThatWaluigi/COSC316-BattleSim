//
//  BattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI

struct BattleView: View {

    var Return: () -> Void
    @State private var ActionState: PlayerActionState = .main

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            HStack {
                // Health Bar and Money View
                Spacer()
            }
            .frame(height: 50)
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
                switch ActionState {
                case .main:
                    ActionView(Return: Return, actionState: $ActionState)
                case .attack:
                    Text("Hit")
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

// Battle > Player UI State
enum PlayerActionState {
    case main, attack, victory, defeat
}
