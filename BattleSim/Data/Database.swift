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
    var baseMaxHP: Int
    var gold: Int
    var difficulty: Float

    //Upgrades
    var goldMulti: Float
    var healthUp: Int

    @Relationship
    var inventory: [PlayerWeapon]

    init(difficulty: Float = 0.5, hp: Int = 50, maxHP: Int = 50, gold: Int = 0, inv: [PlayerWeapon] = []) {
        self.hp = hp
        self.baseMaxHP = maxHP
        self.gold = gold
        self.goldMulti = 1.0
        self.difficulty = difficulty
        self.inventory = inv
    }

    var maxHP: Int {
        baseMaxHP + (healthUp * 5)
    }

    var fullHealCost: Int {
        10 + Int(maxHP / 3)
    }

    var healthUpgradeCost: Int {
        20 + (healthUp * 13)
    }

    var goldUpgradeCost: Int {
        25 + Int((goldMulti - 1.0) * 150)
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

    func FullHeal() {
        guard gold >= fullHealCost else { return }

        gold -= fullHealCost
        self.hp = maxHP
    }

    func UpgradeHealth() {
        guard gold >= healthUpgradeCost else { return }

        gold -= healthUpgradeCost
        healthUp += 1
        Heal(amount:5)
    }

    func UpgradeGold() {
        guard gold >= goldUpgradeCost else { return }

        gold -= goldUpgradeCost
        goldMulti += 0.1
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
