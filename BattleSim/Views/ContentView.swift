//
//  ContentView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct ContentView: View {
    @State var screen: Screen = .village

    @State var player = PlayerObj(money: 0, health: 15, maxHealth: 20, maxWeapons: 1, weapons: [])
    
    var body: some View {
        switch screen {
            case .village: HomeView(player: $player, Battle: { screen = .battle}, Journal: { screen = .journal})
            case .battle: BattleView(player: $player, Return: { screen = .village })
            case .journal: JournalView(Return: { screen = .village })
        }
    }

    enum Screen {
        case village, battle, journal
    }
}

#Preview {
    ContentView()
}
