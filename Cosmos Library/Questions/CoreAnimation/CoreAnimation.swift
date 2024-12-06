//
//  CoreAnimation.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 18/09/24.
//

import Foundation
import SwiftUI

struct CoreAnimationView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        // Create a square view
        let squareView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        squareView.backgroundColor = .blue
        view.addSubview(squareView)
        
        // Trigger the animation when the view appears
        DispatchQueue.main.async {
            self.animate(view: squareView)
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed
    }
    
    private func animate(view: UIView) {
        // Create position animation
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = CGPoint(x: 100, y: 100)
        positionAnimation.toValue = CGPoint(x: 300, y: 300)
        positionAnimation.duration = 2.0
        
        // Create opacity animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.0
        opacityAnimation.duration = 2.0
        
        // Create animation group
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [positionAnimation, opacityAnimation]
        animationGroup.duration = 2.0
//        animationGroup.fillMode = .removed
        animationGroup.isRemovedOnCompletion = false
        
        // Add the animation group to the view's layer
        view.layer.add(animationGroup, forKey: "moveAndFade")
        
        // Update the view's position and opacity
        view.layer.position = CGPoint(x: 300, y: 300)
        view.layer.opacity = 0.0
    }
}


#Preview{
    CoreAnimationView()
}
