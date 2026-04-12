//
//  BattleController.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-09.
//

struct BattleController {
    static func performTurn(player: inout PlayerObj, enemy: inout BattleMonster) -> BattleResult {

        // Player attacks
        enemy.health -= player.weapons.first?.baseAttack ?? 5 // Change to player selection later

        // Enemy dies
        if enemy.health <= 0 {
            return BattleResult(playerDied: false, enemyDied: true)
        }

        // Enemy attacks
        let died = player.TakeDamage(amount: enemy.attack)

        return BattleResult(playerDied: died, enemyDied: false)
    }
}

struct BattleResult {
    var playerDied: Bool
    var enemyDied: Bool
}
