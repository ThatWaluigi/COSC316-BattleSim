final class PrefabEnemy{
    let name: String
    let maxHp: Int
    let imageName: String

    init(name:String, maxHp:Int, imageName:String){
        self.name = name
        self.maxHp = maxHp
        self.imageName = imageName
    }
}

enum WeaponRarity: String {
    case common, uncommon, rare, legendary
}

final class PrefabWeapon{
    let name: String
    let baseDamage: Int
    let rarity: WeaponRarity

    init(name: String, damage: Int, rarity:WeaponRarity){
        self.name = name
        self.baseDamage = damage
        self.rarity = rarity
    }
}

struct Prefabs {
    // Enemies
    static let allEnemies: [PrefabEnemy] = [
        PrefabEnemy(name: "Slime", maxHp: 20, imageName: "slime"),
        PrefabEnemy(name: "Rat", maxHp: 18, imageName: "rat"),
        PrefabEnemy(name: "Bat", maxHp: 16, imageName: "bat"),
        PrefabEnemy(name: "Goblin", maxHp: 30, imageName: "goblin"),
        PrefabEnemy(name: "Wolf Pup", maxHp: 25, imageName: "wolf_pup"),

        PrefabEnemy(name: "Skeleton", maxHp: 40, imageName: "skeleton"),
        PrefabEnemy(name: "Bandit", maxHp: 45, imageName: "bandit"),
        PrefabEnemy(name: "Orc Scout", maxHp: 55, imageName: "orc_scout"),
        PrefabEnemy(name: "Wild Boar", maxHp: 50, imageName: "boar"),
        PrefabEnemy(name: "Dark Cultist", maxHp: 60, imageName: "cultist"),

        PrefabEnemy(name: "Stone Golem", maxHp: 90, imageName: "golem"),
        PrefabEnemy(name: "Shadow Wraith", maxHp: 80, imageName: "wraith"),
        PrefabEnemy(name: "Fire Imp", maxHp: 70, imageName: "fire_imp"),
        PrefabEnemy(name: "Cursed Knight", maxHp: 110, imageName: "cursed_knight"),
        PrefabEnemy(name: "Ancient Drake", maxHp: 140, imageName: "drake")
    ]

    // 
    static let allWeapons: [PrefabWeapon] = [
        PrefabWeapon(name: "Small Stick", damage: 3, rarity: .common),
        PrefabWeapon(name: "Rusty Dagger", damage: 5, rarity: .common),
        PrefabWeapon(name: "Wooden Club", damage: 6, rarity: .common),
        PrefabWeapon(name: "Old Sword", damage: 7, rarity: .common),
        PrefabWeapon(name: "Hunting Knife", damage: 8, rarity: .common),
        PrefabWeapon(name: "Broken Spear", damage: 9, rarity: .common),
        PrefabWeapon(name: "Makeshift Axe", damage: 10, rarity: .common),

        PrefabWeapon(name: "Iron Dagger", damage: 12, rarity: .uncommon),
        PrefabWeapon(name: "Short Sword", damage: 14, rarity: .uncommon),
        PrefabWeapon(name: "Iron Axe", damage: 16, rarity: .uncommon),
        PrefabWeapon(name: "War Hammer", damage: 18, rarity: .uncommon),
        PrefabWeapon(name: "Spear", damage: 20, rarity: .uncommon),
        PrefabWeapon(name: "Crossbow", damage: 22, rarity: .uncommon),

        PrefabWeapon(name: "Steel Sword", damage: 25, rarity: .rare),
        PrefabWeapon(name: "Battle Axe", damage: 28, rarity: .rare),
        PrefabWeapon(name: "Halberd", damage: 31, rarity: .rare),
        PrefabWeapon(name: "Longbow", damage: 34, rarity: .rare),
        PrefabWeapon(name: "Mage Staff", damage: 36, rarity: .rare),

        PrefabWeapon(name: "Runed Blade", damage: 40, rarity: .rare),
        PrefabWeapon(name: "Shadow Katana", damage: 43, rarity: .rare),
        PrefabWeapon(name: "Crystal Hammer", damage: 46, rarity: .rare),

        PrefabWeapon(name: "Dragon Slayer", damage: 50, rarity: .legendary),
        PrefabWeapon(name: "Void Greatsword", damage: 52, rarity: .legendary),
        PrefabWeapon(name: "Sunfire Blade", damage: 54, rarity: .legendary),
        PrefabWeapon(name: "Eclipse Reaper", damage: 55, rarity: .legendary)
    ]
}
