import SwiftUI

struct EnemyView: View {
    let enemy: BattleEnemy

    var body: some View {
        VStack {
            Text(enemy.name)
                .font(.title)
                .bold()
                .padding(.top, 24)

            Healthbar(
                health: enemy.curHp,
                maxHealth: enemy.maxHp
            ).padding(.horizontal, 16)
            
            Spacer()
            
            HStack{
                UIHelper.GetEnemyArt(enemy.imageName)
            }.padding(20)
        }
    }
}
