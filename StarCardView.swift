import SwiftUI

struct StarCardView: View {
    let card: MemoryGame<String>.Card

    // A neutral, cross-platform background
    private var surface: Color { Color(.sRGB, red: 0.97, green: 0.97, blue: 0.98, opacity: 1) }

    var body: some View {
        ZStack {
            // BACK of the card
            RoundedRectangle(cornerRadius: 14)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black, Color.indigo]),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.12), lineWidth: 2)
                )
                .opacity(card.isFaceUp ? 0 : 1)

            // FRONT of the card
            RoundedRectangle(cornerRadius: 14)
                .fill(surface)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.yellow.opacity(0.9), lineWidth: 2)
                )
                .overlay(
                    Text(card.content)
                        .font(.system(size: 26, weight: .semibold, design: .rounded))
                        .foregroundColor(.primary)
                )
                .opacity(card.isFaceUp ? 1 : 0)
        }
        .aspectRatio(2/3, contentMode: .fit)
        .rotation3DEffect(.degrees(card.isFaceUp ? 0 : 180), axis: (x: 0, y: 1, z: 0))
        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: card.isFaceUp)
    }
}

