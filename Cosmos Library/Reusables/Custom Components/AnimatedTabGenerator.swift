//
//  AnimatedTabGenerator.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 02/11/24.
//

import Foundation
import SwiftUI

struct AnimatedTabsGenerator: View {
    @State private var addScroll: Bool = false
    @State private var selectedTab: Int = 0
    @State var underlineColor : Color = Color.primarycolor
    @State var backgoundColor : Color = Color.primarycolor.opacity(0.1)
    @State var previousSelectedIndex = 0
    let tabsData: [TabInputStruct]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    VStack (spacing: 0){
                        // Tab indicator
                        if !tabsData.isEmpty, let firstTab = tabsData.first, !firstTab.img.isEmpty {
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: geometry.size.width / CGFloat(tabsData.count), height: 40)
                                .offset(x: CGFloat(selectedTab) * (geometry.size.width / CGFloat(tabsData.count)))
                        }
                        
                        HStack {
                            Text("A")
                                .padding()
                                .foregroundColor(.clear)
                                .frame(width: geometry.size.width / CGFloat(tabsData.count))
                                .background(
                                    Rectangle()
                                        .fill(backgoundColor)
                                        .offset(x: CGFloat(selectedTab) * (geometry.size.width / CGFloat(tabsData.count)))
                                )
                            Spacer()
                        }
                        
                        // Underline for selected tab
                        HStack {
                            Rectangle()
                                .fill(underlineColor) // Use the appropriate color
                                .frame(width: geometry.size.width / CGFloat(tabsData.count), height: 5)
                                .offset(x: CGFloat(selectedTab) * (geometry.size.width / CGFloat(tabsData.count)))
                            Spacer()
                        }
                    }
                    
                    // Tab images and titles
                    VStack {
                        HStack {
                            ForEach(tabsData.indices, id: \.self) { index in
                                let tab = tabsData[index]
                                if !tab.img.isEmpty {
                                    Image(tab.img)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(tabsData.indices, id: \.self) { index in
                                let tab = tabsData[index]
                                TabStructureAnimated(currentTab: index, tabTitle: tab.name, selectedTab: $selectedTab) {previous, current in
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        previousSelectedIndex = previous
                                        selectedTab = current
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                if !tabsData.isEmpty {
                    tabsData[selectedTab].tabContent
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.001))
            .modifier(DragGestureModifier(selectedTab: $selectedTab, upperLimit: tabsData.count - 1, lowerLimit: 0))
            .padding(1)
        }
    }
}
struct TabStructureAnimated : View {
    let currentTab : Int
    let tabTitle : String
    @Binding var selectedTab : Int
    
    @State var underlineColor : Color = Color.primarycolor
    @State var underlineHeight : CGFloat = 4
    var onTabChange: ((_ previousTab: Int,_ currentTab : Int)->Void)?


    var body: some View {
        VStack(spacing: 0){
         Text(tabTitle)
                .foregroundColor(selectedTab == currentTab ? underlineColor : Color.textcolor)
                .bold()
        }.onTapGesture {
            onTabChange?(selectedTab, currentTab)
        }
        .frame(maxWidth: .infinity)
        .padding(0)
    }
}

#Preview{
    VStack{
        AnimatedTabsGenerator(
            tabsData: [
                TabInputStruct(name: "one", tabContent: AnyView(
                    ZStack{
                        Color.yellow
                        Text("one")
                            .frame(maxWidth: .infinity)
                        Spacer()
                    }
                )),
                TabInputStruct(name: "two", tabContent: AnyView(
                    ZStack{
                        Color.red
                        Text("twoddfg")
                            .frame(maxWidth: .infinity)
                        Text("askjdbnajksd")
                        Spacer()
                    }
                )),
                TabInputStruct(name: "three", tabContent: AnyView(
                    ZStack{
                        Color.blue
                        Text("threee")
                        Text("threee")
                        Text("threee")
                        Text("threee")
                            .frame(maxWidth: .infinity)
                        Spacer()
                    }.background(.blue)
                )),
                TabInputStruct(name: "four", tabContent: AnyView(
                    ZStack{
                        Text("four")
                            .frame(maxWidth: .infinity)
                        Spacer()
                    }.background(.green)
                ))
                
                
            ]
        )
    }
}

