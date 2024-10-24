//
//  DraggableCard.swift
//  Cosmo Library
//
//  Created by Rahul Jha on 31/07/24.
//

import SwiftUI
struct Card {
    let id: UUID = UUID()
    let title: String
}

struct CardView: View {
    let card: Card
    var removal: (() -> Void)? = nil
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Text(card.title)
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .frame(width: 300, height: 200)
        .rotationEffect(.degrees(Double(offset.width / 10.0)))
        .offset(x: offset.width, y: offset.height)
        .opacity(1 - Double(abs(offset.width / 100)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 || abs(offset.height) > 100 {
                        removal?()
                    } else {
                        withAnimation {
                            offset = .zero
                        }
                    }
                }
        )
    }
}

struct DraggableCardView: View {
    @State private var cards: [Card] = [
        Card(title: "Card 1"),
        Card(title: "Card 2"),
        Card(title: "Card 3")
    ]
    
    var body: some View {
        ZStack {
            ForEach(cards.indices, id: \.self) { index in
                CardView(card: cards[index]) {
                    withAnimation {
                        removeCard(at: index)
                    }
                }
                .stacked(at: index, in: cards.count, direction: .top)
            }
        }
    }
    
    func removeCard(at index: Int) {
        if cards.indices.contains(index) {
            cards.remove(at: index)
        }
    }
}


enum StackDirection {
    case left
    case right
    case top
    case bottom
}


struct StackedModifier: ViewModifier {
    let index: Int
    let totalCount: Int
    let direction: StackDirection
    
    func body(content: Content) -> some View {
        let offsetValue: CGFloat = CGFloat(index) * 5
        let scaleValue: CGFloat = 1 - CGFloat(index) / CGFloat(totalCount) * 0.05 // Reduced the scale effect
        
        return content
            .offset(x: direction == .left ? -offsetValue : (direction == .right ? offsetValue : 0),
                    y: direction == .top ? -offsetValue : (direction == .bottom ? offsetValue : 0))
            .scaleEffect(scaleValue)
    }
}

// Extension to apply the stacking effect with direction
extension View {
    func stacked(at index: Int, in totalCount: Int, direction: StackDirection) -> some View {
        self.modifier(StackedModifier(index: index, totalCount: totalCount, direction: direction))
    }
}

#Preview {
    DraggableCardView()
}
