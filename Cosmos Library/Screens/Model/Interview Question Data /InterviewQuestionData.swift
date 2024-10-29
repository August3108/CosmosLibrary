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
    ),generalContentModel(
        id: 41,
        mainImage: "",
        mainTitle: "Animation Types in SwiftUI",
        mainDescription: "",
        keywords: [],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Implicit Animation",
                DDescription: "Animations which are automatically applies when a state value changes are called implicit animations.\nWe just need to define the start and end value and swiftui takes care of the rest",
                
                sampleView: AnyView(
                    VStack {
                    }
                ),
                
                code: """
import SwiftUI

struct ImplicitAnimationExample: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Button("Tap Me") {
            scale += 0.1 // Update the scale value
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(scale) // Apply scale effect
        .animation(.default, value: scale) // Implicit animation
    }
}
"""
            ),
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "2. Explicit Animation",
                DDescription: "Explicit animations require you to define what should be animated and when it should happen. \nYou specify the animation directly on the views and trigger it based on certain conditions or actions.",
                
                sampleView: nil,
                
                code: """

struct ExplicitAnimationExample: View {
    @State private var opacity: Double = 1.0

    var body: some View {
        VStack {
            Button("Fade Out") {
                withAnimation {
                    opacity = 0.0 // Trigger animation explicitly
                }
            }
            .padding()
            .opacity(opacity) // Bind opacity to state

            Button("Fade In") {
                withAnimation {
                    opacity = 1.0 // Trigger animation explicitly
                }
            }
            .padding()
        }
    }
}
"""
            )
        ]
    ),
    generalContentModel(
            id: 124,
            mainImage: "",
            mainTitle: "How do you create a List view in SwiftUI?",
            mainDescription: "",
            keywords: [],
            technology: "SwiftUI",
            viewComponentDescription: [
                DescriptionView(
                    id: 1,
                    DImage: "",
                    DTitle: "Basic List Implementation",
                    DDescription: "A simple List view displaying static items.",
                    sampleView: nil,
                    code: """
    struct ContentView: View {
        let items = ["Item 1", "Item 2", "Item 3"]

        var body: some View {
            List(items, id: \\.self) { item in
                Text(item)
            }
        }
    }
    """
                ),
                DescriptionView(
                    id: 2,
                    DImage: "",
                    DTitle: "Sticky Section Headers (Title)",
                    DDescription: "Use Section headers to create sticky titles that stay at the top as you scroll.",
                    sampleView: nil,
                    code: """
    struct ContentView: View {
        let items = ["Item 1", "Item 2", "Item 3"]

        var body: some View {
            List {
                Section(header: Text("Title")) {
                    ForEach(items, id: \\.self) { item in
                        Text(item)
                    }
                }
            }
        }
    }
    """
                ),
                DescriptionView(
                    id: 3,
                    DImage: "",
                    DTitle: "UI Updates with @State",
                    DDescription: "SwiftUI automatically updates the UI when the data changes, using @State for dynamic updates.",
                    sampleView: nil,
                    code: """
    @State private var items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        List(items, id: \\.self) { item in
            Text(item)
        }
    }
    """
                ),
                DescriptionView(
                    id: 4,
                    DImage: "",
                    DTitle: "List Row Background",
                    DDescription: "Change the background of individual rows using .listRowBackground.",
                    sampleView: nil,
                    code: """
    List(items, id: \\.self) { item in
        Text(item)
            .listRowBackground(Color.yellow) // Sets background color for each row
    }
    """
                ),
                DescriptionView(
                    id: 5,
                    DImage: "",
                    DTitle: "List Style",
                    DDescription: "SwiftUI offers several list styles to customize the List's appearance.",
                    sampleView: nil,
                    code: """
    List(items, id: \\.self) { item in
        Text(item)
    }
    .listStyle(InsetGroupedListStyle()) // Other styles: PlainListStyle(), GroupedListStyle(), etc.
    """
                ),
                DescriptionView(
                    id: 6,
                    DImage: "",
                    DTitle: "List Separator (Divider) Style",
                    DDescription: "Hide default separators between rows using .listRowSeparator.",
                    sampleView: nil,
                    code: """
    List(items, id: \\.self) { item in
        Text(item)
    }
    .listRowSeparator(.hidden) // Hides row separators
    """
                ),
                DescriptionView(
                    id: 7,
                    DImage: "",
                    DTitle: "UI Updates for Large Data Changes",
                    DDescription: "Use @StateObject or @ObservedObject to handle large data changes in a List view.",
                    sampleView: nil,
                    code: """
    class ItemModel: ObservableObject {
        @Published var items = ["Item 1", "Item 2", "Item 3"]
    }

    struct ContentView: View {
        @StateObject var itemModel = ItemModel()

        var body: some View {
            List(itemModel.items, id: \\.self) { item in
                Text(item)
            }
        }
    }
    """
                ),
                DescriptionView(
                    id: 8,
                    DImage: "",
                    DTitle: "Grouped List Sections",
                    DDescription: "Group data into sections with headers and customize them as needed.",
                    sampleView: nil,
                    code: """
    List {
        Section(header: Text("Group 1")) {
            ForEach(group1Items, id: \\.self) { item in
                Text(item)
            }
        }
        Section(header: Text("Group 2")) {
            ForEach(group2Items, id: \\.self) { item in
                Text(item)
            }
        }
    }
    .listStyle(GroupedListStyle())
    """
                )
            ]
        ),generalContentModel(
            id: 14,
            mainImage: "",
            mainTitle: "What are the main differences between @State and @ObservedObject in SwiftUI?",
            mainDescription: "",
            keywords: [],
            technology: "SwiftUI",
            viewComponentDescription: [
                DescriptionView(
                    id: 1,
                    DImage: "",
                    DTitle: "Purpose of @State",
                    DDescription: """
    1. @State is used for simple data that’s specific to a single view.
    2. It allows a view to own and manage its own data.
    3. SwiftUI automatically re-renders the view whenever the @State value changes.
    """,
                    sampleView: nil,
                    code: """
    struct ContentView: View {
        @State private var counter = 0

        var body: some View {
            VStack {
                Text("Counter: \\(counter)")
                Button("Increment") {
                    counter += 1
                }
            }
        }
    }
    """
                ),
                DescriptionView(
                    id: 2,
                    DImage: "",
                    DTitle: "Purpose of @ObservedObject",
                    DDescription: """
    1. @ObservedObject is used when data is shared between multiple views or exists outside the view.
    2. It observes an external data model conforming to ObservableObject to track changes across views.
    3. This is useful for data that needs to be updated in more than one view or component.
    """,
                    sampleView: nil,
                    code: """
    class CounterModel: ObservableObject {
        @Published var counter = 0
    }

    struct ContentView: View {
        @ObservedObject var counterModel = CounterModel()

        var body: some View {
            VStack {
                Text("Counter: \\(counterModel.counter)")
                Button("Increment") {
                    counterModel.counter += 1
                }
            }
        }
    }
    """
                ),
                DescriptionView(
                    id: 3,
                    DImage: "",
                    DTitle: "Key Differences",
                    DDescription: """
    - Scope: @State is local to a view, whereas @ObservedObject is shared and can be passed between views.
    - Lifecycle: @State is owned by the view itself, while @ObservedObject is typically created outside and managed independently.
    - Use Case: Use @State for view-specific data, and @ObservedObject for data that multiple views need access to.
    """,
                    sampleView: nil,
                    code: """
    // Example of how @ObservedObject can be passed between views
    struct ParentView: View {
        @StateObject var counterModel = CounterModel() // Use @StateObject here to create an instance only once

        var body: some View {
            ChildView(counterModel: counterModel) // Passing @ObservedObject to ChildView
        }
    }

    struct ChildView: View {
        @ObservedObject var counterModel: CounterModel

        var body: some View {
            Text("Counter: \\(counterModel.counter)")
        }
    }
    """
                )
            ]
        ), 
    generalContentModel(
        id: 44,
        mainImage: "",
        mainTitle: "What is the purpose of the onAppear and onDisappear modifiers in SwiftUI?",
        mainDescription: "",
        keywords: [],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Purpose of onAppear",
                DDescription: """
1. Trigger Actions: onAppear runs when a view first appears on the screen.
2. Common Use Cases: Fetching data, starting animations, or initiating background tasks when a view loads.
""",
                sampleView: nil,
                code: """
struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .onAppear {
                print("View appeared!")
                // Perform data fetch or initialization here
            }
    }
}
"""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Purpose of onDisappear",
                DDescription: """
1. Handle Cleanup: onDisappear runs when a view is removed from the screen.
2. Common Use Cases: Stopping timers, saving data, or releasing resources when a view exits.
""",
                sampleView: nil,
                code: """
struct ContentView: View {
    var body: some View {
        Text("Goodbye, SwiftUI!")
            .onDisappear {
                print("View disappeared!")
                // Perform cleanup or save data here
            }
    }
}
"""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Key Points",
                DDescription: """
- Timing: onAppear runs only when a view becomes visible; onDisappear runs when it leaves the screen.
- Lifecycle Events: They help control logic during different phases of a view's lifecycle, enhancing the user experience.
- Limitations: onAppear and onDisappear are triggered by SwiftUI’s navigation or view updates, so their timing depends on SwiftUI’s view lifecycle, not the actual screen visibility.
""",
                sampleView: nil,
                code: """
// Example: Using both onAppear and onDisappear
struct ContentView: View {
    @State private var counter = 0

    var body: some View {
        Text("Counter: \\(counter)")
            .onAppear {
                print("Starting counter")
                counter += 1
            }
            .onDisappear {
                print("Stopping counter")
                counter = 0
            }
    }
}
"""
            )
        ]
    ),
    generalContentModel(
            id: 56,
            mainImage: "",
            mainTitle: "How do you implement a grid layout in SwiftUI using LazyVGrid?",
            mainDescription: "",
            keywords: [],
            technology: "SwiftUI",
            viewComponentDescription: [
                DescriptionView(
                    id: 1,
                    DImage: "",
                    DTitle: "1. Creating a Simple Grid with LazyVGrid",
                    DDescription: """
    1. Define the Columns: Use GridItem to define column sizes for the grid.
    2. Configure the LazyVGrid: Set up the grid layout and provide it with the items you want to display.
    """,
                    sampleView: nil,
                    code: """
    struct GridView: View {
        let columns = [
            GridItem(.flexible()), // Each column takes up equal space
            GridItem(.flexible())
        ]
        
        let items = Array(1...10).map { "Item \\($0)" }
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(items, id: \\.self) { item in
                        Text(item)
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
    }
    """
                ),
                DescriptionView(
                    id: 2,
                    DImage: "",
                    DTitle: "2. Adjusting Column Width and Spacing",
                    DDescription: """
    1. Column Flexibility: Customize column behavior using .fixed, .adaptive, or .flexible.
       - .fixed: Fixed-width column.
       - .adaptive: Column adjusts based on content and available space.
       - .flexible: Column size adjusts based on the total available width.
    2. Spacing: Control vertical and horizontal spacing for a cleaner layout.
    """,
                    sampleView: nil,
                    code: """
    let columns = [
        GridItem(.fixed(100)),   // Fixed width of 100
        GridItem(.adaptive(minimum: 80)), // Adjusts to fit content, min width 80
        GridItem(.flexible())    // Flexible column takes remaining space
    ]
    """
                ),
                DescriptionView(
                    id: 3,
                    DImage: "",
                    DTitle: "3. Adding Dynamic Data and Background Colors",
                    DDescription: """
                1. Dynamic Data: Use arrays or lists to create a grid with dynamic items.
                2. Custom Backgrounds: Apply .background and .cornerRadius for styling each grid item.
                """,
                    sampleView: nil,
                    code: """
                struct DynamicGridView: View {
                    let columns = [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                    
                    @State private var items = Array(1...10).map { "Item \\($0)" }
                    
                    var body: some View {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(items, id: \\.self) { item in
                                    Text(item)
                                        .frame(width: 100, height: 100)
                                        .background(Color.green) // Sets a custom background color
                                        .foregroundColor(.white)
                                        .cornerRadius(8) // Rounds corners of each item
                                }
                            }
                            .padding()
                        }
                    }
                }
                """
                )

            ]
        )



    
    
]

let dim = generalContentModel(
    id: 18,
    mainImage: "",
    mainTitle: " ",
    mainDescription: "T",
    keywords: [],
    technology: "SwiftUI",
    viewComponentDescription: [
        DescriptionView(
            id: 1,
            DImage: "",
            DTitle: "",
            DDescription: "",
            
            sampleView: AnyView(
                VStack {
                }
            ),
            
            code: """
"""
        )
    ]
)









        struct CustomStyleModifier: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
