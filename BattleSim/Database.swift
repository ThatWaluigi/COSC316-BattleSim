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

    init(baseName: String,baseHealth: Int,baseAttack: Int,weapon: Weapon? = nil,minRarity: WeaponRarity,maxRarity: WeaponRarity) {
        self.baseName = baseName
        self.baseHealth = baseHealth
        self.baseAttack = baseAttack
        self.weapon = weapon
        self.minRarity = minRarity
        self.maxRarity = maxRarity
    }
}

@Model
class Weapons {
    var baseName: String
    var baseAttack: Int
    var rarity: WeaponRarity

    init(baseName: String = "", baseAttack: Int = 1, rarity: WeaponRarity = .Common) {
        self.baseName = baseName
        self.baseAttack = baseAttack
        self.rarity = rarity
    }
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
