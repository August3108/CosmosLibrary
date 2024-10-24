//
//  ContentView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import SwiftUI

struct SplashView: View {
    @State var splashEnd = false
    var body: some View {
        if splashEnd{
            HomeView()
        }else {
            ZStack{
                Color.splash
                    .ignoresSafeArea(.all)
                Image("applogoimg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350)
                
                VStack {
                    Spacer()
                    HStack{
                        Text("Cosmo Library")
                        Spacer()
                        Text("Created By Rahul")
                        
                        
                    }
                }.font(.system(size: 2))
                    .padding()
            }.onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.interactiveSpring()) {
                        splashEnd = true
                    }
                    }
            })
        }
    }
}
#Preview {
    SplashView()
}
