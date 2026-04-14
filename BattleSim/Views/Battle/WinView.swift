import SwiftUI

struct WinView: View{

    var Return: () -> Void
    var enemyName: String
    
    var body: some View {
        VStack {
            HStack {
                Text("You have defeated \(enemyName)")

                //Show Rewards
                // Allow gaining enemy weapon if chance hit
            }

            HStack {
                Button("Return Home") {
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