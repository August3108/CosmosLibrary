//
//  CustomAnimation.swift
//  Cosmos Library
//
//  Created by Rahul jha on 25/11/24.
//

import Foundation
import SwiftUI

struct PulseEffect: AnimatableModifier {
    var scale: CGFloat

    var animatableData: CGFloat {
        get { scale }
        set { scale = newValue }
    }

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
    }
}

extension View {
    func pulseEffect(scale: CGFloat) -> some View {
        self.modifier(PulseEffect(scale: scale))
    }
}

struct AnimatableModifierView: View {
    @State private var isPulsing = false

    var body: some View {
        Circle()
            .fill(Color.purple)
            .frame(width: 100, height: 100)
            .pulseEffect(scale: isPulsing ? 1.5 : 1.0)
            .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isPulsing)
            .onAppear {
                isPulsing = true
            }
    }
}

#Preview {
    AnimatableModifierView()
}
