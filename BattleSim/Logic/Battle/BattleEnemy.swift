class BattleEnemy{
    var name: String
    var curHp: Int
    var maxHp: Int
    var imageName: String

    var weapon: PrefabWeapon

    init(name:String, maxHp:Int, imageName:String, weapon:PrefabWeapon){
        self.name = name
        self.curHp = maxHp
        self.maxHp = maxHp
        self.imageName = imageName
        self.weapon = weapon
    }
}