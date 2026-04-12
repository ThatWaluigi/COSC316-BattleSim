struct Actions: View{
    var body: some View {
        VStack {
            HStack {
                Button("Attack") { }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        GetBackground(type: .ButtonUI)
                    )
            }

            HStack {
                Button("Defend") { }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        GetBackground(type: .ButtonUI)
                    )

                Button("Run") {
                    Return()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    GetBackground(type: .ButtonUI)
                )
            }
        }
    }
}