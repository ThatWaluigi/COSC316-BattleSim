//
//  BattleController.swift
//  BattleSim
//

import Foundation

struct BattleController {

    static func startBattle(monsters: [Monsters], weapons: [Weapons], difficulty: Float) -> BattleState {
        let enemy = EnemyGen.generateEnemy(from: monsters, weapons: weapons, difficulty: difficulty)
        return BattleState(enemy: enemy)
    }

    static func playerAttack(
        state: inout BattleState,
        player: PlayerObj,
        weapon: Weapons
    ) -> BattleResult {

        guard !state.battleEnded else {
            return BattleResult(playerDied: false, enemyDied: false)
        }

        let enemyDied = state.enemy.takeDamage(amount: weapon.baseAttack)

        if enemyDied {
            state.battleEnded = true
            return BattleResult(playerDied: false, enemyDied: true)
        }

        state.isPlayerTurn = false
        return enemyTurn(state: &state, player: player)
    }

    static func enemyTurn(state: inout BattleState, player: PlayerObj) -> BattleResult {

        // simple delay hook (UI can animate based on this flag change)
        let damage = state.enemy.attack + state.enemy.weapon.baseAttack
        let playerDied = state.enemy.weapon.baseAttack > 0
            ? state.enemy.weapon.baseAttack + state.enemy.attack > player.health
            : false

        state.isPlayerTurn = true

        return BattleResult(playerDied: playerDied, enemyDied: false)
    }
}

struct BattleResult {
    var playerDied: Bool
    var enemyDied: Bool
}