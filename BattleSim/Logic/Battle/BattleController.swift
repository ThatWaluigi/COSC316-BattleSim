import Combine

@MainActor
class BattleController: ObservableObject {
    
    @Published var enemy: BattleEnemy?
    @Published var state: PlayerActionState = .main

    func startBattle(with prefab: PrefabEnemy) {
        enemy = BattleEnemy(
            name: prefab.name,
            maxHp: prefab.maxHp,
            imageName: prefab.imageName
        )
    }
    
    func ChangeState(state: PlayerActionState){
        self.state = state
    }

    func PlayerAttack(weapon: PrefabWeapon){
        
    }
}

// Battle > Player UI State
enum PlayerActionState {
    case main, attack, victory, defeat
}
