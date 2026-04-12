import SwiftUI

@MainActor
class BattleController: ObservableObject {

    @Published var enemy: BattleEnemy?
    @Published var state: PlayerActionState = .main

    func startBattle(with prefab: PrefabEnemy) {
        enemy = BattleEnemy(
            name: prefab.name,
            maxHP: prefab.maxHp,
            imageName: prefab.imageName
        )
    }

    func run() {
        state = .main
    }
}

// Battle > Player UI State
enum PlayerActionState {
    case main, attack, victory, defeat
}