import SwiftUI

struct ActionView: View{
    var Return: () -> Void
    @Binding var actionState: PlayerActionState
    
    var body: some View {
        VStack {
            HStack {
                Button("Attack") { 
                    actionState = .attack
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    UIHelper.GetBackground(type: .ButtonUI)
                )
            }

            HStack {
                Button("Defend") { 

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    UIHelper.GetBackground(type: .ButtonUI)
                )

                Button("Run") {
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
