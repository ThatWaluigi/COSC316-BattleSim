import SwiftUI

struct WeaponView: View{

    var Back: () -> Void
    var playerAttack: (PrefabWeapon) -> Void

    let weapons: [PrefabWeapon]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(weapons, id: \.self){ slot in
                    Button("\(weapons.name)"){
                        playerAttack(slot)
                    }
                    .padding()
                    .background(
                        UIHelper.GetBackground(type: .ButtonUI)
                    )
                }
            }

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
