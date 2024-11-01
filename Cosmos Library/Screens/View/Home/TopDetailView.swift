//
//  TopDetailView.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 28/10/24.
//

import Foundation
import SwiftUI
import HighlightSwift

struct TopDetailView: View {
    @State var data : generalContentModel?
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
                    Text(data?.mainTitle ?? "")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.primarycolor)
                    Spacer()
                } .padding(.vertical, 10)
                .bold()
                .font(.system(size: 16))
                .foregroundColor(Color.primarycolor)
                Text("\n")
                    .font(.system(size: 9))
                ScrollView(showsIndicators: false) {
                    Text(data?.mainDescription ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14))
                    
                    if let descriptionArray = data?.viewComponentDescription{
                        ForEach(descriptionArray, id: \.id){ data in
                            topDetailViewSubView(cardData: data)
                                .padding(.vertical,5)
                        }
                    }
                }
            }.padding(.horizontal)
        }.navigationBarBackButtonHidden(true)
    }
}

struct topDetailViewSubView: View {
    @State var cardData : DescriptionView?
    
    var body: some View {
        HStack{
            Text(cardData?.DTitle ?? "")
                .fontWeight(.semibold)
                .font(.system(size: 16, weight: .semibold))
                .padding(.bottom, 2)
            Spacer()
        }
        if let image = cardData?.DImage, image != ""{
            Image(image)
        }
        HStack{
            Text(cardData?.DDescription ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 14))
                .padding(.bottom, 2)
        }
        if let code = cardData?.code, code != "" {
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    codeHighlighterView(codeString: code)
                        .font(.system(size: 14))
                }
            }.modifier(cardView())
        }
        if let view = cardData?.sampleView {
            HStack{
                VStack{
                    Divider()
                }
                Text(" Code Output ")
                    .font(.system(size: 8))
                VStack{
                    Divider()
                }
            }
            view
            Divider()
        }
        
    }
    
}

struct codeHighlighterView: View {
    let codeString : String
    let highlight = Highlight()
    @State var calledFunction : Bool = false
    
    @State private var attributedString: AttributedString?
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            if let attributedText = attributedString {
                Text(attributedText)
                    .textSelection(.enabled)
            } else {
                if calledFunction{
                    Text("Failed to load code")
                }else{
                    ProgressView()
                }
            }
        }
        .onAppear {
            Task {
                attributedString = await hightedText()
            }
        }
        .onChange(of: colorScheme){
            Task {
                attributedString = await hightedText()
            }
        }
    }
    
    func hightedText() async -> AttributedString? {
        let someCode = codeString
        
        do {
            let attributedText = try await highlight.attributedText(
                someCode,
                language: "swift",
                colors: colorScheme == .dark ? .dark(.xcode) : .light(.xcode))
            return attributedText
        } catch {
            print("An error occurred: \(error.localizedDescription)")
        }
        return nil
    }
}


import SwiftUI

// Main View with Search Field
struct TopDetailView2: View {
    @State var data: generalContentModel?
    @State private var searchTerm: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .modifier(ViewTapGesture {
                            dismiss()
                        })
                    Spacer()
                    Text(data?.mainTitle ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.primarycolor)
                    Spacer()
                }
                .padding(.vertical, 10)
                
                // Search Bar
                TextField("Search...", text: $searchTerm)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                ScrollView(showsIndicators: false) {
                    hilightedText(str: data?.mainDescription ?? "", searched: searchTerm)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14))
                    
                    if let descriptionArray = data?.viewComponentDescription {
                        ForEach(descriptionArray, id: \.id) { data in
                            topDetailViewSubView2(cardData: data, searchTerm: $searchTerm)
                                .padding(.vertical, 5)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Child View with Search Term Binding
struct topDetailViewSubView2: View {
    @State var cardData: DescriptionView?
    @Binding var searchTerm: String

    var body: some View {
        VStack(alignment: .leading) {
            hilightedText(str: cardData?.DTitle ?? "", searched: searchTerm)
                .font(.system(size: 16, weight: .semibold))
                .padding(.bottom, 2)
            
            if let image = cardData?.DImage, image != "" {
                Image(image)
            }
            
            hilightedText(str: cardData?.DDescription ?? "", searched: searchTerm)
                .font(.system(size: 14))
                .padding(.bottom, 2)
            
            if let code = cardData?.code, code != "" {
                ScrollView(.horizontal, showsIndicators: false) {
                    codeHighlighterView2(codeString: code, searchTerm: searchTerm)
                        .font(.system(size: 14))
                }
            }
            
            if let view = cardData?.sampleView {
                HStack {
                    VStack{
                        Divider()
                    }
                    Text(" Code Output ")
                        .font(.system(size: 8))
                    VStack{
                        Divider()
                    }
                }
                view
                Divider()
            }
        }
    }
}

// Function to Highlight Text
func hilightedText(str: String, searched: String) -> Text {
    guard !str.isEmpty && !searched.isEmpty else { return Text(str) }

    var result: Text!
    let parts = str.components(separatedBy: searched)
    for i in parts.indices {
        result = (result == nil ? Text(parts[i]) : result + Text(parts[i]))
        if i != parts.count - 1 {
            result = result + Text(searched).bold().foregroundColor(.yellow)
        }
    }
    return result ?? Text(str)
}

// Code Highlighter with Search Term Highlighting
struct codeHighlighterView2: View {
    let codeString: String
    let highlight = Highlight()
    @State private var calledFunction: Bool = false
    @State private var attributedString: AttributedString?
    @Environment(\.colorScheme) var colorScheme
    var searchTerm: String

    var body: some View {
        VStack {
            if let attributedText = attributedString {
                Text(attributedText)
                    .textSelection(.enabled)
            } else {
                if calledFunction {
                    Text("Failed to load code")
                } else {
                    ProgressView()
                }
            }
        }
        .onAppear {
            Task {
                attributedString = await highlightedText()
            }
        }
        .onChange(of: colorScheme) { _ in
            Task {
                attributedString = await highlightedText()
            }
        }
    }

    func highlightedText() async -> AttributedString? {
        do {
            var attributedText = try await highlight.attributedText(
                codeString,
                language: "swift",
                colors: colorScheme == .dark ? .dark(.xcode) : .light(.xcode)
            )

            // Apply additional highlight to the search term
            if !searchTerm.isEmpty {
                var searchRange = attributedText.startIndex..<attributedText.endIndex
                
                while let range = attributedText.range(of: searchTerm, options: .caseInsensitive) {
                    attributedText[range].backgroundColor = .yellow
                    attributedText[range].foregroundColor = .black
                    searchRange = range.upperBound..<attributedText.endIndex
                }
            }
            
            return attributedText
        } catch {
            print("An error occurred: \(error.localizedDescription)")
            return nil
        }
    }
}
