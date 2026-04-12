import SwiftData

struct JournalLogger {
    func recordEncounter(prefab: PrefabEnemy, context: ModelContext, enemies: [Enemy]) {
        if let existing = enemies.first(where: { $0.name == prefab.name }) {
            existing.timesEncountered += 1
        } else {
            let newEnemy = Enemy(name: prefab.name, maxHP: prefab.maxHp)
            newEnemy.timesEncountered = 1
            context.insert(newEnemy)
        }
    }
}
