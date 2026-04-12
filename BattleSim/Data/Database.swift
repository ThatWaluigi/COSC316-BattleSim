import SwiftData

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

@Model
class Player {
    var hp: Int
    var maxHP: Int
    var gold: Int

    init(hp: Int = 100, maxHP: Int = 100, gold: Int = 0) {
        self.hp = hp
        self.maxHP = maxHP
        self.gold = gold
    }
}
