//
//  BattleView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-08.
//

import SwiftUI

struct BattleView: View {
    var body: some View {
        VStack(){
            HStack(alignment: .top){
                Spacer()
            }
            .background(Color.red)
            
            Divider()
            
            HStack(alignment: .center){
                VStack(){
                    Spacer()
                }
                .background(Color.green)
                
                VStack(){
                    Spacer()
                }
                .background(Color.blue)
                
                VStack(){
                    Spacer()
                }
                .background(Color.blue)
                
            }
            
            Divider()
            
            HStack(alignment: .bottom){
                Spacer()
            }
            .background(Color.red)
        }
    }
}

#Preview {
    BattleView()
}
