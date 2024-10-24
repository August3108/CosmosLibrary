//
//  ContentDetailView.swift
//  Cosmo Library
//
//  Created by Rahul Jha on 22/07/24.
//

import Foundation
import SwiftUI

struct ContentDetailView : View {
    @Environment(\.dismiss) var dismiss
    @State var title : String
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    HStack{
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.textcolor)
                    }.modifier(ViewTapGesture(){
                        dismiss()
                    })
                    Spacer()
                    Text(title)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.clear)
                }
                
                
            }
        }
    }
}
