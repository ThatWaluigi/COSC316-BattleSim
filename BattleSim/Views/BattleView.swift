import SwiftUI
import SwiftData

struct BattleView: View {

    @Binding var player: PlayerObj
    @Environment(\.modelContext) private var context

    @State private var enemy: BattleMonster?

    var Return: () -> Void

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                Spacer()
            }
            .frame(height: 35)
            .padding()
            .background(Image("MenuUI").resizable(
                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                resizingMode: .tile
            ))

            HStack(spacing: 0) {

                VStack { Spacer() }
                    .frame(maxWidth: 15)
                    .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))

                VStack {
                    if let enemy = enemy {
                        Text(enemy.name)
                        Text("HP: \(enemy.health)/\(enemy.maxHealth)")
                    } else {
                        Text("No enemy")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)

                VStack { Spacer() }
                    .frame(maxWidth: 15)
                    .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))
            }

            HStack {
                VStack {

                    HStack {
                        Text("Health: ").bold()
                        Spacer()
                        Healthbar(health: player.health, maxHealth: player.maxHealth)
                    }
                    .padding(3)
                    .background(Image("DividerUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))

                    HStack {
                        Button("Attack") {

                            guard var enemy else { return }

                            let result = BattleController.performTurn(
                                player: &player,
                                weaponIndex: 0,
                                enemy: &enemy
                            )

                            self.enemy = enemy

                            if result.enemyDied {
                                self.enemy = EnemyGen.generateEnemy(
                                    context: context,
                                    difficulty: 0.5
                                )
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Image("ButtonUI").resizable(
                            capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                            resizingMode: .tile
                        ))
                    }

                    HStack {
                        Button("Defend") { }

                        Button("Run") { }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Image("ButtonUI").resizable(
                        capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                        resizingMode: .tile
                    ))
                }

                Spacer()
            }
            .frame(height: 150)
            .padding()
            .background(Image("MenuUI").resizable(
                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                resizingMode: .tile
            ))
        }
        .ignoresSafeArea(edges: .all)
        .onAppear {
            enemy = EnemyGen.generateEnemy(context: context, difficulty: 0.5)
        }
    }
}