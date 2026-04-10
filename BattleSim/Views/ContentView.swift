//
//  ContentView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct ContentView: View {
    var inFight: Bool = false;
    var journal: Bool = false;
    
    @State var player = PlayerObj(money: 0, maxHealth: 20, maxWeapons: 1, weapons: [])
    
    var body: some View {
        if !inFight && !journal {
            HomeView(Player: $player)
        }
        else
        {
            if inFight {
                BattleView(Player: $player)
            }
            
            if journal {
                JournalView()
            }
        }
    }
}

#Preview {
    ContentView()
}
