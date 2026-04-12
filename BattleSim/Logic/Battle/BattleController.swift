import Combine

@MainActor
class BattleController: ObservableObject {
    
    @Published var enemy: BattleEnemy?
    @Published var state: PlayerActionState = .main

    private var player: Player?

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
        guard let enemy = enemy else { return }

        if enemy.TakeDamage(amount: weapon.baseDamage){
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
