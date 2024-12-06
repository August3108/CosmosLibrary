//
//  PlayGround.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 20/08/24.
//

import Foundation
import SwiftUI


struct matchedGeometrySample : View {
    @State var bool = true
    @Namespace var namespace
    var body: some View {
        VStack{
            Button("toggle"){
                withAnimation(){
                    bool.toggle()
                }
            }
            if bool {
                Text("Hello")
                .matchedGeometryEffect(id: "bg", in: namespace)
                .frame(maxWidth: .infinity,alignment: .leading)
                .frame(height: 10)
            }else {
                Text("Hello")
                .matchedGeometryEffect(id: "bg", in: namespace)
                .frame(maxWidth: .infinity,alignment: .trailing)
            }
        }
        
    }
}
#Preview {
    matchedGeometrySample()
}
struct test : View {

    var body: some View {
        ZStack{
            
        }
        
    }
}
