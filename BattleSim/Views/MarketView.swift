import SwiftUI

struct MarketView: View {

    var Return: () -> Void
    var player: Player
    var context: ModelContext

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
            HStack(spacing: 4) {
                VStack {
                    Spacer()

                    Group{
                        Text("Full Heal (100%)")
                        Spacer()
                        Button("Heal? : \(player.fullHealCost) Gold"){
                            player.FullHeal()
                        }
                    }

                    Group{
                        Text("Max Health (+5)")
                        Spacer()
                        Button("Upgrade? : \(player.healthUpgradeCost) Gold"){
                            player.UpgradeHealth()
                        }
                    }

                    Group{
                        Text("Increase Gold (+10%)")
                        Spacer()
                        Button("Upgrade?: \(player.goldUpgradeCost) Gold"){
                            player.UpgradeGold()
                        }
                    }

                    Spacer()
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
