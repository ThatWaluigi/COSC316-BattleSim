//
//  ContentView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct ContentView: View {
    var inFight: Bool = false;
    var customizing: Bool = false;
    
    var body: some View {
        if !inFight && !customizing {
            HomeView()
        }
        else
        {
            if inFight {
                BattleView()
            }
            
            if customizing {
                CreationView()
            }
        }
    }
}

#Preview {
    ContentView()
}
