//
//  ImageSlider.swift
//  Cosmo Library
//
//  Created by Rahul Jha on 31/07/24.
//

import Foundation
import SwiftUI

struct ImageSliderCardView: View {
    @State private var cards: [Card] = [
        Card(title: "Card 1"),
        Card(title: "Card 2"),
        Card(title: "Card 3")
    ]
    
    var body: some View {
        ZStack {
            ForEach(cards.indices, id: \.self) { index in
                CardView(card: cards[index]) {
                    withAnimation{
                        removeCard(at: index)
                    }
                }
                .stacked(at: index, in: cards.count, direction: .top)
            }
        }
//        .actionSheet(isPresented: Binding.constant(true)) {
//                    ActionSheet(
//                        title: Text("Action Sheet Title"),
//                        message: Text("This is an example of an action sheet message."),
//                        buttons: [
//                            .default(Text("Default Button")) {
//                                print("Default button tapped")
//                            },
//                            .destructive(Text("Destructive Button")) {
//                                print("Destructive button tapped")
//                            },
//                            .cancel() {
//                                print("Cancel button tapped")
//                            }
//                        ]
//                    )
//        }
//        
        VStack(alignment: .center, spacing: 2.0) {
            Text("Welcome")
                
        }
        .padding([.top, .leading], 5.0)
        .frame(width: 3.0, height: 1.0)
        

        

        
        
    }
    
    func removeCard(at index: Int) {
        var pushBackCardData = cards[index]
        if cards.indices.contains(index) {
            cards.remove(at: index)
        }
        addCard(data : pushBackCardData)
    }
    func addCard(data : Card){
        cards.insert(data, at: 0)
    }
}


// Define the main App struct
#Preview {
    ImageSliderCardView()
}
