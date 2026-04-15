import SwiftUI

struct WeaponView: View{

    var Back: () -> Void
    var playerAttack: (PlayerWeapon) -> Void

    let weapons: [PlayerWeapon]
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(weapons, id: \.name){ slot in
                    Button(action: {
                        playerAttack(slot)
                    })
                    {
                        VStack {
                            Text("\(slot.name)")
                            HStack{
                                Text("\(slot.baseDamage) dmg")
                                Text("|")
                                Text("\(slot.durability) uses")
                            }
                            .padding(4)
                        }
                    }
                    .padding()
                    .background(
                        UIHelper.GetBackground(type: .ButtonUI)
                    )
                }
            }
            
            Spacer()

            Button("Go Back"){
                Back()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                UIHelper.GetBackground(type: .ButtonUI)
            )
        }
    }
}
