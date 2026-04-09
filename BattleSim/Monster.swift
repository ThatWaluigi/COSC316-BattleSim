//
//  Monster.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

struct BattleMonster {
    var name: String
    var health: Int
    var attack: Int

    var weapon: Weapons

    init(prefab: Monsters) {
        self.name = prefab.baseName
        self.health = prefab.baseHealth
        self.attack = prefab.baseAttack
        
        self.weapon = prefab.Weapon!
    }
}
