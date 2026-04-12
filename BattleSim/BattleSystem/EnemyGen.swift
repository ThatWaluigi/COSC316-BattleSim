struct EnemyGen {
    static func generateEnemy(from Monsters: [Monsters], weapons: [Weapons], difficulty: Float) -> BattleMonster{
        let chosenMonster = Monsters.randomElement()!
        
        let validWeapons = weapons.filter {weapon in
            let rarity = weapon.rarity.rawValue

            rarity >= chosenMonster.minRarity.rawValue && rarity <= chosenMonster.maxRarity.rawValue
        }

        let weapon = validWeapons.randomElement()

        return BattleMonster(prefab: chosenMonster, weapon: weapon)
    }
}