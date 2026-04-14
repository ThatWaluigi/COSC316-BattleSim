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
        case village, battle, journal, market
    }

    @Environment(\.modelContext) private var context
    @Query private var players: [Player]

    var body: some View {
        Group{
            switch screen {
                case .village:
                    HomeView(Battle: { screen = .battle },
                            Journal: { screen = .journal },
                             Market: { screen = .market}
                    )
                    
                case .battle:
                    BattleView(context: context, Return: { screen = .village })
                    
                case .journal:
                    JournalView(Return: { screen = .village })

                case .market:
                    MarketView(Return: { screen = .village })
            }
        }
        .onAppear{
            if players.first == nil {

                let player = Player()
                let firstWeapon = Prefabs.allWeapons[0]

                player.inventory.append(
                    PlayerWeapon(name: firstWeapon.name, damage: firstWeapon.baseDamage, rarity: firstWeapon.rarity)
                )

                context.insert(player)
            }
        }
    }
}

#Preview {
    ContentView().modelContainer(for: [Player.self, Enemy.self], inMemory:true)
}
