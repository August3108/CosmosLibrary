//
//  homeCategoryCard.swift
//  Cosmo Library
//
//  Created by Rahul jha on 06/06/24.
//

import Foundation
import SwiftUI

struct homeCategoryCardView: View {
    let name: String
    let lightGradient: LinearGradient
    let darkGradient: LinearGradient
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorScheme == .dark ? darkGradient : lightGradient)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
                .overlay(
                    Text(name)
                        .font(.headline)
                        .shadow(radius: 2)
                        .foregroundColor(.white)
                        .padding(5)
                        .cornerRadius(5)
                        .multilineTextAlignment(.center)
                )
        }
    }
}
