//
//  BattleState.swift
//  BattleSim
//

struct BattleState {
    var enemy: BattleMonster
    var battleLog: String = ""
    var isPlayerTurn: Bool = true
    var battleEnded: Bool = false
}