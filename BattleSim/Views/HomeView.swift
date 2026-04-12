//
//  HomeView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct HomeView: View {
    var Battle: () -> Void
    var Journal: () -> Void

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            VStack{
                HStack {
                    Spacer()
                }
                .frame(height: 50)
                .padding()
                .background(
                    GetBackground(type: .MenuUI)
                )

                HStack {
                    Spacer()
                }
                .frame(maxWidth: 25)
                .background(
                    GetBackground(type: .DividerUI)
                )
            }

            // CENTER AREA
            HStack(spacing: 0) {
                VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            }

            // BOTTOM BAR
            HStack {
                VStack {

                    HStack {
                        Button("Attack") { }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                GetBackground(type: .ButtonUI)
                            )
                    }

                    HStack {
                        Button("Defend") { }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                GetBackground(type: .ButtonUI)
                            )

                        Button("Run") {
                            Return()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            GetBackground(type: .ButtonUI)
                        )
                    }
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
