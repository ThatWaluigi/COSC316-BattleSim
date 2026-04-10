//
//  Database.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftData

@Model
class Monsters {
    var baseName: String
    var baseHealth: Int
    var baseAttack: Int

    var weapon: Weapon?
    var minRarity: WeaponRarity
    var maxRarity: WeaponRarity
}

@Model
class Weapons {
    var baseName: String
    var baseAttack: Int
    var rarity: WeaponRarity
}

enum WeaponRarity: Int, Codable{
    case Common = 1
    case Uncommon = 2
    case Rare = 3
    case Epic = 4
}

@Model
class Player {
    var diffculty: Float;
    
    var health: Int;
    var maxHealth: Int;
    var money: Int;
    
    var inventory: [Weapons];
    var maxWeapons: Int;
    
    init(difficulty:Float, maxHealth: Int, money: Int, inventory: [Weapons], maxWeapons: Int) {
        self.diffculty = difficulty
        self.health = maxHealth
        self.maxHealth = maxHealth
        self.money = money
        self.inventory = inventory
        self.maxWeapons = maxWeapons
    }
}
