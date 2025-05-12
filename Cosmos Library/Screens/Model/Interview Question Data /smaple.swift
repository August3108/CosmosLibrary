//
//  smaple.swift
//  Cosmos Library
//
//  Created by Rahul jha on 24/04/25.
//

import Foundation
import Foundation
import SwiftUI

struct SampleCode : View {
    @State var showSheet: Bool = true

    var body: some View {
        ZStack{
            Color.red.opacity(0.2)
                .ignoresSafeArea()
            VStack{
                Text("Hello World")
                Spacer()
                
            }
            
            if showSheet{
                VStack{
                    
                    HStack{
                        Text("Hello ")
                        Spacer()
                        Text("World")
                    }
                }.frame(height: 40)
                    .background(Color.blue.opacity(0.4))
            }
            
        }
    }

}

#Preview {
    SampleCode()
}

