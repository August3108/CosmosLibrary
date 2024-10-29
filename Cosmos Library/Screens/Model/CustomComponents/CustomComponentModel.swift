//
//  CustomComponentModel.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 28/10/24.
//

import Foundation
import SwiftUI

let customComponentModelArray = [
    generalContentModel(
        id: 93,
        mainImage: "",
        mainTitle: "Creating an Animated Changing Text View in SwiftUI",
        mainDescription: "This guide explains how to build an animated text view that simulates typing effects for different phrases.",
        keywords: ["SwiftUI", "Animation", "Text View"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Define the AnimatedChangingTextView Struct",
                DDescription: "Create a struct conforming to View to build the animated text component.",
                sampleView: nil,
                code: """
    struct AnimatedChangingTextView: View {
        @State var fixedPart: String = "I wanna go to"
        @State var variablePart: String = ""
        @State var variableArray: [String] = ["Shopping", "Mall", "Play football"]
        @State var indicatorView = false
        @State var index = 0
        // Body and functions will be added here
    }
    """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Build the View Body",
                DDescription: "Use an HStack to arrange the fixed part, variable part, and an indicator for animation.",
                sampleView: nil,
                code: """
    var body: some View {
        HStack {
            Text(fixedPart)
            Text(variablePart)
                .foregroundColor(Color.primarycolor)
            Text("\\(indicatorView ? "|" : " ")")
                .frame(width: 2)
                .onAppear(perform: {
                    animateIndicator()
                })
        }.onAppear(perform: {
            handleTextEditing()
        })
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Handle Text Editing",
                DDescription: "Create a function to animate the typing of characters from the variable array.",
                sampleView: nil,
                code: """
    func handleTextEditing() {
        let text = variableArray[index]
        var accumulatedDelay: Double = 0.0

        for character in text {
            DispatchQueue.main.asyncAfter(deadline: .now() + accumulatedDelay) {
                variablePart += String(character)
            }
            accumulatedDelay += 0.3
        }

        let totalAdditionTime = accumulatedDelay
        accumulatedDelay = 0.0

        DispatchQueue.main.asyncAfter(deadline: .now() + totalAdditionTime + 1.0) {
            let characterCount = text.count
            for i in 0..<characterCount {
                DispatchQueue.main.asyncAfter(deadline: .now() + accumulatedDelay) {
                    if !variablePart.isEmpty {
                        variablePart.removeLast()
                    }
                    if i == characterCount - 1 {
                        index += 1
                        if index == variableArray.count {
                            index = 0
                        }
                        handleTextEditing()
                    }
                }
                accumulatedDelay += 0.1
            }
        }
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Animate the Indicator",
                DDescription: "Create a function to toggle the indicator's visibility at regular intervals.",
                sampleView: nil,
                code: """
    func animateIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            indicatorView.toggle()
            animateIndicator()
        }
    }
    """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Complete Code Implementation",
                DDescription: "Here is the complete implementation of the AnimatedChangingTextView.",
                sampleView: AnyView(AnimatedChangingTextView()), // Pass struct in AnyView
                code: """
    import SwiftUI

    struct AnimatedChangingTextView: View {
        @State var fixedPart: String = "I wanna go to"
        @State var variablePart: String = ""
        @State var variableArray: [String] = ["Shopping", "Mall", "Play football"]
        @State var indicatorView = false
        @State var index = 0

        var body: some View {
            HStack {
                Text(fixedPart)
                Text(variablePart)
                    .foregroundColor(Color.primarycolor)
                Text("\\(indicatorView ? "|" : " ")")
                    .frame(width: 2)
                    .onAppear(perform: {
                        animateIndicator()
                    })
            }.onAppear(perform: {
                handleTextEditing()
            })
        }

        func handleTextEditing() {
            let text = variableArray[index]
            var accumulatedDelay: Double = 0.0

            for character in text {
                DispatchQueue.main.asyncAfter(deadline: .now() + accumulatedDelay) {
                    variablePart += String(character)
                }
                accumulatedDelay += 0.3
            }

            let totalAdditionTime = accumulatedDelay
            accumulatedDelay = 0.0

            DispatchQueue.main.asyncAfter(deadline: .now() + totalAdditionTime + 1.0) {
                let characterCount = text.count
                for i in 0..<characterCount {
                    DispatchQueue.main.asyncAfter(deadline: .now() + accumulatedDelay) {
                        if !variablePart.isEmpty {
                            variablePart.removeLast()
                        }
                        if i == characterCount - 1 {
                            index += 1
                            if index == variableArray.count {
                                index = 0
                            }
                            handleTextEditing()
                        }
                    }
                    accumulatedDelay += 0.1
                }
            }
        }

        func animateIndicator() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                indicatorView.toggle()
                animateIndicator()
            }
        }
    }

    #Preview {
        AnimatedChangingTextView()
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 94,
        mainImage: "",
        mainTitle: "Creating a Custom Picker View in SwiftUI",
        mainDescription: "This guide shows how to create a dropdown picker view using a SwiftUI Menu and Picker. In this you can customise how view triggering the picker looks",
        keywords: ["SwiftUI", "Picker", "Menu", "Dropdown"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Define pickerView Struct",
                DDescription: "Define the main struct `pickerView` that conforms to `View`, with a binding for the selected option and a list of options.",
                sampleView: nil,
                code: """
    struct pickerView: View {
        @Binding var selectedOption: Int
        let options: [pickerInputStruct]
        var dropdownAppear: (() -> Void)?
        // Body and functions will follow
    }
    """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Build the Menu for Dropdown",
                DDescription: "Use SwiftUI's `Menu` to create a dropdown interface. The label shows the currently selected option, and an icon.",
                sampleView: nil,
                code: """
    var body: some View {
        Menu {
            Picker(selection: $selectedOption, label: EmptyView()) {
                ForEach(options.indices) { index in
                    Text(options[index].type).tag(index)
                }
            }.pickerStyle(.inline)
                .accentColor(.white)
        } label: {
            HStack {
                Text(options[selectedOption].type)
                Spacer()
                Image(systemName: "chevron.down")
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Explanation of Each Component",
                DDescription: """
    - @Binding selectedOption**: Tracks the selected item in the picker view.
    - options: Array of picker options provided by `pickerInputStruct`.
    - dropdownAppear Closure**: Optional closure for actions when the dropdown appears.
    - Picker: Displays each option in a dropdown list.
    - Menu Label: A label with the selected option and a chevron icon for dropdown indication.
    """,
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Complete Code Implementation",
                DDescription: "Below is the complete code for `pickerView`.",
                sampleView: AnyView(pickerView(selectedOption: .constant(0), options: [
                    pickerInputStruct(id: 1,type: "Option 1"),
                    pickerInputStruct(id: 2,type: "Option 2"),
                    pickerInputStruct(id: 3,type: "Option 3")
                ])),
                code: """
    import SwiftUI

    struct pickerInputStruct {
        var type: String
    }

    struct pickerView: View {
        @Binding var selectedOption: Int
        let options: [pickerInputStruct]
        var dropdownAppear: (() -> Void)?

        var body: some View {
            Menu {
                Picker(selection: $selectedOption, label: EmptyView()) {
                    ForEach(options.indices) { index in
                        Text(options[index].type).tag(index)
                    }
                }.pickerStyle(.inline)
                    .accentColor(.white)
            } label: {
                HStack {
                    Text(options[selectedOption].type)
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
    }

    #Preview {
        pickerView(selectedOption: .constant(0), options: [
            pickerInputStruct(type: "Option 1"),
            pickerInputStruct(type: "Option 2"),
            pickerInputStruct(type: "Option 3")
        ])
    }
    """
            )
        ]
    )

]
