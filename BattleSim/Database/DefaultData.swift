import SwiftData

struct DataDefaults{
    static func seedDatabase(context: ModelContext) {

        let monsters = (try? context.fetch(FetchDescriptor<Monsters>())) ?? []
        let weapons = (try? context.fetch(FetchDescriptor<Weapons>())) ?? []

        guard monsters.isEmpty && weapons.isEmpty else { return }

        // insert data...

        let weapons: [Weapons] = [
            // MARK: Common (14)
            Weapons(baseName: "Training Sword", baseAttack: 2, rarity: .Common),
            Weapons(baseName: "Old Dagger", baseAttack: 2, rarity: .Common),
            Weapons(baseName: "Wooden Club", baseAttack: 3, rarity: .Common),
            Weapons(baseName: "Rusty Knife", baseAttack: 3, rarity: .Common),
            Weapons(baseName: "Broken Spear", baseAttack: 3, rarity: .Common),
            Weapons(baseName: "Stone Axe", baseAttack: 4, rarity: .Common),
            Weapons(baseName: "Farm Hoe", baseAttack: 4, rarity: .Common),
            Weapons(baseName: "Basic Bow", baseAttack: 4, rarity: .Common),
            Weapons(baseName: "Iron Shard Blade", baseAttack: 4, rarity: .Common),
            Weapons(baseName: "Short Stick", baseAttack: 2, rarity: .Common),
            Weapons(baseName: "Worn Club", baseAttack: 3, rarity: .Common),
            Weapons(baseName: "Copper Knife", baseAttack: 4, rarity: .Common),
            Weapons(baseName: "Rookie Sword", baseAttack: 5, rarity: .Common),
            Weapons(baseName: "Wooden Spear", baseAttack: 3, rarity: .Common),

            // MARK: Uncommon (8)
            Weapons(baseName: "Iron Dagger", baseAttack: 5, rarity: .Uncommon),
            Weapons(baseName: "Iron Sword", baseAttack: 6, rarity: .Uncommon),
            Weapons(baseName: "Hunter Bow", baseAttack: 6, rarity: .Uncommon),
            Weapons(baseName: "Steel Mace", baseAttack: 7, rarity: .Uncommon),
            Weapons(baseName: "War Spear", baseAttack: 7, rarity: .Uncommon),
            Weapons(baseName: "Reinforced Axe", baseAttack: 8, rarity: .Uncommon),
            Weapons(baseName: "Mercenary Blade", baseAttack: 7, rarity: .Uncommon),
            Weapons(baseName: "Cursed Knife", baseAttack: 6, rarity: .Uncommon),

            // MARK: Rare (5)
            Weapons(baseName: "Flame Sword", baseAttack: 10, rarity: .Rare),
            Weapons(baseName: "Shadow Bow", baseAttack: 11, rarity: .Rare),
            Weapons(baseName: "Frost Spear", baseAttack: 10, rarity: .Rare),
            Weapons(baseName: "Rune Blade", baseAttack: 11, rarity: .Rare),
            Weapons(baseName: "Thunder Axe", baseAttack: 12, rarity: .Rare),

            // MARK: Epic (3)
            Weapons(baseName: "Dragon Slayer", baseAttack: 15, rarity: .Epic),
            Weapons(baseName: "Void Reaver", baseAttack: 17, rarity: .Epic),
            Weapons(baseName: "Celestial Blade", baseAttack: 16, rarity: .Epic)
        ]

        let monsters: [Monsters] = [
            // MARK: Early game (tight ranges)
            Monsters(baseName: "Slime", baseHealth: 10, baseAttack: 2, minRarity: .Common, maxRarity: .Common),
            Monsters(baseName: "Rat", baseHealth: 12, baseAttack: 3, minRarity: .Common, maxRarity: .Common),
            Monsters(baseName: "Goblin", baseHealth: 18, baseAttack: 5, minRarity: .Common, maxRarity: .Uncommon),
            Monsters(baseName: "Wolf", baseHealth: 20, baseAttack: 6, minRarity: .Common, maxRarity: .Uncommon),
            Monsters(baseName: "Skeleton", baseHealth: 22, baseAttack: 6, minRarity: .Common, maxRarity: .Uncommon),

            // MARK: Mid game
            Monsters(baseName: "Bandit", baseHealth: 25, baseAttack: 7, minRarity: .Common, maxRarity: .Rare),
            Monsters(baseName: "Orc", baseHealth: 30, baseAttack: 8, minRarity: .Uncommon, maxRarity: .Rare),
            Monsters(baseName: "Troll", baseHealth: 40, baseAttack: 10, minRarity: .Uncommon, maxRarity: .Rare),
            Monsters(baseName: "Witch", baseHealth: 28, baseAttack: 12, minRarity: .Uncommon, maxRarity: .Epic),

            // MARK: Elite enemies (wide ranges)
            Monsters(baseName: "Dark Knight", baseHealth: 45, baseAttack: 11, minRarity: .Common, maxRarity: .Epic),
            Monsters(baseName: "Vampire", baseHealth: 50, baseAttack: 13, minRarity: .Uncommon, maxRarity: .Epic),
            Monsters(baseName: "Werewolf", baseHealth: 55, baseAttack: 14, minRarity: .Uncommon, maxRarity: .Epic),
            Monsters(baseName: "Necromancer", baseHealth: 48, baseAttack: 14, minRarity: .Common, maxRarity: .Epic),

            // MARK: Elementals (mid-high flexibility)
            Monsters(baseName: "Fire Elemental", baseHealth: 65, baseAttack: 16, minRarity: .Uncommon, maxRarity: .Epic),
            Monsters(baseName: "Ice Elemental", baseHealth: 65, baseAttack: 16, minRarity: .Uncommon, maxRarity: .Epic),

            // MARK: Heavy monsters (rare+)
            Monsters(baseName: "Stone Golem", baseHealth: 70, baseAttack: 10, minRarity: .Rare, maxRarity: .Epic),
            Monsters(baseName: "Dragon Whelp", baseHealth: 80, baseAttack: 18, minRarity: .Rare, maxRarity: .Epic),

            // MARK: Boss tier (full flexibility)
            Monsters(baseName: "Ancient Dragon", baseHealth: 120, baseAttack: 25, minRarity: .Common, maxRarity: .Epic),
            Monsters(baseName: "Void Horror", baseHealth: 150, baseAttack: 30, minRarity: .Uncommon, maxRarity: .Epic)
        ]

        weapons.forEach { context.insert($0) }
        monsters.forEach { context.insert($0) }

        try? context.save()
    }
}
