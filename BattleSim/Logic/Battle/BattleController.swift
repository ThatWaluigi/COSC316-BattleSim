import Combine
import SwiftData

@MainActor
class BattleController: ObservableObject {
    
    @Published var enemy: BattleEnemy?
    @Published var lastEnemyName: String?

    @Published var state: PlayerActionState = .main
    @Published var loot: LootReward?

    private var player: Player?

    func startRandomBattle(context:ModelContext) {
        let prefab = Prefabs.randomEnemy()
        
        JournalLogger.recordEncounter(enemy: prefab, context: context)

        enemy = BattleEnemy(
            prefab: prefab,
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

    func PlayerAttack(weapon: PlayerWeapon, context:ModelContext){
        guard let enemy = enemy else { return }

        if enemy.TakeDamage(amount: weapon.baseDamage){
            JournalLogger.recordDeath(
                enemy: enemy.prefabUsed,
                context: context
            )

            loot = generateLoot()
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


    func generateLoot() -> LootReward {
        guard let enemy = enemy else {
            return LootReward(gold: 0, weapon: nil)
        }

        let baseGold = Int(enemy.maxHp / 6) + Int.random(in: 2...7)

        // small chance to drop weapon
        let dropChance = Double.random(in: 0..<1)

        let weaponDrop: PlayerWeapon? = (dropChance < 0.25) ? 
        PlayerWeapon(
            name: Prefabs.randomWeapon().name,
            damage: Prefabs.randomWeapon().baseDamage,
            rarity: Prefabs.randomWeapon().rarity
        )
        : nil

        return LootReward(gold: baseGold, weapon: weaponDrop)
    }

    func collectLootWeapon() {
        guard let player, let weapon = loot.weapon else { return }
        player.addWeapon(weapon: weapon)
    }

    func replaceWeapon(with weapon: PlayerWeapon, at index: Int) {
        guard let player else { return }
        player.addWeapon(weapon: weapon, slot: index)
    }
    
    func HealDefeatedPlayer(){
        player!.Heal(amount: player!.maxHP / 6)
    }
}

// Battle > Player UI State
enum PlayerActionState {
    case main, attack, victory, defeat
}
