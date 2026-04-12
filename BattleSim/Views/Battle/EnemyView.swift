import SwiftUI

struct EnemyView: View {
    let enemy: BattleEnemy

    var body: some View {
        VStack {
            Text(enemy.name)
                .font(.headline)

            Healthbar(
                health: enemy.curHp,
                maxHealth: enemy.maxHp
            )
        }
    }
}