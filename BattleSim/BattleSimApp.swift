//
//  BattleSimApp.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI
import SwiftData

@main
struct BattleSimApp: App {

    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: Monsters.self, Weapons.self, Player.self)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }

        let context = ModelContext(container)
        DataDefaults.seedDatabase(context: context)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}