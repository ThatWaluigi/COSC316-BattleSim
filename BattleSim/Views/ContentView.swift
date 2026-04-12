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

    @Environment(\.modelContext) private var context
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
            guard players.isEmpty else {return}

            let player = Player()
            let firstWeapon = Prefabs.allWeapons[0]

            player.inventory.append(
                PlayerWeapon(name: firstWeapon.name, damage: firstWeapon.baseDamage, rarity: firstWeapon.rarity)
            )

            context.insert(player)
        }
    }
}

#Preview {
    ContentView()
}
