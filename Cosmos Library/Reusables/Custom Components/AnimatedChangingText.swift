//
//  AnimatedChangingText.swift
//  Cosmo Library
//
//  Created by Rahul jha on 09/06/24.
//

import Foundation
import SwiftUI

struct AnimatedChangingTextView : View {
    @State var fixedPart : String = "I wanna go to"
    @State var variablePart : String = ""
    @State var variableArray : [String] = ["Shopping","Mall", "Play football"]
    @State var indicatorView = false
    @State var index = 0
    var body: some View {
        HStack{
            Text(fixedPart)
            Text(variablePart)
                .foregroundColor(Color.primarycolor)
            Text("\(indicatorView ? "|" : " ")")
                .frame(width: 2)
                .onAppear(perform: {
                    animateIndicator()
                })
        }.onAppear(perform: {
            handleTextEditing()
        })
    }
    func handleTextEditing() {
        let text = variableArray[index]
        var accumulatedDelay: Double = 0.0

        for character in text {
            DispatchQueue.main.asyncAfter(deadline: .now() + accumulatedDelay) {
                variablePart += String(character)
            }
            accumulatedDelay += 0.3
        }

        let totalAdditionTime = accumulatedDelay
        accumulatedDelay = 0.0

        DispatchQueue.main.asyncAfter(deadline: .now() + totalAdditionTime + 1.0 ) {
            let characterCount = text.count
            for i in 0..<characterCount {
                DispatchQueue.main.asyncAfter(deadline: .now() + accumulatedDelay) {
                    if !variablePart.isEmpty {
                        variablePart.removeLast()
                    }
                    if i == characterCount - 1 {
                        index += 1
                        if index == variableArray.count {
                            index = 0
                        }
                        handleTextEditing()
                    }
                }
                accumulatedDelay += 0.1
            }
        }
    }
    func animateIndicator(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
            indicatorView.toggle()
            animateIndicator()
        }
    }
}

#Preview {
    AnimatedChangingTextView()
}
