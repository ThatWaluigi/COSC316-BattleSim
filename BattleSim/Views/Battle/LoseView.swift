import SwiftUI

struct LoseView: View{

    var Return: () -> Void
    var controller: BattleController
    
    var body: some View {
        VStack {
            HStack {
                Text("You have defeated by \(controller.enemy!.name)")
            }

            HStack {
                Button("Return Home") {
                    controller.HealDefeatedPlayer()
                    controller.DecreaseDifficulty()
                    Return()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.black)
                .background(
                    UIHelper.GetBackground(type: .ButtonUI)
                )
            }
        }
    }
}
