import SwiftUI

struct WinView: View{

    var Return: () -> Void
    var enemyName: String
    var reward: LootReward
    
    var body: some View {
        VStack {
            HStack {
                Text("- Victory! -").bold()
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("\(enemyName) has been defeated.")
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("- Rewards -").bold()
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("Gold : \(LootReward.gold)").foregroundStyle(.yellow)
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