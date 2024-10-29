//
//  CollectionView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 07/06/24.
//

import Foundation
import SwiftUI

struct ComponentListCardView : View {
    @State var cardData : generalContentModel
    var viewButtonCallback : (() -> Void)?
    var body: some View {
        ZStack{
            VStack{
                HStack(alignment:.top){
                    if cardData.mainImage != ""{
                        Image(cardData.mainImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 125)
                            .cornerRadius(15, corners: .bottomLeft)
                            .cornerRadius(15, corners: .topLeft)
                    }
                    VStack(alignment:.leading, spacing: 5){
                        Text(cardData.mainTitle)
                            .bold()
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                        Text("Tech : \(cardData.technology)")
                            .font(.system(size: 12))
                        Spacer()
                        HStack(alignment:.bottom){
                            HStack {
                                Text("View")
                                Image(systemName: "arrow.right")
                            }
                            .bold()
                            .modifier(buttonView())
                            .modifier(ViewTapGesture(lowerScale: 0.95){
                                viewButtonCallback?()
                            })
                        }
                    }.padding(.horizontal)
                        .padding(.vertical,5)
                    Spacer()
                }.frame(height: 125)
            }

        }.modifier(cardView())
    }
}
#Preview {
    ComponentListCardView(cardData: generalContentModel(id: 1, mainImage: "customComponent", mainTitle: "Component1", mainDescription: "This is lorem text. you may think its not a lorem text but trust me it's lorem and random. Definately not written by me", keywords: ["Drop Down", "SwiftUI"], technology: "SwiftUI", viewComponentDescription: []))
}
