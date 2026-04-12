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
        VStack {
            List {
                ForEach(Prefabs.allEnemies, id: \.name) { prefab in
                    
                    if let found = enemies.first(where: { $0.name == prefab.name }) {
                        
                        // KNOWN
                        VStack(alignment: .leading) {
                            Text(found.name)
                            Text("HP: \(found.maxHP)")
                                .font(.caption)
                            Text("Seen: \(found.timesEncountered)x")
                                .font(.caption2)
                        }
                        
                    } else {
                        
                        // UNKNOWN
                        ZStack {
                            Rectangle()
                                .fill(Color.black)
                                .frame(height: 50)
                            
                            Text("?")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                }
            }

            Button("Back") {
                Return()
            }
        }
    }
}
