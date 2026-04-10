//
//  Healthbar.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-09.
//

struct Healthbar: View {
    var health: Int
    var maxHealth: Int

    var body: some View {
        let hpRatio = CGFloat(health) / CGFloat(maxHealth)

        return Rectangle()
            .foregroundColor(.red)
            .frame(width: ratio * 200, height: 15)
            .overlay(
                Text("\(health)")
                    .font(.system(size: 9))
                    .foregroundStyle(.white)
                    .bold()
            )
    }
}