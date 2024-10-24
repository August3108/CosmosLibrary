//
//  TabGenerator.swift
//  Cosmo Library
//
//  Created by Rahul jha on 09/06/24.
//

import Foundation
import SwiftUI

struct TabInputStruct{
    let id = UUID()
    @State var img : String = ""//add image in loop if needed
    let name : String
    let tabContent: AnyView
}

struct TabGenerator : View {
    @State var addScroll : Bool = false
    @State var selectedTab : Int = 0
    let tabsData : [TabInputStruct]
    var body: some View {
        VStack{

            
            HStack{

                ForEach(tabsData.indices, id: \.self) { index in
                    let tab = tabsData[index]
                    if tab.img != "" {
                        Image(tab.img)
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
            }

            HStack{
                
                ForEach(tabsData.indices, id: \.self) { index in
                    let tab = tabsData[index]
                    TabStructure(currentTab: index, tabTitle: tab.name, selectedTab: $selectedTab){
                    }
                }
            }
            VStack{
                tabsData[selectedTab].tabContent
                Spacer()
            }.frame(maxWidth: .infinity)
                .background(.black.opacity(0.001))
            .modifier(DragGestureModifier(selectedTab: $selectedTab, upperLimit: tabsData.count-1, lowerLimit: 0))
        }
    }
}

struct TabStructure : View {
    let currentTab : Int
    let tabTitle : String
    @Binding var selectedTab : Int
    @State var underlineColor : Color = Color.primarycolor
    @State var underlineHeight : CGFloat = 4
    var onTabChange: (()->Void)?


    var body: some View {
        VStack{
         Text(tabTitle)
                .foregroundColor(selectedTab == currentTab ? underlineColor : Color.textcolor)
                .bold()
            if selectedTab == currentTab {
                withAnimation(.spring()) {
                    Divider()
                        .frame(height: underlineHeight, alignment: .leading)
                        .background(underlineColor)

                }
            } else {
                withAnimation(.spring()) {
                    HStack{}
                        .frame(height: underlineHeight)
                }
            }
        }.onTapGesture {
            selectedTab = currentTab
            print("Now Selected ", selectedTab)
            onTabChange?()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview{
    VStack{
        TabGenerator(tabsData: [TabInputStruct(name: "one", tabContent: AnyView(
            Text("one")
        )),
                                TabInputStruct(name: "two", tabContent: AnyView(
                                    Text("two")
                                ))
                               
                               ]
                     )
    }
}
