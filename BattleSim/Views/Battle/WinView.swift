import SwiftUI

struct WinView: View{

    enum WeaponState {
        case normal, pickup, replace
    }

    var Return: () -> Void
    var controller: BattleController

    @State private var state: WeaponState = .normal
    
    var body: some View {
        VStack() {
            Text("Victory!").bold().font(.title)
                .frame(maxWidth: .infinity, alignment: .center)

            VStack(){
                Text("- Rewards -")
                    .frame(maxWidth: .infinity, alignment: .center)

                if let loot = controller.loot {
                    Text("Gold : \(controller.loot!.gold)").foregroundStyle(.yellow)

                    if let weapon = loot.weapon {
                        switch state {
                            case .normal:
                                Text("Huh? That weapon looks good.")
                                HStack{
                                    Text("\(weapon.name) : (\(weapon.baseDamage))")
                                    Button("Collect?"){
                                        if controller.CheckPlayerInventory(){
                                            state = .replace
                                        }
                                        else
                                        {
                                            state = .pickup
                                        }
                                    }
                                    .padding(4)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        UIHelper.GetBackground(type: .ButtonUI)
                                    )
                                }
                            case .pickup:
                                Text("Yeah! This will do good in my hands!")
                                .onAppear(){
                                    controller.collectLootWeapon()
                                }

                            case .replace:
                                Text("Maybe this is better than what I have?")
                                Text("Replace?")
                                HStack {
                                    ForEach(Array(controller.GetPlayerWeapons().enumerated()), id: \.offset) { index, wpn in
                                        Button("\(wpn.name) <\(wpn.baseDamage)>") {
                                            controller.replaceWeapon(with: weapon, at: index)
                                            state = .pickup
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(UIHelper.GetBackground(type: .ButtonUI))

                                }
                            }
                        }
                    }
                }
            }
            
            if state != .replace {
                Spacer()
                
                Button("Return Home") {
                    controller.collectGold()
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
