import SwiftUI

struct LoseView: View{

    var Return: () -> Void
    var HealPlayer: () -> Void
    var enemyName: String
    
    var body: some View {
        VStack {
            HStack {
                Text("You have defeated by \(enemyName)")
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
