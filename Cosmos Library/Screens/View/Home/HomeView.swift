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
    @State var navigateToTest = false
    @Environment(NavigationModel.self) private var navigationModel

    var body: some View {
        @Bindable var navigationModel = navigationModel
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
                        gradientTextView()
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .modifier(ViewTapGesture{
                                var elements : [generalContentModel] = []
                                elements.append(contentsOf: interviewQuestionDataArray)
                                elements.append(contentsOf: customComponentModelArray)
                                elements.append(contentsOf: UIKITQuestionArray)
                                /// NOTE THE MARK BELOW
                                handleNavigationToList(title: "Search Topic", listArray: elements)
                                // MARK: this title affect search logic
                            })

                    }.padding(.vertical)
                    ScrollView(showsIndicators: false) {
                        homeCategoryCardView(
                            name: "Sensors based Components",
                            lightGradient: LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color.blue.opacity(0.6), location: 0.0),
                                    Gradient.Stop(color: Color.blue, location: 1.0)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            darkGradient: LinearGradient(
                                colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.9)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .modifier(ViewTapGesture {
                            handleNavigationToList(title: "Sensors based Components", listArray: sensorComponentData)
                        })
                        
                        HStack {
                            homeCategoryCardView(
                                name: "Custom Component",
                                lightGradient: LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color.purple.opacity(0.7), location: 0.0),
                                        Gradient.Stop(color: Color.pink.opacity(0.7), location: 1.0)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                darkGradient: LinearGradient(
                                    colors: [Color.purple.opacity(0.8), Color.pink.opacity(0.9)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .modifier(ViewTapGesture {
                                handleNavigationToList(title: "Custom Component", listArray: customComponentModelArray)
                            })
                            
                            Spacer()
                            
                            homeCategoryCardView(
                                name: "UIKit Interview Question",
                                lightGradient: LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color.gray.opacity(0.6), location: 0.0),
                                        Gradient.Stop(color: Color.black.opacity(0.6), location: 1.0)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                darkGradient: LinearGradient(
                                    colors: [Color.gray.opacity(0.7), Color.black.opacity(0.8)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .modifier(ViewTapGesture {
                                handleNavigationToList(title: "UIKit Interview Question", listArray: UIKITQuestionArray)
                            })
                        }
                        .padding(.vertical)
                        
                        homeCategoryCardView(
                            name: "SwiftUI Interview Question",
                            lightGradient: LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color.green.opacity(0.6), location: 0.0),
                                    Gradient.Stop(color: Color.green, location: 1.0)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            darkGradient: LinearGradient(
                                colors: [Color.green.opacity(0.7), Color.green.opacity(0.9)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .modifier(ViewTapGesture {
                            handleNavigationToList(title: "SwiftUI Interview Question", listArray: interviewQuestionDataArray)
                        })
                        .padding(.vertical)
                        
                        Button("Navigate"){
                            navigateToTest = true
                        }
                    }

                    
                    
                    Spacer()
                }.padding(.horizontal)
                VStack{
                    HamburgerIntroView(navigateToProfile: $navigateToProfile, showHamburger: $showMenu)
                        .modifier(leftAndRightSwipeGesture(
                            leftSwipe: {
//                                print("left")
                            },
                            rightSwipe: {
                                withAnimation{
                                    showMenu = false
                                }
                            }
                        ))
                }
            }
//            MARK: navigations Here
            .navigationDestination(isPresented: $navigateToListView) {
                ListView(listArray: navListArray,title: navListTitle)
              }
            .navigationDestination(isPresented: $navigateToProfile) {
                MyResumeView().navigationBarBackButtonHidden(true)
              }
            .navigationDestination(isPresented: $navigateToTest) {
                ParentSwiftUIView().navigationBarBackButtonHidden(true)
              }
            .navigationDestination(isPresented: $navigationModel.navigateToComponent) {
                ListView(listArray: navigationModel.selectedComponent ?? UIKITQuestionArray,title: navigationModel.componentTitle ?? "Component")
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


struct gradientTextView : View {
    @State var animateTextGradient = false
    
    var body: some View {
        Text("Cosmos Library")
            .font(.system(size: 20))
            .fontWeight(.black)
            .foregroundColor(Color.clear)
            .background(
                LinearGradient(colors: [.purple, Color.primary], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .hueRotation(.degrees(animateTextGradient ? 45 : 0))
                    .onAppear{
                        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)){
                            animateTextGradient.toggle()
                        }
                    }
                    .mask(Text("Cosmos Library")
                        .font(.system(size: 20))
                        .fontWeight(.black)
                          
                    )
            )
            
    }
    
}


