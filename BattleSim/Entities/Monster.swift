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

        // Compute in Float, round to nearest, then convert to Int
        let healthFloat = Float(prefab.baseHealth) * (1 + difficulty)
        self.maxHealth = Int(healthFloat.rounded())

        self.health = self.maxHealth

        let attackFloat = Float(prefab.baseAttack) * (1 + difficulty * 0.5)
        self.attack = Int(attackFloat.rounded())

        self.weapon = weapon
    }

    mutating func takeDamage(amount: Int) -> Bool {
        health -= amount
        return health <= 0
    }
}
