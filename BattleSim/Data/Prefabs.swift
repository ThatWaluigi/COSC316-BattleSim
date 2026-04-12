class PrefabEnemy{
    var name: String
    var maxHp: Int
    var imageName: String

    init(name:String, maxHp:Int, imageName:String)[
        self.name = name
        self.maxHp = maxHp
        self.imageName = imageName
    ]
}

class PrefabWeapon{
    var name: String
    var baseDamage: Int

    init(name: String, damage: Int){
        self.name = name
        self.baseDamage = damage
    }
}

struct Prefabs {
    // Enemies
    static var allEnemies: [PrefabEnemy] = [

    ]

    // 
    static var allWeapons: [PrefabWeapon] = [

    ]
}