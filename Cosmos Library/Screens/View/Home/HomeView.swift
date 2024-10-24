//
//  HomeView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import Foundation
import SwiftUI

struct HomeView : View {


    @State var showMenu = false
//    MARK: Navigation Data
    @State var navigateToListView : Bool = false
    @State var navListArray : [generalContentModel] = []
    @State var navListTitle = ""

    @State var navigateToProfile = false

    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        Image(systemName: "line.3.horizontal")
                            .modifier(ViewTapGesture(){
                                withAnimation{
                                    showMenu = true
                                }
                            })
                        Spacer()
                        Image(systemName: "magnifyingglass")

                    }.padding(.vertical)
                    ScrollView(showsIndicators:false){
                        homeCategoryCardView(name: "System Component", img: "systemComponent")
                            .modifier(ViewTapGesture(){
                                print("clicked")
                                handleNavigationToList(title: "Systen Component", listArray: [])
                            })
                        HStack{
                            homeCategoryCardView(name: "Custom Component", img: "customComponent")
                                .modifier(ViewTapGesture(){
                                    print("clicked")
                                    handleNavigationToList(title: "Custom Component", listArray: sampleListData)
                                })
                            Text(" ")
                            homeCategoryCardView(name: "System Component", img: "systemComponent")
                                .modifier(ViewTapGesture(){
                                    print("clicked")
                                    handleNavigationToList(title: "Systen Component", listArray: [])
                                })

                        }.padding(.vertical)

                    }
                    
                    FormTextField(label: "Hellp", hint: "enter", inputBinding: $navListTitle, regex: "^[0-9]{0,2}[A-Z]{0,5}[0-9]{0,4}[A-Z]{0,1}[A-Z0-9]{0,1}Z{0,1}[A-Z0-9]{0,1}$")
                    Spacer()
                }.padding(.horizontal)
                VStack{
                    HamburgerIntroView(navigateToProfile: $navigateToProfile, showHamburger: $showMenu)
                }
            }
//            MARK: navigations Here
            .navigationDestination(isPresented: $navigateToListView) {
                ListView(listArray: navListArray,
                         title: navListTitle)
              }
            .navigationDestination(isPresented: $navigateToProfile) {
                MyResumeView().navigationBarBackButtonHidden(true)
              }
        }
    }
    func handleNavigationToList(title : String, listArray : [generalContentModel]){
        navListTitle = title
        navListArray = listArray
        navigateToListView = true

    }
}

#Preview {
    HomeView()
}
