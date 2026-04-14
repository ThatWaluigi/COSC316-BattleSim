import Combine

@MainActor
class BattleEnemy: ObservableObject{
    var prefabUsed: PrefabEnemy

    @Published var curHp: Int

    var weapon: PrefabWeapon

    init(prefab: PrefabEnemy, weapon:PrefabWeapon){
        self.prefabUsed = prefab
        self.curHp = prefab.maxHp
        self.weapon = weapon
    }

    var name: String { prefabUsed.name }
    var maxHp: Int { prefabUsed.maxHp }
    var imageName: String { prefabUsed.imageName }

    func TakeDamage(amount:Int) -> Bool{
        curHp = max(curHp - amount, 0)

        return curHp <= 0
    }
}
