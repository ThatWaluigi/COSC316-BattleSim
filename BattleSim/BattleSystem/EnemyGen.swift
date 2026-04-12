//
//  EnemyGen.swift
//  BattleSim
//

struct EnemyGen {

    static func generateEnemy(
        from monsters: [Monsters],
        weapons: [Weapons],
        difficulty: Float
    ) -> BattleMonster {

        let chosenMonster = monsters.randomElement()!

        let validWeapons = weapons.filter { weapon in
            let r = weapon.rarity.rawValue
            return r >= chosenMonster.minRarity.rawValue &&
                   r <= chosenMonster.maxRarity.rawValue
        }

        let weapon = validWeapons.randomElement()!

        return BattleMonster(
            prefab: chosenMonster,
            weapon: weapon,
            difficulty: difficulty
        )
    }
}