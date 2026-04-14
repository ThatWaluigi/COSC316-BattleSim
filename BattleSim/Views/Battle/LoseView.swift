import SwiftUI

struct LoseView: View{

    var Return: () -> Void
    var enemyName: String
    
    var body: some View {
        VStack {
            HStack {
                Text("You have defeated by \(enemyName)")
            }

            HStack {
                Button("Return Home") {
                    // Heal Player to rather 1hp or 1/8 of max

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