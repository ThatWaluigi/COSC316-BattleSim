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
    
    mutating func takeDamage(amount: Int) -> Bool {
        health -= amount;
        return health <= 0;
    }
}
