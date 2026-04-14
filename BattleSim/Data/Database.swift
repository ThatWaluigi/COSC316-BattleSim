import SwiftData

// For Journal Logging
@Model
class Enemy {
    var name: String
    var timesEncountered: Int
    var timesKilled: Int

    init(name: String) {
        self.name = name
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
    var difficulty: Float

    @Relationship
    var inventory: [PlayerWeapon]

    init(difficulty: Float = 0.5, hp: Int = 50, maxHP: Int = 50, gold: Int = 0, inv: [PlayerWeapon] = []) {
        self.hp = hp
        self.maxHP = maxHP
        self.gold = gold
        self.difficulty = difficulty
        self.inventory = inv
    }

    func TakeDamage(amount:Int) -> Bool{
        hp = max(hp - amount, 0)

        return hp <= 0
    }

    func Heal(amount:Int){
        hp = min(hp + amount, maxHP)
    }

    func addGold(gold: Int){
        self.gold += gold
    }

    func addWeapon(weapon: PlayerWeapon, slot: Int? = nil){
        let maxSlots = 3

        // If slot provided, replace it
        if let slot = slot, slot >= 0, slot < maxSlots {
            inventory[slot] = weapon
            return
        }
        
        if inventory.count < maxSlots {
            inventory.append(weapon)
            return
        }
    }

    func inventoryFull() -> Bool{
        return inventory.count >= 3
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
        WeaponRarity(rawValue: rarityStr)!
    }
}
