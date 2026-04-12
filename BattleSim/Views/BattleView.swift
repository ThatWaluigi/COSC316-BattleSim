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

    var goBack: () -> Void

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            HStack {
                Spacer()
            }
            .frame(height: 35)
            .padding()
            .background(
                Image("MenuUI")
                    .resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    )
            )

            // CENTER AREA
            HStack(spacing: 0) {

                VStack {
                    Spacer()
                }
                .frame(maxWidth: 15)
                .background(
                    Image("DividerUI")
                        .resizable(
                            capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                            resizingMode: .tile
                        )
                )

                VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)

                VStack {
                    Spacer()
                }
                .frame(maxWidth: 15)
                .background(
                    Image("DividerUI")
                        .resizable(
                            capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                            resizingMode: .tile
                        )
                )
            }

            // BOTTOM BAR
            HStack {
                VStack {

                    HStack {
                        Button("Attack") { }
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

                    HStack {
                        Button("Defend") { }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                Image("ButtonUI")
                                    .resizable(
                                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                                        resizingMode: .tile
                                    )
                            )

                        Button("Run") {
                            goBack()
                        }
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
            }
            .frame(height: 150)
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

#Preview {
    BattleView()
}
