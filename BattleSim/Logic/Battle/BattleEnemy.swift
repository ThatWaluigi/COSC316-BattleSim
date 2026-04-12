class BattleEnemy{
    var name: String
    var curHp: Int
    var maxHp: Int
    var imageName: String

    init(name:String, maxHp:Int, imageName:String){
        self.name = name
        self.curHp = maxHp
        self.maxHp = maxHp
        self.imageName = imageName
    }
}