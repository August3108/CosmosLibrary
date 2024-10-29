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
                                    handleNavigationToList(title: "Custom Component", listArray: customComponentModelArray)
                                })
                            Text(" ")
                            homeCategoryCardView(name: "Interview Question", img: "systemComponent")
                                .modifier(ViewTapGesture(){
                                    handleNavigationToList(title: "Interview Question", listArray: interviewQuestionDataArray)
                                })

                        }.padding(.vertical)
                        homeCategoryCardView(name: "Interview Question", img: "systemComponent")
                        .modifier(ViewTapGesture(){
                            handleNavigationToList(title: "Interview Question", listArray: UIKITQuestionArray)
                        }).padding(.vertical)

                    }
                    
                    
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
