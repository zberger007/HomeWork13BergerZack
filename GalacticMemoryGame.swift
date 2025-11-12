import SwiftUI
import Combine

final class GalacticMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let allCharacters = [
        "Luke Skywalker", "Princess Leia", "Yoda", "Darth Vader",
        "C-3PO", "Han Solo", "Chewbacca", "R2-D2"
    ]
    
    private static func createGame() -> MemoryGame<String> {
        let chosen = Array(allCharacters.shuffled().prefix(6))
        return MemoryGame<String>(numberOfPairsOfCards: chosen.count) { index in
            chosen[index]
        }
    }
    
    @Published private(set) var model = GalacticMemoryGame.createGame()
    
    // Simple placeholder until you track scoring in the model
    var score: Int { 0 }
    
    // --- NEW CODE START ---
    // This allows the View to ask for the progress
    var progress: Double {
        model.progress
    }
    // --- NEW CODE END ---
    
    // MARK: - Intents
    func choose(_ card: Card) { model.choose(card) }
    func newGame() { model = Self.createGame() }
    var cards: [Card] { model.cards }
}

