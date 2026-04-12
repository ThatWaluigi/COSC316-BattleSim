//
//  ContentView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State var screen: Screen = .village
    enum Screen {
        case village, battle, journal
    }

    @Enviroment(.\modelContainer) private var context
    @Query private var players: [Player]

    var body: some View {
        Group{
            switch screen {
                case .village:
                    HomeView(Battle: { screen = .battle },
                            Journal: { screen = .journal }
                    )
                    
                case .battle:
                    BattleView(Return: { screen = .village })
                    
                case .journal:
                    JournalView(Return: { screen = .village })
            }
        }
        .onAppear{
            if players.first == nil {
                let player = Player()
                let firstWeapon = allWeapons[1]
                player.inventory.add(firstWeapon)
                context.insert(player)
            }
        }
    }
}

#Preview {
    ContentView()
}
