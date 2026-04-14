import SwiftUI
import SwiftData

struct JournalLogger {
    static func recordEncounter(enemy: PrefabEnemy, context: ModelContext) {
        let descriptor = FetchDescriptor<Enemy>()
        let enemies = (try? context.fetch(descriptor)) ?? []

        if let existing = enemies.first(where: { $0.name == enemy.name }) {
            existing.timesEncountered += 1
        } else {
            let newEnemy = Enemy(name: enemy.name)
            newEnemy.timesEncountered = 1
            context.insert(newEnemy)
        }
        try? context.save()
    }
    
    static func recordDeath(enemy: PrefabEnemy, context: ModelContext){
        let descriptor = FetchDescriptor<Enemy>()
        let enemies = (try? context.fetch(descriptor)) ?? []

        if let existing = enemies.first(where: { $0.name == enemy.name }) {
            existing.timesKilled += 1
            try? context.save()
        }else{
            print("Error: No Enemy")
        }
    }
}
