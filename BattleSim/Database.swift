//
//  Database.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftData

@Model
class Monsters {
    var baseName: String;
    var baseHealth: Int;
    var baseAttack: Int;
    
    var Weapon: Weapons?; //If no weapon is set -> random one from db is grabbed
    var weaponWieldRarity: [WeaponRarity]; //[min rarity, max rarity] ^
    
    init(baseName: String, baseHealth: Int, baseAttack: Int, Weapon: Weapons, weaponWieldRarity: [WeaponRarity]){
        self.baseName = baseName
        self.baseHealth = baseHealth
        self.baseAttack = baseAttack
        self.Weapon = Weapon
        self.weaponWieldRarity = weaponWieldRarity
    }
}

@Model
class Weapons {
    var baseName: String;
    var baseAttack: Int;
    
    var rarity: WeaponRarity;
    
    init(baseName: String, baseAttack: Int, rarity: WeaponRarity) {
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
