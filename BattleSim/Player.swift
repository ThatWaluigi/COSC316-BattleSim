//
//  Player.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct PlayerObj {
    var money: Int;
    var health: Int;
    
    var maxHealth: Int;
    
    var maxWeapons: Int;
    var weapons: [Weapons]
    
    func visualizeHP() -> some View {
        Rectangle()
        .foregroundColor(Color.red)
        .frame(width: CGFloat(health) / CGFloat(maxHealth) * 200, height: 15)
        .overlay(
            Text("\(health)").font(Font.system(size: 9)).foregroundStyle(.white).bold(true)
        )
    }
    
    mutating func TakeDamage(amount: Int) -> Bool {
        health -= amount;
        return health <= 0;
    }
    
    init(money: Int, maxHealth: Int, maxWeapons: Int, weapons: [Weapons]) {
        self.money = money
        self.health = maxHealth
        self.maxHealth = maxHealth
        self.maxWeapons = maxWeapons
        self.weapons = weapons
    }
}
