//
//  HomeView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct HomeView: View {
    @Binding var player: PlayerObj
    
    var Battle: () -> Void
    var Journal: () -> Void

    var body: some View {
        Button("Start Battle") {
            Battle()
        }

        Button("Journal") {
            Journal()
        }
    }
}

#Preview {
    struct HomeViewPreviewWrapper: View {
        @State private var player = PlayerObj(money: 500, health: 45, maxHealth: 50, maxWeapons: 1, weapons: [])
        var body: some View {
            HomeView(player: $player, Battle: {}, Journal: {})
        }
    }
    return HomeViewPreviewWrapper()
}
