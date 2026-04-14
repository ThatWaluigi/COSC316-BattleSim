//
//  PlayerHeader.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI
import SwiftData

struct PlayerHeader: View {
    @Query private var players: [Player]
    
    var body: some View {
        if let player = players.first {
            HStack{
                Group{
                    Text("Health: ").bold(true)
                    Spacer()
                    Healthbar(health: player.hp, maxHealth: player.maxHP)
                }
                            
                Spacer()
                Text("|").foregroundStyle(Color(.brown))
                Spacer()
                
                
                HStack{
                    Text("Gold:").bold(true)
                    Text("\(player.gold)").foregroundStyle(.yellow)
                }
            }
            .padding(4)
            .background(
                UIHelper.GetBackground(type: .DividerUI)
            )
        }
        else{
            Text("Loading...")
        }
    }
}
