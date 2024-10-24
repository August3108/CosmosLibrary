//
//  ListView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 08/06/24.
//

import Foundation
import SwiftUI

struct ListView : View {
//MARK: - Input required
    @State var listArray : [generalContentModel]
    @State var title : String
//MARK: - Other variables
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                        .modifier(ViewTapGesture(){
                            dismiss()
                        })
                    Spacer()
                    Text(title.capitalizeFirstLetterInAllWords())
                    Spacer()
                }
                .bold()
                .font(.system(size: 20))
                .foregroundColor(Color.primarycolor)
                Text("\n")
                    .font(.system(size: 9))
                if listArray.isEmpty{
                    Spacer()
                    Text("Coming Soon\n")
                        .bold()

                    Text("I am working hard to bring you the contents for \(title). Meanwhile Please checkout my other work...")
                        .multilineTextAlignment(.center)
                    Spacer()
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(listArray, id: \.id){ data in
                            ComponentListCardView(cardData: data)
                                .padding(.vertical,3)
                        }
                    }
                }
            }.padding(.horizontal)
        }.navigationBarBackButtonHidden(true)
    }
}
#Preview {
    ListView(listArray: sampleListData, title: "custom Component")
}
//MARK: - Temp data for Preview
let sampleListData = [ generalContentModel(id: 1, mainImage: "customComponent", mainTitle: "Component1", mainDescription: "This is lorem text. you may think its not a lorem text but trust me it's lorem and random. Definately not written by me", keywords: ["Drop Down", "SwiftUI"], technology: "SwiftUI", viewComponentDescription: []),

    generalContentModel(id: 2, mainImage: "customComponent", mainTitle: "Component1", mainDescription: "This is lorem text. you may think its not a lorem text but trust me it's lorem and random. Definately not written by me", keywords: ["Drop Down", "SwiftUI"], technology: "SwiftUI", viewComponentDescription: [])
]
