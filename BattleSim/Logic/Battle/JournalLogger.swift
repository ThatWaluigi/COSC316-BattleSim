struct JournalLogger {
    @Environment(\.modelContext) var context
    @Query var enemies: [Enemy]

    func recordEncounter(prefab: PrefabEnemy) {
        if let existing = enemies.first(where: { $0.name == prefab.name }) {
            existing.timesEncountered += 1
        } else {
            let newEnemy = Enemy(name: prefab.name, maxHP: prefab.maxHp)
            newEnemy.timesEncountered = 1
            context.insert(newEnemy)
        }
    }
}