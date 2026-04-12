//
//  NewBattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI

//
//  BattleView.swift
//  BattleSim
//

import SwiftUI

struct BattleView: View {

    var Return: () -> Void

    var ActionState: PlayerActionState = .main
    enum PlayerActionState {
        case main, attack, victory, defeat
    }

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            HStack {
                Spacer()
            }
            .frame(height: 50)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )

            // CENTER AREA
            HStack(spacing: 0) {

                VStack {
                    Spacer()
                }
                .frame(maxWidth: 25)
                .background(
                    UIHelper.GetBackground(type: .DividerUI)
                )

                VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)

                VStack {
                    Spacer()
                }
                .frame(maxWidth: 25)
                .background(
                    UIHelper.GetBackground(type: .DividerUI)
                )
            }

            // BOTTOM BAR
            HStack {
                switch ActionState {
                case .main:
                    ActionView(Return: Return)
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
