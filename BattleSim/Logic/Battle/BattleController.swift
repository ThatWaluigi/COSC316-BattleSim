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
}

// Battle > Player UI State
enum PlayerActionState {
    case main, attack, victory, defeat
}
