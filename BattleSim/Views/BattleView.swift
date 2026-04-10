//
//  BattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct BattleView: View {
    @Binding var Player: PlayerObj
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack{
                Spacer()
            }
            .frame(height: 35)
            .padding()
            .background(Image("MenuUI").resizable(
                    capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                    resizingMode: .tile
                )
            )
            
            HStack(spacing:0){
                VStack{
                    Spacer()
                }
                .frame(maxWidth: 15)
                .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    )
                )
                
                VStack{
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                VStack{
                    Spacer()
                }
                .frame(maxWidth: 15)
                .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    )
                )
            }
            
            HStack{
                VStack{
                    
                    // Visualize HP bar here
                    HStack {
                        Text("Health: ").padding(2).bold()
                        Player.visualizeHP()
                        Spacer()
                    }
                    .frame(maxWidth: 280)
                    .padding(4)
                    .background(Image("DividerUI").resizable(
                            capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                            resizingMode: .tile
                        )
                    )
                    
                    HStack{
                        Button("Attack") {
                            Player.TakeDamage(amount: 12)
                        }.padding()
                        .frame(maxWidth: .infinity)
                        .background(Image("ButtonUI").resizable(
                                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                                resizingMode: .tile
                            )
                        )
                    }
                    HStack{
                        Button("Defend") {
                            
                        }.padding()
                        .frame(maxWidth: .infinity)
                        .background(Image("ButtonUI").resizable(
                                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                                resizingMode: .tile
                            )
                        )
                        
                        Button("Run") {
                            
                        }.padding()
                        .frame(maxWidth: .infinity)
                        .background(Image("ButtonUI").resizable(
                                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                                resizingMode: .tile
                            )
                        )
                    }
                }
                Spacer()
            }
            .frame(height: 150)
            .padding()
            .background(Image("MenuUI").resizable(
                    capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                    resizingMode: .tile
                )
            )
        }
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    struct BattleViewPreviewWrapper: View {
        @State private var player = PlayerObj(money: 1000, maxHealth: 100, maxWeapons: 1, weapons: [])
        var body: some View {
            BattleView(Player: $player)
        }
    }
    return BattleViewPreviewWrapper()
}
