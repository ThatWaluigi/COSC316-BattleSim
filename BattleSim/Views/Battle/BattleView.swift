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
    
    enum UI_BGS: String{
        case MenuUI
        case DividerUI
        case ButtonUI
    }
    
    func GetBackground(type: UI_BGS) -> some View{
        return Image(type.rawValue)
            .resizable(
                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                resizingMode: .tile
            )
    }

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
                GetBackground(type: .MenuUI)
            )

            // CENTER AREA
            HStack(spacing: 0) {

                VStack {
                    Spacer()
                }
                .frame(maxWidth: 25)
                .background(
                    GetBackground(type: .DividerUI)
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
                    GetBackground(type: .DividerUI)
                )
            }

            // BOTTOM BAR
            HStack {
                switch ActionState {
                    .main: {ActionView()}
                }
            }
            .frame(height: 180)
            .padding()
            .background(
                Image("MenuUI")
                    .resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    )
            )
        }
        .ignoresSafeArea(edges: .all)
    }
}
