//
//  PlayerHeader.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI

struct PlayerHeader: View {
    var hp: Int = 80
    var max: Int = 100
    
    var money: Int = 100000
    
    var body: some View {
        HStack{
            Group{
                Text("Health: ").bold(true)
                Spacer()
                Healthbar(health: hp, maxHealth: max)
            }
                        
            Spacer()
            Text("|").foregroundStyle(Color(.brown))
            Spacer()
            
            
            HStack{
                Text("Money:").bold(true)
                Text("\(money)").foregroundStyle(.yellow)
            }
        }
        .padding(4)
        .background(
            UIHelper.GetBackground(type: .DividerUI)
        )
    }
}
