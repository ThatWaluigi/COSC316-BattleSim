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

    init(prefab: Monsters, weaponPool: [Weapons]) {
        self.name = prefab.baseName
        self.health = prefab.baseHealth
        self.attack = prefab.baseAttack

        if let weapon = prefab.weapon {
            self.weapon = weapon
        } else {
            self.weapon = weaponPool.randomElement()!
        }
    }

    mutating func TakeDamage(amount: Int) -> Bool {
        health -= amount;
        return health <= 0;
    }
}
