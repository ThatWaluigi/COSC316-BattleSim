import SwiftData

// For Journal Logging
@Model
class Enemy {
    var name: String
    var maxHP: Int
    var timesEncountered: Int
    var timesKilled: Int

    init(name: String, maxHP: Int) {
        self.name = name
        self.maxHP = maxHP
        self.timesEncountered = 0
        self.timesKilled = 0
    }
}

// Acts as the save file
@Model
class Player {
    var hp: Int
    var maxHP: Int
    var gold: Int

    @Relationship
    var inventory: [PlayerWeapon]

    init(hp: Int = 100, maxHP: Int = 100, gold: Int = 0, inv: [PlayerWeapon] = []) {
        self.hp = hp
        self.maxHP = maxHP
        self.gold = gold
        self.inventory = inv
    }

    func TakeDamage(amount:Int) -> Bool{
        hp = max(hp - amount, 0)

        return hp <= 0
    }

    func Heal(amount:Int){
        hp = min(hp + amount, maxHP)
    }
}

@Model
class PlayerWeapon {
    var name: String
    var baseDamage: Int
    var rarityStr: String

    init(name: String, damage: Int, rarity:WeaponRarity){
        self.name = name
        self.baseDamage = damage
        self.rarityStr = rarity.rawValue
    }

    var rarity: WeaponRarity{
        WeaponRarity(rawValue: rarityStr)
    }
}
