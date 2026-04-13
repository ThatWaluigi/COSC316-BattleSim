import SwiftUI
import SwiftData

struct JournalLogger {
    static func recordEncounter(enemy: PrefabEnemy, context: ModelContext) {
        @Query var enemies: [Enemy]
        
        if let existing = enemies.first(where: { $0.name == enemy.name }) {
            existing.timesEncountered += 1
        } else {
            let newEnemy = Enemy(name: enemy.name, maxHP: enemy.maxHp,
                                 image: enemy.imageName)
            newEnemy.timesEncountered = 1
            context.insert(newEnemy)
        }
    }
    
    static func recordDeath(enemy: PrefabEnemy, context: ModelContext){
        @Query var enemies: [Enemy]
        
        if let existing = enemies.first(where: { $0.name == enemy.name }) {
            existing.timesKilled += 1
        }
    }
}
