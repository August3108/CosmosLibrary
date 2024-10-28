//
//  InterviewQuestionData.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 28/10/24.
//

import Foundation
import SwiftUI


let interviewQuestionDataArray = [
    generalContentModel(
        id: 32,
        mainImage: "",
        mainTitle: "How do you create a custom ViewModifier?",
        mainDescription: "",
        keywords: [],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Define the Custom ViewModifier",
                DDescription: "To create a custom ViewModifier, define a struct that conforms to the ViewModifier protocol and implement the body(content:) method, which describes how to modify the view.",
                
                sampleView: AnyView(
                    VStack {
                        Text("Example Text")
                            .modifier(CustomStyleModifier()) // Applying modifier
                    }
                ),
                
                code: """
struct CustomStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

Text("Hello, SwiftUI!")
    .modifier(CustomStyleModifier())

// Additionally we can use functions to apply modifier 
extension View {
    func customStyle() -> some View {
        self.modifier(CustomStyleModifier())
    }
}

Text("Hello, SwiftUI!")
    .customStyle()



"""
            )
        ]
    ),
    
    generalContentModel(
        id: 18,
        mainImage: "",
        mainTitle: "What is the purpose of @Binding, and how is it used in SwiftUI?",
        mainDescription: "The @Binding property wrapper in SwiftUI is used to create a two-way connection between a parent view and a child view, allowing the child view to read and modify the state stored in the parent view.",
        keywords: [],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Purpose",
                DDescription: "State Synchronization: It allows a child view to access and modify state data that belongs to its parent, ensuring that the UI stays in sync with the underlying data model.",
                
                sampleView: AnyView(
                    VStack {
                        Text("Example Text")
                            .modifier(CustomStyleModifier()) // Applying modifier
                    }
                ),
                
                code: """
import SwiftUI

struct ParentView: View {
    @State private var name: String = ""

    var body: some View {
        VStack {
            Text("Enter your name:")
            ChildView(name: $name) // Passing a binding to the child view
            Text("Your name is: \\(name)")
        }
        .padding()
    }
}

struct ChildView: View {
    @Binding var name: String // Receiving the binding

    var body: some View {
        TextField("Name", text: $name) // Modifying the bound state
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
// additionally if we need to hard code the binding value we can use Binding.constatnt(value)
// this helps especially in previews

"""
            )
        ]
    )
    
    
]


        struct CustomStyleModifier: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
