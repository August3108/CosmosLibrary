//
//  AnimatedTabs.swift
//  Cosmo Library
//
//  Created by Rahul Jha on 22/07/24.
//

import Foundation
import SwiftUI

struct AnimatedTabs : View {
    @State var favoriteColor = ""
    var body: some View {
        ZStack{
            VStack{
                Picker("What is your favorite color?", selection: $favoriteColor) {
                    VStack{
                        Text("Red")
                        if favoriteColor == "red" {
                            HStack{}.background(Color.primary)
                                .frame(height: 5)
                                .frame(width: .infinity)
                        }
                    }.tag(0)
                               Text("Green").tag(1)
                               Text("Blue").tag(2)
                           }
                .pickerStyle(.segmented)
//                           .pickerStyle(.segmented)
                HStack{
                    
                }
            }
        }
    }
}

#Preview {
    AnimatedTabs()
}
