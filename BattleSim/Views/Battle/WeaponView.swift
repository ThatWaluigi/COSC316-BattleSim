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
                    Button("\(slot.name)"){
                        playerAttack(slot)
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
