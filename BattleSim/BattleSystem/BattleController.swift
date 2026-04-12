//
//  BattleController.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-09.
//

struct BattleController {

    static func performTurn(
        player: inout PlayerObj,
        weaponIndex: Int,
        enemy: inout BattleMonster
    ) -> BattleResult {

        let playerDamage = player.weapons.isEmpty
            ? 1
            : player.weapons[weaponIndex].baseAttack

        let enemyDied = enemy.takeDamage(amount: playerDamage)

        if enemyDied {
            return BattleResult(playerDied: false, enemyDied: true)
        }

        let enemyDamage = enemy.attack + enemy.weapon.baseAttack
        let playerDied = player.takeDamage(amount: enemyDamage)

        return BattleResult(playerDied: playerDied, enemyDied: false)
    }
}

struct BattleResult {
    var playerDied: Bool
    var enemyDied: Bool
}
