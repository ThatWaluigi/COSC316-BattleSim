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

    var body: some View {
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
}

#Preview {
    ContentView()
}
