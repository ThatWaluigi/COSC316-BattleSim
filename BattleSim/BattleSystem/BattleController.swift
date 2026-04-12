//
//  BattleController.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-09.
//

struct BattleController {
    static func performTurn(player: inout PlayerObj, weaponIndex:Int, enemy: inout BattleMonster) -> BattleResult {

        // Player attacks
        let enemyDied = enemy.takeDamage(amount: player.weapons[weaponIndex].baseAttack)

        // Enemy dies
        if enemyDied {
            return BattleResult(playerDied: false, enemyDied: true)
        }

        // Enemy attacks
        let playerDied = player.takeDamage(amount: enemy.attack + enemy.weapon.baseAttack)

        return BattleResult(playerDied: playerDied, enemyDied: false)
    }
}

struct BattleResult {
    var playerDied: Bool
    var enemyDied: Bool
}
