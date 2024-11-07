//
//  wordSearch.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 30/10/24.
//

import SwiftUI

// Observable Object for Search Term
class SearchModel: ObservableObject {
    @Published var searchTerm: String = ""
}

// Simplified HighlightedText using ForEach for better performance
struct HighlightedText: View {
    var text: String
    var highlight: String

    var body: some View {
        let parts = text.components(separatedBy: highlight)
        
        HStack(spacing: 0) {
            ForEach(0..<parts.count, id: \.self) { index in
                Text(parts[index])
                    .foregroundColor(.primary)
                
                // Add highlighted text only if it's not the last part
                if index < parts.count - 1 {
                    Text(highlight)
                        .foregroundColor(.yellow)
                        .background(Color.black.opacity(0.2))
                }
            }
        }
    }
}

// Child View to display HighlightedText
struct ChildView: View {
    var text: String
    @ObservedObject var searchModel: SearchModel

    var body: some View {
        HighlightedText(text: text, highlight: searchModel.searchTerm)
            .padding(.vertical, 4)
    }
}

// Main View with Search Field
struct ContentView12: View {
    @StateObject private var searchModel = SearchModel()

    var body: some View {
        VStack {
            TextField("Search...", text: $searchModel.searchTerm)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ScrollView {
                // Pass searchModel to each child view
                ChildView(text: "SwiftUI makes UI development easy.", searchModel: searchModel)
                ChildView(text: "Highlighting text based on search input.", searchModel: searchModel)
                // Add additional child views as needed
            }
        }
        .padding()
    }
}

#Preview{
    ContentView12()
}
