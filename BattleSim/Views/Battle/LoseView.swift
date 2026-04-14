import SwiftUI

struct LoseView: View{

    var Return: () -> Void
    var HealPlayer: () -> Void
    var controller: BattleController
    
    var body: some View {
        VStack {
            HStack {
                Text("You have defeated by \(controller.enemy!.name)")
            }

            HStack {
                Button("Return Home") {
                    HealPlayer()
                    Return()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    UIHelper.GetBackground(type: .ButtonUI)
                )
            }
        }
    }
}
