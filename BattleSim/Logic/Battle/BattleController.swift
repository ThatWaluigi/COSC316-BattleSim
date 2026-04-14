import Combine
import SwiftData

@MainActor
class BattleController: ObservableObject {
    
    @Published var enemy: BattleEnemy?
    @Published var lastEnemyName: String?

    @Published var state: PlayerActionState = .main

    private var player: Player?

    func startRandomBattle(context:ModelContext) {
        let prefab = Prefabs.randomEnemy()
        
        JournalLogger.recordEncounter(enemy: prefab, context: context)

        enemy = BattleEnemy(
            prefab: prefab,
            weapon: Prefabs.randomWeapon()
        )
    }

    func AssignPlayer(player: Player){
        self.player = player
    }

    func GetPlayerWeapons() -> [PlayerWeapon]{
        guard let player else { return [] }
        return player.inventory
    }
    
    func ChangeState(state: PlayerActionState){
        self.state = state
    }

    func PlayerAttack(weapon: PlayerWeapon, context:ModelContext){
        guard let enemy = enemy else { return }

        if enemy.TakeDamage(amount: weapon.baseDamage){
            JournalLogger.recordDeath(
                enemy: enemy.prefabUsed,
                context: context
            )

            state = .victory
        }
        else{
            EnemyTurn()
        }
    }

    func EnemyTurn(){
        guard let enemy = enemy, let player = player else { return }

        if player.TakeDamage(amount: enemy.weapon.baseDamage){
            state = .defeat
        }
        else{
            state = .main // Start Loop Again
        }
    }
}

// Battle > Player UI State
enum PlayerActionState {
    case main, attack, victory, defeat
}
