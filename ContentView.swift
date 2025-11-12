import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GalacticMemoryGame()
    
    private let columns = [GridItem(.adaptive(minimum: 90, maximum: 160), spacing: 12)]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Text("Galactic Match - Star Wars Memory")
                    .font(.system(size: 26, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                // --- NEW CODE START ---
                VStack(alignment: .leading) {
                    Text("Progress")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    ProgressView(value: viewModel.progress)
                        .accentColor(.blue) // Optional: Change color
                }
                .padding(.horizontal)
                // --- NEW CODE END ---
                
                HStack {
                    Text("Score: \(viewModel.score)")
                        .font(.headline)
                    Spacer()
                    Button { viewModel.newGame() } label: {
                        Label("Restart", systemImage: "arrow.clockwise")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(viewModel.cards) { card in
                            StarCardView(card: card)
                                .onTapGesture { viewModel.choose(card) }
                                .padding(4)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("LAB 3")
            .background(
                LinearGradient(
                    colors: [Color.black.opacity(0.15), Color.blue.opacity(0.15)],
                    startPoint: .top, endPoint: .bottom
                )
            )
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


