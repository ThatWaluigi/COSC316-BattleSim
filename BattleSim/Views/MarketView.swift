import SwiftUI
import SwiftData

struct MarketView: View {

    var Return: () -> Void
    
    @Query var players: [Player]
    private var player: Player { players.first! }

    var body: some View {
        VStack(spacing: 0) {

            // TOP BAR
            VStack{
                Spacer()
                PlayerHeader()
            }
            .frame(height: 70)
            .padding()
            .background(
                UIHelper.GetBackground(type: .MenuUI)
            )

            // CENTER AREA
            HStack(spacing: 4) {
                VStack(spacing:48) {
                    Spacer()

                    HStack{
                        Text("Full Heal (100%)")
                        Spacer()
                        Button("Heal? \n \(player.fullHealCost) Gold"){
                            withAnimation(.easeInOut) {
                                player.FullHeal()
                            }
                        }
                        .padding(8)
                        .background(
                            UIHelper.GetBackground(type: .ButtonUI)
                        )
                    }
                    .padding()
                    .background(
                        UIHelper.GetBackground(type: .DividerUI)
                    )
                    
                    HStack{
                        Text("Max Health (+5)")
                        Spacer()
                        Button("Upgrade? \n \(player.healthUpgradeCost) Gold"){
                            withAnimation(.easeInOut) {
                                player.UpgradeHealth()
                            }
                        }
                        .padding(8)
                        .background(
                            UIHelper.GetBackground(type: .ButtonUI)
                        )
                    }
                    .padding()
                    .background(
                        UIHelper.GetBackground(type: .DividerUI)
                    )

                    HStack{
                        Text("Increase Gold (+10%)")
                        Spacer()
                        Button("Upgrade? \n \(player.goldUpgradeCost) Gold"){
                            withAnimation(.easeInOut) {
                                player.UpgradeGold()
                            }
                        }
                        .padding(8)
                        .background(
                            UIHelper.GetBackground(type: .ButtonUI)
                        )
                    }
                    .padding()
                    .background(
                        UIHelper.GetBackground(type: .DividerUI)
                    )

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(16)
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
