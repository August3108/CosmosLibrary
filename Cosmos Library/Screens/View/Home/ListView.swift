//
//  ListView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 08/06/24.
//

import Foundation
import SwiftUI

struct ListView : View {
//MARK: - Input required
    @State var listArray : [generalContentModel]
    @State var title : String
    @State var navigateToDetail : Bool = false
    @State var navData : generalContentModel?
    @State var searchString : String = ""
    @State var showListWithEmptySearch : Bool = true
//MARK: - Other variables
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                        .modifier(ViewTapGesture(){
                            dismiss()
                        })
                    Spacer()
                    Text(title.capitalizeFirstLetterInAllWords())
                    Spacer()
                }
                .bold()
                .font(.system(size: 20))
                .foregroundColor(Color.primarycolor)
                Text("\n")
                    .font(.system(size: 9))
                if listArray.isEmpty{
                    Spacer()
                    Text("Coming Soon\n")
                        .bold()

                    Text("I am working hard to bring you the contents for \(title). Meanwhile Please checkout my other work...")
                        .multilineTextAlignment(.center)
                    Spacer()
                } else {
                    SearchBar(searchHint: "Search...", delaySecond: 0.5, searchBar: $searchString, searchAction: {
                        
                    }).modifier(paddedOverlay(strokeColor: Color.textcolor.opacity(0.7), paddingAmount: 10))
                        .padding(.bottom, 10)
                    ScrollView(showsIndicators: false) {
                        if searchString != ""{
                            let elements = searchAndRank(listArray: listArray, searchString: searchString)
                            ForEach(elements, id: \.id){ data in
                                if  isKeyContained(data: data){
                                    ComponentListCardView(cardData: data, viewButtonCallback: {
                                        handleNavigationToList(data: data)
                                    })
                                    .padding(.vertical,3)
                                }
                            }
                        }else{
                            ForEach(listArray, id: \.id){ data in
                                if  isKeyContained(data: data){
                                    ComponentListCardView(cardData: data, viewButtonCallback: {
                                        handleNavigationToList(data: data)
                                    })
                                    .padding(.vertical,3)
                                }
                            }
                        }
                    }
                }
            }.padding(.horizontal)
        }.navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToDetail) {
                TopDetailView(data: navData)
              }
    }
    
    func handleNavigationToList(data : generalContentModel){
        navData = data
        navigateToDetail = true
    }
    func isKeyContained(data: generalContentModel) -> Bool {
        let searchWords = searchString.lowercased().components(separatedBy: " ")

        var matches = 0
        var checkedCharacters = Set<Character>() // Track characters checked in mainTitle

        if data.mainTitle.lowercased().contains(where: { character in
            if !checkedCharacters.contains(character) {
                if searchWords.contains(where: { word in
                    return word.contains(character)
                }) {
                    matches += 1
                    checkedCharacters.insert(character) // Mark character as checked
                    return true
                }
            }
            return false
        }) {
            
        }

        
        for keyword in data.keywords {
            if keyword.lowercased().contains(where: { character in
                // Check if character is already checked
                if !checkedCharacters.contains(character) {
                    // Check if character exists in any search word
                    if searchWords.contains(where: { word in
                        return word.contains(character)
                    }) {
                        matches += 1
                        checkedCharacters.insert(character) // Mark character as checked
                        return true // Stop checking further characters in keyword
                    }
                }
                return false
            }) {
                
            }
        }

        let matchPercentage = Double(matches) / Double(searchWords.count)
        return matchPercentage >= 1.0 || (searchString == "" && showListWithEmptySearch)
    }
    
    func searchAndRank(listArray: [generalContentModel], searchString: String) -> [generalContentModel] {
        let searchWords = searchString.lowercased().components(separatedBy: " ").filter { !$0.isEmpty }
        let fullSearchString = searchString.lowercased()
        var rankedArray: [(generalContentModel, Int)] = []

        // Early return if the search string is empty
        guard !searchWords.isEmpty else { return listArray }

        for data in listArray {
            var score = 0
            var matchedWords = Set<String>()
            
            // Title matching
            let title = data.mainTitle.lowercased()

            // Check for matches of each search word in the title
            for word in searchWords {
                if title.contains(word) {
                    score += 100
                    matchedWords.insert(word)
                }
            }

            // Check for substring match for the full search string
            if title.contains(fullSearchString) {
                score += 50
                rankedArray.append((data, score))
                continue // Skip to the next item if there's a match in the title
            }

            // Skip individual search word matching if there's a title match
            // Check for individual search words in title (only if no word was matched)
            if matchedWords.isEmpty {
                for word in searchWords {
                    if title.contains(word) {
                        score += 25
                        matchedWords.insert(word)
                    }
                }
            }

            // Keyword matching (only if no title match was found)
            for keyword in data.keywords {
                let keywordWords = keyword.lowercased().components(separatedBy: " ")
                for word in keywordWords {
                    if searchWords.contains(word) {
                        score += 15
                        matchedWords.insert(word)
                    }
                }
            }

            rankedArray.append((data, score))
        }

        rankedArray.sort { $0.1 > $1.1 }
        
        return rankedArray.map { $0.0 }
    }





    
    
}
#Preview {
    ListView(listArray: sampleListData, title: "custom Component")
}
//MARK: - Temp data for Preview
let sampleListData = [ generalContentModel(id: 1, mainImage: "customComponent", mainTitle: "Component1", mainDescription: "This is lorem text. you may think its not a lorem text but trust me it's lorem and random. Definately not written by me", keywords: ["Drop Down", "SwiftUI"], technology: "SwiftUI", viewComponentDescription: []),

    generalContentModel(id: 2, mainImage: "customComponent", mainTitle: "Component1", mainDescription: "This is lorem text. you may think its not a lorem text but trust me it's lorem and random. Definately not written by me", keywords: ["Drop Down", "SwiftUI"], technology: "SwiftUI", viewComponentDescription: [])
]
