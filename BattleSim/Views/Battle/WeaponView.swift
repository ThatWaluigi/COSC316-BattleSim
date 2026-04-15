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
                        VStack(spacing:4) {
                            Text("\(slot.name)")
                                .font(.headline)
                                .foregroundStyle(.black).bold()
                            Text("\(slot.baseDamage) Dmg")
                                .foregroundStyle(.black)
                            Text("\(slot.durabilityStr) Uses")
                                .foregroundStyle(.black)
                        }
                    }
                    .padding(12)
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
            .foregroundStyle(.black)
            .background(
                UIHelper.GetBackground(type: .ButtonUI)
            )
        }
    }
}
