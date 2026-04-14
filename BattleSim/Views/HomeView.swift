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
    var Market: () -> Void

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
                VStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            }

            // BOTTOM BAR
            HStack {
                VStack {
                    Button("Fight"){
                        Battle()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        UIHelper.GetBackground(type: .ButtonUI)
                    )

                    HStack{ 
                        Button("Journal"){
                            Journal()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            UIHelper.GetBackground(type: .ButtonUI)
                        )

                        Spacer()

                        Button("Upgrades"){
                            Market()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            UIHelper.GetBackground(type: .ButtonUI)
                        )
                    }
                }
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )
        }
        .ignoresSafeArea(edges: .all)
    }
}
