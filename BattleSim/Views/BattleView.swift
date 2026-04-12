//
//  BattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct BattleView: View {
    @Binding var player: PlayerObj
    
    var Return: () -> Void
    
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
                    
                    HStack{
                        Text("Health: ").bold()
                        Spacer()
                        Healthbar(health: player.health, maxHealth: player.maxHealth)
                    }
                    .padding(3)
                    .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    )
                )
                    
                    HStack{
                        Button("Attack") {
                            
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
        @State private var player = PlayerObj(money: 1000, health: 100, maxHealth: 100, maxWeapons: 1, weapons: [])
        var body: some View {
            BattleView(player: $player, Return: {})
        }
    }
    return BattleViewPreviewWrapper()
}
