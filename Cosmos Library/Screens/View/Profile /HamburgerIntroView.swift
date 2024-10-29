//
//  HamburgerIntroView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import SwiftUI

// MARK: - Subviews

struct HamburgerHeaderView: View {
    @Binding var showHamburger: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Text("About App")
                .bold()
                .font(.system(size: 20))
                .foregroundColor(Color.primarycolor)
                .underline()
                .padding()
            Spacer()
            Image(systemName: "xmark")
                .foregroundColor(Color.primarycolor)
                .modifier(ViewTapGesture() {
                        DispatchQueue.main.async{
                            withAnimation {
                            self.showHamburger = false
                        }
                    }
                })
        }
    }
}

struct HamburgerContentView: View {
    var body: some View {
        HStack {
            Text("Cosmo equips you to build beautiful apps with SwiftUI. Explore custom & system components, conquer challenges, and get ready for future integrations like sensors, notifications, and in-app purchases")
            Image("applogoimg")
                .resizable()
                .frame(width: 80, height: 80)
        }
    }
}

struct HamburgerFooterView: View {
    @Binding var navigateToProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Created By")
                    .foregroundColor(Color.primarycolor)
                    .bold()
                    .font(.system(size: 20))
                    .underline()
                Spacer()
            }
            HStack {
                Image("MyImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                VStack {
                    Text("Rahul Jha")
                        .foregroundColor(Color.primarycolor)
                        .font(.system(size: 20))
                        .bold()
                    Text("iOS Developer")
                        .foregroundColor(Color.primarycolor)
                        .font(.system(size: 12))
                }.padding(.horizontal)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.primarycolor)
            }
            .modifier(paddedOverlay())
            .padding(.vertical)
            
        }
    }
}

// MARK: - Main View

struct HamburgerIntroView: View {
    @Binding var navigateToProfile: Bool
    @Binding var showHamburger: Bool
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if showHamburger {
                withAnimation{
                    Color.black.opacity(0.3)
                        .ignoresSafeArea(.all)
                        .onTapGesture {
                            withAnimation{
                                showHamburger = false
                            }
                        }
                }
            }
            if showHamburger {
                ZStack {
                    Color.clear
                        .blur(radius: 30)
                        .background(.ultraThinMaterial)
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        HamburgerHeaderView(showHamburger: $showHamburger)
                        HamburgerContentView()
                        HamburgerFooterView(navigateToProfile: $navigateToProfile)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: AppConstants.AppScreenWidth * 0.85)
                
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
        }
    }
}

// MARK: - Preview

#Preview {
    HamburgerIntroView(navigateToProfile: Binding.constant(false), showHamburger: Binding.constant(false))
}

