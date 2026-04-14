import SwiftUI

struct MarketView: View {

    var Return: () -> Void

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            Color.clear
            .frame(height: 40)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )

            // CENTER AREA
            HStack(spacing: 0) {
                VStack {
                    Spacer()

                    //Upgrades
                    //  MaxHealth
                    //  HealtoFull

                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            }

            // BOTTOM BAR
            HStack {
                Button("Back"){
                    Return()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    UIHelper.GetBackground(type: .ButtonUI)
                )
            }
            .frame(height: 70)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )
        }
        .ignoresSafeArea(edges: .all)
    }
}
