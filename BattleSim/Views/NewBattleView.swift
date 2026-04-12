//
//  NewBattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI

struct ABattleView: View {
    var body: some View {
        VStack() {
            HStack(alignment: .top) {
                Spacer()
            }
            .frame(height: 35)
            .background(Color.blue)
            
            HStack(alignment:.center) {
                VStack{
                    HStack{
                        Spacer()
                    }
                    .frame(maxWidth: 25)
                    .background(Color.red)
                    
                    Spacer()
                    
                    HStack{
                        Text("Middle Bar")
                    }
                    .background(Color.blue)
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                    }
                    .frame(maxWidth: 25)
                    .background(Color.red)
                }
            }
            
            HStack(alignment: .bottom) {
                Spacer()
            }
            .overlay(){
                Text("Bottom Bar")
            }
            .frame(height: 200)
            .background(Color.blue)
            
        }
    }
}

#Preview {
    ABattleView()
}
