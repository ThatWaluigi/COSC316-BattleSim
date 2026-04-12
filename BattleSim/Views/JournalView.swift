//
//  JournalView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-09.
//

import SwiftUI

struct JournalView: View {
    var Return: () -> Void

    var body: some View {
        Button("Back") {
            Return()
        }
    }
}
