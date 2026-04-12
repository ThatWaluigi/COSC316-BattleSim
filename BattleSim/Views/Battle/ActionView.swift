import SwiftUI

struct ActionView: View{

    var onAttack: () -> Void
    var onRun: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button("Attack") { 
                    onAttack()
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
                    onRun()
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
