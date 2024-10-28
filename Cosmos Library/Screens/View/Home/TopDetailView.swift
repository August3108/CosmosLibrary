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
            codeHighlighterView(codeString: code)
                .font(.system(size: 14))
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
            let attributedText = try await highlight.attributedText(someCode, language: "swift", colors: colorScheme == .dark ? .dark(.xcode) : .light(.xcode))
            return attributedText
        } catch {
            print("An error occurred: \(error.localizedDescription)")
        }
        return nil
    }
}

