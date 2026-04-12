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

    func PlayerAttack(weapon: PlayerWeapon){
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
