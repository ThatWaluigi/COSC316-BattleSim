import SwiftUI

struct ActionView: View{
    var Return: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button("Attack") { }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        UIHelper.GetBackground(type: .ButtonUI)
                    )
            }

            HStack {
                Button("Defend") { }
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
