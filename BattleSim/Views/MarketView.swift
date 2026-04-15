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
                        VStack{
                            Text("Full Heal (100%)")
                            Text("\(player.fullHealCost) Gold")
                        }
                        Spacer()
                        Button("Heal?"){
                            withAnimation(.easeInOut) {
                                player.FullHeal()
                            }
                        }
                        .padding()
                        .foregroundStyle(.black)
                        .background(
                            UIHelper.GetBackground(type: .ButtonUI)
                        )
                    }
                    .padding()
                    .background(
                        UIHelper.GetBackground(type: .DividerUI)
                    )
                    
                    HStack{
                        VStack{
                            Text("Max Health (+5)")
                            Text("\(player.healthUpgradeCost) Gold")
                        }
                        Spacer()
                        Button("Upgrade?"){
                            withAnimation(.easeInOut) {
                                player.UpgradeHealth()
                            }
                        }
                        .padding()
                        .foregroundStyle(.black)
                        .background(
                            UIHelper.GetBackground(type: .ButtonUI)
                        )
                    }
                    .padding()
                    .background(
                        UIHelper.GetBackground(type: .DividerUI)
                    )

                    HStack{
                        VStack{
                            Text("Increase Gold (+10%)")
                            Text("\(player.goldUpgradeCost) Gold")
                        }
                        Spacer()
                        Button("Upgrade?"){
                            withAnimation(.easeInOut) {
                                player.UpgradeGold()
                            }
                        }
                        .padding()
                        .foregroundStyle(.black)
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
                .foregroundStyle(.black)
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
