//
//  AnimatedRadio.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 02/11/24.
//

import Foundation
import SwiftUI

struct AnimatedRadio: View {
    @Binding var isChecked: Bool
    @State var selection = ""
    var diameter: CGFloat = 40
    var filledColor: Color = .blue
    var unfilledOutlineColor: Color = .gray

    var body: some View {
        VStack{
            Circle()
                .strokeBorder(isChecked ? filledColor : unfilledOutlineColor, lineWidth: 2) // Outline color and width
                .frame(width: diameter, height: diameter)
                .background(
                    Circle()
                        .fill(filledColor) // Fill color when checked
                        .frame(width: isChecked ? diameter * 0.8 : 0, height: isChecked ? diameter * 0.8 : 0) 
                )
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isChecked.toggle()
                    }
                }
        }
    }
}

struct AnimatedRadioPreview : View {
    @State var isChecked = false
    var body: some View {
        AnimatedRadio(isChecked: $isChecked)
    }
}



#Preview {
    AnimatedRadioPreview()
}
