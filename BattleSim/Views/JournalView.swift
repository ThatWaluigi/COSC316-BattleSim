//
//  JournalView.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-09.
//

import SwiftUI
import SwiftData

struct JournalView: View {
    var Return: () -> Void

    @Query var enemies: [Enemy]
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
            HStack(spacing: 0) {
                ScrollView{
                    ForEach(Prefabs.allEnemies, id: \.name) { prefab in
                        
                        if let found = enemies.first(where: { $0.name == prefab.name }) {
                            
                            // KNOWN
                            VStack(alignment: .leading) {
                                HStack{
                                    Spacer()
                                    Text(found.name).font(.headline).bold()
                                    Spacer()
                                }

                                HStack{
                                    Text("Seen: \(found.timesEncountered)x")
                                        .font(.caption).bold()
                                    
                                    Spacer()
                                    
                                    Text("Killed: \(found.timesKilled)x")
                                        .font(.caption).bold()
                                }
                            }
                            .padding(4)
                            .background (
                                UIHelper.GetBackground(type: .DividerUI)
                            )
                            
                        }
                        else {
                            
                            // UNKNOWN
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(height: 50)
                                
                                Text("?")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                            }
                            .padding(4)
                        }
                    }
                    .padding(24)
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
    
//    var body: some View {
//        VStack {
//            List {
//                ForEach(Prefabs.allEnemies, id: \.name) { prefab in
//                    
//                    if let found = enemies.first(where: { $0.name == prefab.name }) {
//                        
//                        // KNOWN
//                        VStack(alignment: .leading) {
//                            Text(found.name)
//                            Text("HP: \(found.maxHP)")
//                                .font(.caption)
//                            Text("Seen: \(found.timesEncountered)x")
//                                .font(.caption2)
//                        }
//                        
//                    }
//                    else {
//                        
//                        // UNKNOWN
//                        ZStack {
//                            Rectangle()
//                                .fill(Color.black)
//                                .frame(height: 50)
//                            
//                            Text("?")
//                                .foregroundColor(.white)
//                                .font(.title)
//                        }
//                    }
//                }
//            }

}
