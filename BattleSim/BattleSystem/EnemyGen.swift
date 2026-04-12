import SwiftData

struct EnemyGen {

    static func generateEnemy(
        context: ModelContext,
        difficulty: Float
    ) -> BattleMonster {

        let monsters = (try? context.fetch(FetchDescriptor<Monsters>())) ?? []
        let weapons = (try? context.fetch(FetchDescriptor<Weapons>())) ?? []

        guard let chosenMonster = monsters.randomElement() else {
            return BattleMonster(
                prefab: Monsters(baseName: "Fallback", baseHealth: 10, baseAttack: 1, minRarity: .Common, maxRarity: .Common),
                weapon: Weapons(baseName: "Fist", baseAttack: 1, rarity: .Common),
                difficulty: difficulty
            )
        }

        let validWeapons = weapons.filter { weapon in
            let rarity = weapon.rarity.rawValue
            return rarity >= chosenMonster.minRarity.rawValue &&
                   rarity <= chosenMonster.maxRarity.rawValue
        }

        let weapon = validWeapons.randomElement()
            ?? Weapons(baseName: "Fist", baseAttack: 1, rarity: .Common)

        return BattleMonster(prefab: chosenMonster, weapon: weapon, difficulty: difficulty)
    }
}