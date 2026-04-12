//
//  Monster.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

struct BattleMonster {
    var name: String
    var maxHealth: Int
    var health: Int
    var attack: Int

    var weapon: Weapons

    init(prefab: Monsters, weapon: Weapons, difficulty: Float) {
        self.name = prefab.baseName
        self.maxHealth = prefab.baseHealth * (1 + difficulty)
        self.health = self.maxHealth
        self.attack = prefab.baseAttack * (1 + difficulty * 0.5)

        self.weapon = weapon
    }

    mutating func TakeDamage(amount: Int) -> Bool {
        health -= amount;
        return health <= 0;
    }
}
