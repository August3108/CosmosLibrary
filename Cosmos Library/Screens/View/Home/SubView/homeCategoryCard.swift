//
//  homeCategoryCard.swift
//  Cosmo Library
//
//  Created by Rahul jha on 06/06/24.
//

import Foundation
import SwiftUI

struct homeCategoryCardView : View {
    @State var name : String
    @State var img : String
    var body: some View {
        ZStack{
            VStack{
                Image(img)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                Text(name)
                    .bold()
                    .padding(.vertical,6)
                    
            }.modifier(ViewTapGesture(){
                
            })
        }
    }
}
#Preview {
    homeCategoryCardView(name: "HP", img: "HP")
}
