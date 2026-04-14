import Combine

@MainActor
class BattleEnemy: ObservableObject{
    var prefabUsed: PrefabEnemy

    @Published var maxHp: Int
    @Published var curHp: Int

    var weapon: PrefabWeapon

    init(prefab: PrefabEnemy, difficulty: Float, weapon: PrefabWeapon){
        self.prefabUsed = prefab
        self.maxHp = Int(Float(prefab.maxHp) * difficulty)
        self.curHp = Int(Float(prefab.maxHp) * difficulty)
        self.weapon = weapon
    }

    var name: String { prefabUsed.name }
    var imageName: String { prefabUsed.imageName }

    func TakeDamage(amount:Int) -> Bool{
        curHp = max(curHp - amount, 0)

        return curHp <= 0
    }
}
