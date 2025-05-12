//
//  WebView.swift
//  Cosmos Library
//
//  Created by Rahul jha on 06/02/25.
//

import Foundation

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct WebViewScreen: View {
    var body: some View {
        WebView(url: URL(string: "https://www.google.com")!)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    WebViewScreen()
}


//DescriptionView(
//    DImage: "",
//    DTitle: "Function Overloading vs. Overriding",
//    DDescription: """
//    **Function Overloading**:  
//    - Allows multiple functions with the same name but different parameters (type, number, or order).  
//    - Enables better code readability and reuse.  
//    - Works at **compile-time** (static polymorphism).  
//
//    **Function Overriding**:  
//    - Redefines a method in a subclass that exists in the parent class.  
//    - The overridden method must have the **same signature** as the parent class method.  
//    - Requires the `override` keyword.  
//    - Works at **runtime** (dynamic polymorphism).  
//    """,
//    sampleView: nil,
//    code: """
//// Function Overloading Example
//func greet() {
//    print("Hello!")
//}
//
//func greet(name: String) {
//    print("Hello, \\(name)!")
//}
//
//greet() // Calls the first function
//greet(name: "Alice") // Calls the overloaded function
//
//// Function Overriding Example
//class Parent {
//    func sayHello() {
//        print("Hello from Parent")
//    }
//}
//
//class Child: Parent {
//    override func sayHello() {
//        print("Hello from Child")
//    }
//}
//
//let person = Child()
//person.sayHello() // Calls the overridden method in Child
//"""
//),
//DescriptionView(
//    DImage: "",
//    DTitle: "Static in Swift",
//    DDescription: """
//    **Static** in Swift refers to a type of property or method that belongs to the class, structure, or enum itself, rather than to instances of the class, structure, or enum. This allows access without creating an instance.
//
//    **Key Points**:
//    - **Static properties** are shared across all instances of a type. They are useful when you need to store a value that is common to all instances.
//    - **Static methods** are functions that belong to the type itself, allowing you to call them without needing to instantiate the type.
//
//    **Usage**:
//    - **Static properties**: Commonly used for constants, counters, or singletons.
//    - **Static methods**: Commonly used for utility functions or factory methods.
//
//    **Differences from Class**: 
//    - `class` allows a method or property to be overridden by subclasses, while `static` cannot be overridden.
//
//    """,
//    sampleView: nil,
//    code: """
//// Static Property Example
//class Counter {
//    static var count = 0 // Static property shared by all instances
//    
//    func increment() {
//        Counter.count += 1
//    }
//    
//    func displayCount() {
//        print("Count: \\(Counter.count)")
//    }
//}
//
//let counter1 = Counter()
//counter1.increment()
//let counter2 = Counter()
//counter2.increment()
//
//counter1.displayCount() // Count: 2
//counter2.displayCount() // Count: 2
//
//// Static Method Example
//class MathUtility {
//    static func add(_ a: Int, _ b: Int) -> Int {
//        return a + b
//    }
//}
//
//let result = MathUtility.add(5, 10) // Calls static method without creating an instance
//print(result) // 15
//"""
//)
//
