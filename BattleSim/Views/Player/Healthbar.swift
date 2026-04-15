//
//  Healthbar.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-09.
//

import SwiftUI

struct Healthbar: View {
    var health: Int
    var maxHealth: Int

    var body: some View {
        // Clamp to avoid layout glitches if values go out of bounds.
        let safeMax = max(1, maxHealth)
        let clampedHealth = min(max(0, health), safeMax)
        let hpRatio = CGFloat(clampedHealth) / CGFloat(safeMax)

        return GeometryReader { geo in
            let totalWidth = geo.size.width
            let lostWidth = max(0, totalWidth * (1 - hpRatio))

            ZStack {
                // Full bar = current HP color
                Rectangle()
                    .foregroundStyle(Color.red)
                    .frame(height: 15)
                    .animation(.easeInOut(duration: 0.25), value: hpRatio)

                // Lost HP overlay on the right (trailing)
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundStyle(Color.gray.opacity(0.7))
                        .frame(width: lostWidth, height: 15)
                        .animation(.easeInOut(duration: 0.25), value: hpRatio)
                }

                // Centered health text
                Text("\(clampedHealth)")
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .frame(height: 15)
    }
}
