//
//  ReusablesView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import Foundation
import SwiftUI

struct contactIcon : View {
    @State var width : CGFloat = 25
    @State var height : CGFloat = 25
    @State var imgString : String
    @State var openAppOrWebURL : String
    @State var tintColor : Color = Color.textcolor
    @State var scale : CGFloat = 1.0
    
    var body: some View {
        
        Image(imgString)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .foregroundColor(tintColor)
            .frame(width: 20, height: 20)
            .scaleEffect(scale)
            .onTapGesture {
                openAppOrWeb(openAppOrWebURL)
                withAnimation(.interactiveSpring()) {
                                        scale = 0.85
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        withAnimation(.interactiveSpring()) {
                                            scale = 1.0
                                        }
                                    }
            }
            
    }
}


