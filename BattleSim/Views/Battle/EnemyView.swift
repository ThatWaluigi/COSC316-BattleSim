import SwiftUI

struct EnemyView: View {
    @ObservedObject var enemy: BattleEnemy

    var body: some View {
        VStack {
            Text(enemy.name)
                .font(.title)
                .bold()
                .padding(.top, 24)
            
            Text("Wielding: \(enemy.weapon.name) <\(enemy.weapon.baseDamage)>")
                .font(.subheadline)

            Healthbar(
                health: enemy.curHp,
                maxHealth: enemy.maxHp
            ).padding(.horizontal, 16)
            
            Spacer()
            
            HStack{
                UIHelper.GetEnemyArt(image: "Temp")
            }.padding(20)
        }
        .transition(.scale.combined(with: .opacity))
        .animation(.easeInOut, value: enemy.curHp)
    }
}
