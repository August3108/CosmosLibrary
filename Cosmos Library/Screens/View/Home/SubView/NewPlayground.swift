//
//  NewPlayground.swift
//  Cosmo Library
//
//  Created by Rahul Jha on 29/07/24.
//

import Foundation
import SwiftUI

struct NewPlaygroundView : View {
    @State var text : String = ""
    var body: some View {
        ViewThatFits {
            HStack{
                
                FormTextField(label: "Hellp", hint: "enter", inputBinding: $text, regex: "^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$")
            }
            HStack{
                Text("ajasd")
            }
        }
    }
}
#Preview {
    NewPlaygroundView()
}




import SwiftUI
struct FormTextField: View {
    var addRedStar: Bool = false
    var label: String
    var hint: String
    @Binding var inputBinding: String
    var regex: String? // This should be a flexible regex, allowing partial matches
    var contentType: UITextContentType? = nil
    var imgStr: String?
    var textFieldFont: CGFloat = 14
    var headingFont: CGFloat = 12

    @State private var showErrorMessage: Bool = false
    @State private var errorString: String = "Invalid Input"

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if addRedStar {
                    redStarAdd(text: label)
                } else {
                    Text(label)
                }
                Spacer()
            }

            HStack {
                if let image = imgStr, !image.isEmpty {
                    Image(image)
                }
                TextField(hint, text: $inputBinding)
                    .font(.system(size: textFieldFont))
                    .textContentType(contentType)
                    .onChange(of: inputBinding) { newValue in
                        if let regex = regex {
                            let isValidPartialMatch = isValidPartialInput(input: newValue, regex: regex)
                            showErrorMessage = !isValidPartialMatch
                        }
                    }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(showErrorMessage ? Color.red : Color.gray, lineWidth: 1)
            )
            .padding(0.5)

            if showErrorMessage {
                Text(errorString)
                    .font(.system(size: headingFont))
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
        }
    }

    // Check if the current input is a valid partial match for the regex
    private func isValidPartialInput(input: String, regex: String) -> Bool {
        do {
            let fullPattern = "^" + regex + "$"
            let partialPattern = "^" + regex.replacingOccurrences(of: "{2}", with: "{0,2}") + "$"

            // For gradual validation, we use a non-strict pattern that allows partial matches
            let regex = try NSRegularExpression(pattern: partialPattern)
            let range = NSRange(location: 0, length: input.utf16.count)
            return regex.firstMatch(in: input, options: [], range: range) != nil
        } catch {
            return false
        }
    }
}


