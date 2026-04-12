//
//  HomeView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct HomeView: View {
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
