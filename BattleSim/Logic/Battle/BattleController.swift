import Combine

@MainActor
class BattleController: ObservableObject {
    
    @Published var enemy: BattleEnemy?
    @Published var state: PlayerActionState = .main

    var player: Player

    func startBattle(with prefab: PrefabEnemy) {
        enemy = BattleEnemy(
            name: prefab.name,
            maxHp: prefab.maxHp,
            imageName: prefab.imageName,
            weapon: PrefabWeapon(name: "Sword", damage: 10, rarity: .common) //temp
        )
    }

    func AssignPlayer(player: Player){
        self.player = player
    }
    
    func ChangeState(state: PlayerActionState){
        self.state = state
    }

    func PlayerAttack(weapon: PrefabWeapon){
        guard let enemy = enemy, let player = player else { return }

        if let Died = enemy.TakeDamage(weapon.baseAttack){
            state = .victory
        }
        else{
            EnemyTurn()
        }
    }

    func EnemyTurn(){
        guard let enemy = enemy, let player = player else { return }

        if let Died = player.TakeDamage(enemy.weapon.baseAttack){
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
