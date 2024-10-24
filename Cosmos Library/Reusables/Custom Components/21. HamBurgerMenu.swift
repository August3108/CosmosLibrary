//
//  Menu.swift
//  StarterKit
//
//  Created by Rahul jha on 11/03/24.
//

import Foundation
import SwiftUI

struct HamBurgerMenuPreview : View {
    @State var showMenu = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                        Image(systemName: "line.3.horizontal")
                            .onTapGesture{
                                showMenu = true
                                print("showmen", showMenu)
                            }
                    Spacer()
                    
                }
                Spacer()
                Text("Hello World ")
                Spacer()
            }
            if showMenu{
                HamBurgerMenu(showMenu: $showMenu)
            }
        }
    }
}

#Preview {
    HamBurgerMenuPreview()
}
struct HamBurgerMenu : View {
    @State var startAnimation = false
    @Binding var showMenu : Bool
    var body: some View {
        ZStack (alignment:.leading){
            Color.gray.opacity(0.25)
                .ignoresSafeArea(.all)
                .onTapGesture {
                    startAnimation = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showMenu = false
                    }
                }
            
            if startAnimation{
                ZStack{
                    Color.blue
                        .ignoresSafeArea(.all)
                        .cornerRadius(10, corners: .bottomRight)
                        .cornerRadius(10, corners: .topRight)
                    VStack{
                        Text("I am Menu")
                        Text("I am Cool")
                    }
                }.frame(width: 250)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
        }
        .onAppear(perform: {
            withAnimation{
                startAnimation = true
            }
        })
       
        
    }
}
