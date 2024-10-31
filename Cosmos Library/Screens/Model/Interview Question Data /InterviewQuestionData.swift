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
                id: 2,
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
    1. State Management: @State is a property wrapper that allows you to define a source of truth for data that can change over time within a view. It keeps track of the mutable state of the view.
    2. Local State: It is designed for local state management. The state is stored directly within the view that declares it, meaning it's specific to that view's lifecycle.
    3. Automatic UI Updates: When the value of a @State variable changes, SwiftUI automatically re-renders the view. This ensures that the UI is always in sync with the underlying data.
    4. Mutable Properties: @State variables are mutable, allowing you to change their values in response to user interactions or other events, such as button taps or gestures.
    5. Value Types: The properties marked with @State should be value types (like Int, String, Bool, etc.), as SwiftUI relies on value semantics to track changes efficiently.
    6. Private Access: @State properties are private to the view, meaning they cannot be accessed or modified from outside the view. This encapsulation helps maintain a clear structure in your code.
    7. Performance: Using @State is efficient, as it minimizes unnecessary view updates. SwiftUI optimizes re-rendering, only updating the parts of the UI that depend on the state that has changed.
    8. Usage in Views: You typically declare @State properties at the top of your view struct. For example 
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
        ),
    generalContentModel(
        id: 1,
        mainImage: "",
        mainTitle: "What is SwiftUI, and how does it differ from UIKit?",
        mainDescription: "An overview of SwiftUI, Apple's modern UI framework, and its main differences from UIKit.",
        keywords: ["SwiftUI", "UIKit", "Declarative", "UI Framework", "Top 50"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Introduction to SwiftUI",
                DDescription: "SwiftUI is Apple's declarative framework for building user interfaces across all Apple platforms. Introduced in 2019, it simplifies UI creation by using a declarative syntax, meaning developers describe the desired UI state and SwiftUI handles the rendering.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Difference 1: Declarative vs. Imperative",
                DDescription: "SwiftUI uses a declarative approach where the code describes the UI and its states. UIKit, on the other hand, is imperative, requiring step-by-step instructions to manipulate the UI.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Difference 2: Platform Compatibility",
                DDescription: "SwiftUI enables cross-platform UI creation for iOS, macOS, watchOS, and tvOS. UIKit is iOS-specific, requiring AppKit for macOS development.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "Difference 3: Code Simplicity",
                DDescription: "SwiftUI minimizes code verbosity with features like property wrappers (@State, @Binding) to manage UI state. UIKit requires more code for similar functionality, using delegates and data sources for UI updates.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "Difference 4: Preview and Live Updates",
                DDescription: "SwiftUI’s integration with Xcode allows for live previews and updates as you code, streamlining the development process. UIKit development is primarily done through Interface Builder or code without live previews.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "Complete Code Sample",
                DDescription: "A basic SwiftUI example to create a text label and view the declarative syntax in action.",
                sampleView: AnyView(Text("Hello, SwiftUI!")),
                code: """
    import SwiftUI

    struct ContentView: View {
        var body: some View {
            Text("Hello, SwiftUI!")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    #Preview {
        ContentView()
    }
    """
            )
        ]
    ),
            generalContentModel(
                id: 59,
                mainImage: "",
                mainTitle: "How does SwiftUI handle environment variables?",
                mainDescription: "A guide to understanding and using environment variables in SwiftUI.",
                keywords: ["SwiftUI", "Environment Variables", "State Management", "Property Wrapper", "Top 50"],
                technology: "SwiftUI",
                viewComponentDescription: [
                    DescriptionView(
                        id: 1,
                        DImage: "",
                        DTitle: "Introduction to Environment Variables",
                        DDescription: "Environment variables in SwiftUI allow views to read shared data from their environment, enhancing the reusability and organization of code.",
                        sampleView: nil,
                        code: ""
                    ),
                    DescriptionView(
                        id: 2,
                        DImage: "",
                        DTitle: "Using @Environment Property Wrapper",
                        DDescription: "The @Environment property wrapper is used to access environment values. You can retrieve values like color scheme or custom environment settings.",
                        sampleView: nil,
                        code: """
            @Environment(\\.colorScheme) var colorScheme
            """
                    ),
                    DescriptionView(
                        id: 3,
                        DImage: "",
                        DTitle: "Example of Accessing Color Scheme",
                        DDescription: "In this example, the current color scheme is used to change the background color of a text view.",
                        sampleView: AnyView(
                            VStack{
                                Text("Hello, World!")
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(Color.white)
                            }
                        ),
                        code: """
            struct ContentView: View {
                @Environment(\\.colorScheme) var colorScheme

                var body: some View {
                    Text("Hello, World!")
                        .padding()
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 4,
                        DImage: "",
                        DTitle: "Injecting Custom Environment Values",
                        DDescription: "You can also inject custom environment values to be accessed by child views. This promotes data flow and keeps components loosely coupled.",
                        sampleView: nil,
                        code: """
            struct ParentView: View {
                @State private var isDarkMode = true

                var body: some View {
                    ContentView()
                        .environment(\\.colorScheme, isDarkMode ? .dark : .light)
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 5,
                        DImage: "",
                        DTitle: "Summary of Benefits",
                        DDescription: "Using environment variables simplifies state management across multiple views, allowing for a more modular and reusable codebase in SwiftUI applications.",
                        sampleView: nil,
                        code: ""
                    )
                ]
            ),generalContentModel(
                id: 62,
                mainImage: "",
                mainTitle: "How do you create a TabView in SwiftUI?",
                mainDescription: "An overview of implementing TabView in SwiftUI and its various applications, including use cases like onboarding screens.",
                keywords: ["SwiftUI", "TabView", "User Interface", "Navigation", "Onboarding", "Top 50"],
                technology: "SwiftUI",
                viewComponentDescription: [
                    DescriptionView(
                        id: 1,
                        DImage: "",
                        DTitle: "Introduction to TabView",
                        DDescription: "TabView is a container view in SwiftUI that allows you to create a tabbed interface, enabling users to switch between multiple views easily.",
                        sampleView: nil,
                        code: ""
                    ),
                    DescriptionView(
                        id: 2,
                        DImage: "",
                        DTitle: "Basic Implementation of TabView",
                        DDescription: "To create a simple TabView, use the TabView component with multiple TabItem views representing each tab.",
                        sampleView: nil,
                        code: """
            struct ContentView: View {
                var body: some View {
                    TabView {
                        Text("Home View")
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        Text("Settings View")
                            .tabItem {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                    }
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 3,
                        DImage: "",
                        DTitle: "Customizing Tab Items",
                        DDescription: "You can customize each tab item using images and text, making the interface more intuitive.",
                        sampleView: nil,
                        code: """
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            """
                    ),
                    DescriptionView(
                        id: 4,
                        DImage: "",
                        DTitle: "TabView Style",
                        DDescription: "SwiftUI provides different styles for TabView, such as DefaultTabViewStyle and PageTabViewStyle, allowing for customizable layouts.",
                        sampleView: nil,
                        code: """
            TabView {
                // Tabs here
            }
            .tabViewStyle(PageTabViewStyle())
            """
                    ),
                    DescriptionView(
                        id: 5,
                        DImage: "",
                        DTitle: "Applications of TabView",
                        DDescription: "TabView is commonly used in applications to categorize content, such as social media apps (e.g., feed, notifications, profile) and utility apps (e.g., settings, preferences). It enhances user navigation by keeping related views grouped together.",
                        sampleView: nil,
                        code: ""
                    ),
                    DescriptionView(
                        id: 6,
                        DImage: "",
                        DTitle: "Using TabView for Onboarding Screens",
                        DDescription: "You can use TabView with the PageTabViewStyle to create swipeable onboarding screens. Each TabView page can represent a step in the onboarding process.",
                        sampleView: AnyView(
                            TabView {
                                VStack {
                                    Text("Welcome to the App!")
                                        .font(.largeTitle)
                                    Text("Swipe to learn more.")
                                }
                                .tag(0)
                                VStack {
                                    Text("Feature 1")
                                        .font(.title)
                                    Text("Description of feature 1.")
                                }
                                .tag(1)
                                VStack {
                                    Text("Feature 2")
                                        .font(.title)
                                    Text("Description of feature 2.")
                                }
                                .tag(2)
                            }.frame(height: 150)
                            .tabViewStyle(PageTabViewStyle())
                        ),
                        code: """
            struct OnboardingView: View {
                var body: some View {
                    TabView {
                        VStack {
                            Text("Welcome to the App!")
                                .font(.largeTitle)
                            Text("Swipe to learn more.")
                        }
                        .tag(0)
                        VStack {
                            Text("Feature 1")
                                .font(.title)
                            Text("Description of feature 1.")
                        }
                        .tag(1)
                        VStack {
                            Text("Feature 2")
                                .font(.title)
                            Text("Description of feature 2.")
                        }
                        .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 7,
                        DImage: "",
                        DTitle: "Complete Code Sample",
                        DDescription: "A full example of a TabView with two tabs: Home and Settings.",
                        sampleView: AnyView(
                            TabView {
                                Text("Home View")
                                    .tabItem {
                                        Image(systemName: "house")
                                        Text("Home")
                                    }
                                Text("Settings View")
                                    .tabItem {
                                        Image(systemName: "gear")
                                        Text("Settings")
                                    }
                            }.frame(height: 150)
                        ),
                        code: """
            struct ContentView: View {
                var body: some View {
                    TabView {
                        Text("Home View")
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        Text("Settings View")
                            .tabItem {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                    }
                }
            }
            """
                    )
                ]
            ),generalContentModel(
                id: 65,
                mainImage: "",
                mainTitle: "What is GeometryReader, and how is it used in SwiftUI?",
                mainDescription: "An overview of GeometryReader, a view that provides access to layout properties, along with various examples and use cases.",
                keywords: ["SwiftUI", "GeometryReader", "Layout", "Responsive Design", "Top 50"],
                technology: "SwiftUI",
                viewComponentDescription: [
                    DescriptionView(
                        id: 1,
                        DImage: "",
                        DTitle: "Introduction to GeometryReader",
                        DDescription: "GeometryReader is a SwiftUI container view that reads the surrounding geometry and provides layout information, allowing you to create dynamic and responsive layouts based on screen size or parent view dimensions.",
                        sampleView: nil,
                        code: ""
                    ),
                    DescriptionView(
                        id: 2,
                        DImage: "",
                        DTitle: "Basic Usage of GeometryReader",
                        DDescription: "The GeometryReader closure provides a GeometryProxy object that contains information about the size and position of the view. This allows you to adapt layout to different screen sizes.",
                        sampleView: AnyView(
                            GeometryReader { geometry in
                                Text("Width: \(geometry.size.width), Height: \(geometry.size.height)")
                            }.frame(height: 150)
                        ),
                        code: """
            struct ContentView: View {
                var body: some View {
                    GeometryReader { geometry in
                        Text("Width: \\(geometry.size.width), Height: \\(geometry.size.height)")
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 3,
                        DImage: "",
                        DTitle: "Using GeometryReader for Responsive Layouts",
                        DDescription: "You can use GeometryReader to position and size elements dynamically based on the available space, making it ideal for responsive designs.",
                        sampleView: AnyView(
                            GeometryReader { geometry in
                                VStack {
                                    Rectangle()
                                        .fill(Color.blue)
                                        .frame(width: geometry.size.width * 0.5, height: 50)
                                    Rectangle()
                                        .fill(Color.red)
                                        .frame(width: geometry.size.width * 0.75, height: 50)
                                }
                            }.frame(height: 150)
                        ),
                        code: """
            struct ResponsiveLayoutView: View {
                var body: some View {
                    GeometryReader { geometry in
                        VStack {
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: geometry.size.width * 0.5, height: 50)
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: geometry.size.width * 0.75, height: 50)
                        }
                    }
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 4,
                        DImage: "",
                        DTitle: "Using GeometryReader to Position Elements",
                        DDescription: "You can also use GeometryReader to create custom positioning by applying offsets relative to the available space.",
                        sampleView: AnyView(
                            GeometryReader { geometry in
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 50, height: 50)
                                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.25)
                            }.frame(height: 150)
                        ),
                        code: """
            struct PositionedElementView: View {
                var body: some View {
                    GeometryReader { geometry in
                        Circle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.25)
                    }
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 5,
                        DImage: "",
                        DTitle: "Animating with GeometryReader",
                        DDescription: "You can use GeometryReader for animations by adjusting properties like frame or position dynamically based on screen size or user interactions.",
                        sampleView: AnyView(
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(Color.orange)
                                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.1)
                                    .offset(x: geometry.size.width * 0.2, y: geometry.size.height * 0.3)
                            }.frame(height: 150)
                        ),
                        code: """
            struct AnimatedGeometryView: View {
                @State private var offset: CGFloat = 0

                var body: some View {
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(Color.orange)
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.1)
                            .offset(x: offset, y: geometry.size.height * 0.3)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 2.0)) {
                                    offset = geometry.size.width * 0.5
                                }
                            }
                    }
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 6,
                        DImage: "",
                        DTitle: "Using GeometryReader with Safe Areas",
                        DDescription: "You can leverage GeometryReader to account for safe areas, which is helpful for creating views that adapt to the notch and other screen interruptions.",
                        sampleView: AnyView(
                            GeometryReader { geometry in
                                VStack {
                                    Text("Content")
                                        .padding(.top, geometry.safeAreaInsets.top)
                                    Spacer()
                                    Text("Bottom Content")
                                        .padding(.bottom, geometry.safeAreaInsets.bottom)
                                }
                            }.frame(height: 150)
                        ),
                        code: """
            struct SafeAreaGeometryView: View {
                var body: some View {
                    GeometryReader { geometry in
                        VStack {
                            Text("Content")
                                .padding(.top, geometry.safeAreaInsets.top)
                            Spacer()
                            Text("Bottom Content")
                                .padding(.bottom, geometry.safeAreaInsets.bottom)
                        }
                    }
                }
            }
            """
                    ),
                    DescriptionView(
                        id: 7,
                        DImage: "",
                        DTitle: "Complete Code Example",
                        DDescription: "A complete example demonstrating the use of GeometryReader to create a responsive layout.",
                        sampleView: AnyView(
                            GeometryReader { geometry in
                                VStack {
                                    Text("Width: \(geometry.size.width)")
                                    Text("Height: \(geometry.size.height)")
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .background(Color.gray)
                            }.frame(height: 150)
                        ),
                        code: """
            struct CompleteGeometryView: View {
                var body: some View {
                    GeometryReader { geometry in
                        VStack {
                            Text("Width: \\(geometry.size.width)")
                            Text("Height: \\(geometry.size.height)")
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.gray)
                    }
                }
            }
            """
                    )
                ]
            ),
    generalContentModel(
        id: 67,
        mainImage: "",
        mainTitle: "How does SwiftUI optimize view rendering with @ViewBuilder?",
        mainDescription: "Explanation of @ViewBuilder in SwiftUI, its role in dynamic view composition, and how it optimizes view rendering.",
        keywords: ["SwiftUI", "ViewBuilder", "View Composition", "Optimization", "Top 50"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Purpose of @ViewBuilder",
                DDescription: "@ViewBuilder simplifies complex layouts by allowing multiple views in a single closure. It’s essential for conditional view rendering, promoting code readability and modular UI creation.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Optimization Benefits",
                DDescription: "@ViewBuilder optimizes view rendering by deferring the creation of non-visible views, reducing memory and processing demands. This improves performance, especially in complex or conditional UI layouts.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Usage Example: Creating a Custom Popup",
                DDescription: "This example demonstrates a custom popup view using @ViewBuilder, showing how to add dynamic, animated content and dismiss options, with conditional rendering of optional elements.",
                sampleView: nil,
                code: """
    import Foundation
    import SwiftUI

    struct PopUpWindow<Content: View>: View {
        @Environment(\\.dismiss) var dismiss
        @Binding var showPopUpWindow: Bool
        @ViewBuilder let content: Content
        @State var showAnimateContent = false
        @State var HeadTitle: String = ""
        @State var CloseIcon: String = ""
        
        var body: some View {
            ZStack {
                if showPopUpWindow {
                    ZStack {
                        Color.black
                            .opacity(0.5)
                            .ignoresSafeArea()
                        if showAnimateContent {
                            VStack(alignment: .leading, spacing: 5) {
                                // title and close button
                                if !HeadTitle.isEmpty || !CloseIcon.isEmpty {
                                    HStack {
                                        Text(HeadTitle)
                                            .font(.system(size: 22))
                                            .bold()
                                        Spacer()
                                        Image(systemName: CloseIcon)
                                            .onTapGesture {
                                                withAnimation {
                                                    showAnimateContent = false
                                                }
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    showPopUpWindow = false
                                                }
                                            }
                                    }.padding()
                                }
                                // content
                                content
                            }
                            .transition(.scale)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 15)
                            )
                            .padding(.horizontal, 30)
                        }
                    }.onAppear {
                        withAnimation {
                            showAnimateContent = true
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Customizing the Popup",
                DDescription: "This popup example allows for flexible content, custom header text, and dismiss icons, highlighting @ViewBuilder's ability to create complex, reusable components in a single SwiftUI view.",
                sampleView: nil,
                code: """
    struct ContentView: View {
        @State private var showPopup = false

        var body: some View {
            VStack {
                Button("Show Popup") {
                    showPopup = true
                }
            }
            .popUpWindow(showPopUpWindow: $showPopup, HeadTitle: "Welcome!", CloseIcon: "xmark") {
                Text("This is dynamic content inside the popup.")
                    .padding()
            }
        }
    }
    """
            )
        ]
    ),
//    generalContentModel(
//        id: 70,
//        mainImage: "",
//        mainTitle: "What are LazyStacks in SwiftUI?",
//        mainDescription: "An overview of LazyStacks in SwiftUI, their usage, and how they improve performance with efficient loading of views on demand.",
//        keywords: ["SwiftUI", "LazyStack", "LazyVStack", "LazyHStack", "Performance", "Top 50"],
//        technology: "SwiftUI",
//        viewComponentDescription: [
//            DescriptionView(
//                id: 1,
//                DImage: "",
//                DTitle: "1. Introduction to LazyStacks",
//                DDescription: "LazyStacks are views in SwiftUI that load and render their child views on-demand. They help with performance optimization, especially when dealing with long lists of items by only loading visible views.",
//                sampleView: nil,
//                code: ""
//            ),
//            DescriptionView(
//                id: 2,
//                DImage: "",
//                DTitle: "2. LazyVStack vs. LazyHStack",
//                DDescription: "LazyVStack loads child views vertically, whereas LazyHStack does so horizontally. In both, only visible views are rendered initially, improving memory efficiency.",
//                sampleView: nil,
//                code: """
//    struct ContentView: View {
//        var body: some View {
//            ScrollView {
//                LazyVStack {
//                    ForEach(1...1000, id: \\ .self) { number in
//                        Text("Item \\(number)")
//                            .padding()
//                            .background(Color.blue.opacity(0.1))
//                            .cornerRadius(5)
//                    }
//                }
//            }
//        }
//    }
//    """
//            ),
//            DescriptionView(
//                id: 3,
//                DImage: "",
//                DTitle: "3. Why Use LazyStacks?",
//                DDescription: "LazyStacks optimize memory usage by only rendering views as needed, making them ideal for displaying large datasets without impacting app performance.",
//                sampleView: nil,
//                code: ""
//            ),
//            DescriptionView(
//                id: 4,
//                DImage: "",
//                DTitle: "4. LazyStacks with ScrollView",
//                DDescription: "LazyStacks are often combined with ScrollView to enable scrolling, allowing efficient navigation through large sets of data without preloading all views.",
//                sampleView: AnyView(
//                    ScrollView(.horizontal) {
//                        LazyHStack {
//                            ForEach(1...1000, id: \ .self) { number in
//                                Text("Horizontal Item \\(number)")
//                                    .padding()
//                                    .background(Color.green.opacity(0.1))
//                                    .cornerRadius(5)
//                            }
//                        }
//                    }
//                ),
//                code: """
//    struct HorizontalContentView: View {
//        var body: some View {
//            ScrollView(.horizontal) {
//                LazyHStack {
//                    ForEach(1...1000, id: \\ .self) { number in
//                        Text("Horizontal Item \\(number)")
//                            .padding()
//                            .background(Color.green.opacity(0.1))
//                            .cornerRadius(5)
//                    }
//                }
//            }
//        }
//    }
//    """
//            ),
//            DescriptionView(
//                id: 5,
//                DImage: "",
//                DTitle: "5. Complete Code Sample",
//                DDescription: "Here’s a combined example of LazyVStack and LazyHStack in a ScrollView, showing efficient loading and performance optimization for large datasets.",
//                sampleView: AnyView(
//                    VStack {
//                        ScrollView {
//                            LazyVStack {
//                                ForEach(1...500, id: \ .self) { number in
//                                    Text("Vertical Item \\(number)")
//                                        .padding()
//                                        .background(Color.blue.opacity(0.1))
//                                        .cornerRadius(5)
//                                }
//                            }
//                        }
//                        ScrollView(.horizontal) {
//                            LazyHStack {
//                                ForEach(1...500, id: \ .self) { number in
//                                    Text("Horizontal Item \\(number)")
//                                        .padding()
//                                        .background(Color.green.opacity(0.1))
//                                        .cornerRadius(5)
//                                }
//                            }
//                        }
//                    }
//                ),
//                code: """
//    struct CombinedContentView: View {
//        var body: some View {
//            VStack {
//                ScrollView {
//                    LazyVStack {
//                        ForEach(1...500, id: \\ .self) { number in
//                            Text("Vertical Item \\(number)")
//                                .padding()
//                                .background(Color.blue.opacity(0.1))
//                                .cornerRadius(5)
//                        }
//                    }
//                }
//                ScrollView(.horizontal) {
//                    LazyHStack {
//                        ForEach(1...500, id: \\ .self) { number in
//                            Text("Horizontal Item \\(number)")
//                                .padding()
//                                .background(Color.green.opacity(0.1))
//                                .cornerRadius(5)
//                        }
//                    }
//                }
//            }
//        }
//    }
//    """
//            )
//        ]
//    ),
    generalContentModel(
        id: 70,
        mainImage: "",
        mainTitle: "What are LazyStacks in SwiftUI?",
        mainDescription: "An overview of LazyStacks in SwiftUI, their usage, and how they improve performance with efficient loading of views on demand.",
        keywords: ["SwiftUI", "LazyStack", "LazyVStack", "LazyHStack", "Performance", "Top 50"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Introduction to LazyStacks",
                DDescription: "LazyStacks are views in SwiftUI that load and render their child views on-demand. They help with performance optimization, especially when dealing with long lists of items by only loading visible views.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. LazyVStack vs. LazyHStack",
                DDescription: "LazyVStack loads child views vertically, whereas LazyHStack does so horizontally. In both, only visible views are rendered initially, improving memory efficiency.",
                sampleView: nil,
                code: """
    struct ContentView: View {
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(1...1000, id: \\ .self) { number in
                        Text("Item \\(number)")
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(5)
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
                DTitle: "3. Why Use LazyStacks?",
                DDescription: "LazyStacks optimize memory usage by only rendering views as needed, making them ideal for displaying large datasets without impacting app performance.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. LazyStacks with ScrollView",
                DDescription: "LazyStacks are often combined with ScrollView to enable scrolling, allowing efficient navigation through large sets of data without preloading all views.",
                sampleView: AnyView(
                    VStack{
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(1...1000, id: \ .self) { number in
                                    Text("Horizontal Item \\(number)")
                                        .padding()
                                        .background(Color.green.opacity(0.1))
                                        .cornerRadius(5)
                                }
                            }
                        }
                    }.frame(height: 100)
                ),
                code: """
    struct HorizontalContentView: View {
        var body: some View {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1...1000, id: \\ .self) { number in
                        Text("Horizontal Item \\(number)")
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(5)
                    }
                }
            }
        }
    }
    """
            )
        ]
    ),generalContentModel(
        id: 77,
        mainImage: "",
        mainTitle: "Benefits of SwiftUI Previews and How to Configure Them",
        mainDescription: "An overview of SwiftUI Previews, their advantages in development, and configuration options to optimize the preview experience.",
        keywords: ["SwiftUI", "Preview", "Configuration", "Live Preview", "Development", "Top 50"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Introduction to SwiftUI Previews",
                DDescription: "SwiftUI Previews allow developers to see live updates to UI components as they code, streamlining design and layout adjustments in real-time within Xcode.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Key Benefits of SwiftUI Previews",
                DDescription: "SwiftUI Previews enhance development by providing a live, interactive view of the UI without needing to run the app on a simulator or device. This saves time and improves visual accuracy.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Configuring Basic Previews",
                DDescription: "To enable previews, add a #Preview structure at the end of a SwiftUI view file. Xcode automatically displays the view in the canvas panel for live updates.",
                sampleView: AnyView(
                    Text("Hello, SwiftUI!")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                ),
                code: """
    struct ContentView: View {
        var body: some View {
            Text("Hello, SwiftUI!")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Device and Color Scheme Selection",
                DDescription: "You can preview views on different devices and in both light and dark modes to ensure UI adaptability. This is done by adding .previewDevice() and .preferredColorScheme() modifiers.",
                sampleView: nil,
                code: """
    #Preview {
        ContentView()
            .previewDevice("iPhone 14")
            .preferredColorScheme(.dark)
    }
    """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Dynamic Type and Accessibility Settings",
                DDescription: "Configure previews to test different Dynamic Type sizes and accessibility settings. Using .environment(\\.sizeCategory) lets you adjust font sizes for accessibility.",
                sampleView: nil,
                code: """
    #Preview {
        ContentView()
            .environment(\\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
    """
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "6. Preview Layouts for Multiple Screens",
                DDescription: "Preview multiple layouts by using ForEach to display the view on various devices or configurations side by side. This enables simultaneous testing across devices.",
                sampleView: nil,
                code: """
    #Preview {
        ForEach(["iPhone SE (2nd generation)", "iPhone 14"], id: \\.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
    """
            ),
            DescriptionView(
                id: 7,
                DImage: "",
                DTitle: "7. Complete Example: Configuring Multiple Settings",
                DDescription: "A combined example showcasing a view in both light and dark modes, with dynamic type adjustments, for multiple devices.",
                sampleView: nil,
                code: """
    #Preview {
        ForEach(["iPhone SE (2nd generation)", "iPhone 14"], id: \\.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .preferredColorScheme(.light)
                .environment(\\.sizeCategory, .extraLarge)
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 81,
        mainImage: "",
        mainTitle: "Using Path and Shape to Create Custom Graphics in SwiftUI",
        mainDescription: "An overview of how to use the Path and Shape structs in SwiftUI to create custom drawings and complex shapes with ease.",
        keywords: ["SwiftUI", "Path", "Shape", "Custom Graphics", "Drawing", "Top 50"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Introduction to Path and Shape in SwiftUI",
                DDescription: "Path and Shape are fundamental drawing tools in SwiftUI, allowing developers to create custom, complex graphics by specifying points, lines, and curves.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Creating Simple Custom Shapes with Path",
                DDescription: "The Path struct defines a sequence of drawing commands, making it possible to create custom shapes by setting points, drawing lines, and adding curves.",
                sampleView: AnyView(
                    VStack{
                        Path { path in
                            path.move(to: CGPoint(x: 50, y: 50))
                            path.addLine(to: CGPoint(x: 150, y: 50))
                            path.addLine(to: CGPoint(x: 100, y: 150))
                            path.closeSubpath()
                        }
                        .stroke(Color.blue, lineWidth: 2)
                    }.frame(height: 150)
                    
                ),
                code: """
    struct ContentView: View {
        var body: some View {
            Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addLine(to: CGPoint(x: 150, y: 50))
                path.addLine(to: CGPoint(x: 100, y: 150))
                path.closeSubpath()
            }
            .stroke(Color.blue, lineWidth: 2)
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Creating Reusable Custom Shapes with Shape Protocol",
                DDescription: "The Shape protocol is used to define reusable shapes. Implementing the path(in:) function allows you to specify how the shape should be drawn, making it scalable and adaptable.",
                sampleView: AnyView(
                    Rectangle()
                        .stroke(Color.red, lineWidth: 3)
                        .frame(width: 150, height: 150)
                ),
                code: """
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
            return path
        }
    }

    struct ContentView: View {
        var body: some View {
            Triangle()
                .stroke(Color.red, lineWidth: 3)
                .frame(width: 150, height: 150)
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Filling Shapes with Color and Gradients",
                DDescription: "Shapes can be filled with colors, gradients, or patterns by using the .fill() modifier, adding visual depth and creativity to custom shapes.",
                sampleView: AnyView(
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .frame(width: 100, height: 100)
                ),
                code: """
    struct ContentView: View {
        var body: some View {
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .frame(width: 100, height: 100)
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Combining Multiple Shapes with ZStack",
                DDescription: "Multiple shapes can be layered using ZStack to create complex graphics. By aligning and overlaying shapes, you can achieve intricate designs.",
                sampleView: AnyView(
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.5))
                            .frame(width: 150, height: 150)
                        Rectangle()
                            .fill(Color.red.opacity(0.8))
                            .frame(width: 100, height: 100)
                    }
                ),
                code: """
    struct ContentView: View {
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.5))
                    .frame(width: 150, height: 150)
                Triangle()
                    .fill(Color.red.opacity(0.8))
                    .frame(width: 100, height: 100)
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 85,
        mainImage: "",
        mainTitle: "Applying Conditional Modifiers in SwiftUI",
        mainDescription: "Learn how to conditionally apply view modifiers in SwiftUI to customize views based on different conditions.",
        keywords: ["SwiftUI", "Conditional Modifiers", "View Modifiers", "UI Customization", "Top 50"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Introduction to Conditional Modifiers",
                DDescription: "Conditional modifiers in SwiftUI allow you to apply specific view modifiers based on conditions. This provides flexibility for adapting the UI to different states or values.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Using the Conditional Operator (if-else)",
                DDescription: "Use Swift's conditional operator to apply a modifier only if a certain condition is met.",
                sampleView: AnyView(
                    Text("Hello, SwiftUI!")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.yellow.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                ),
                code: """
    struct ContentView: View {
        @State private var isHighlighted = true

        var body: some View {
            Text("Hello, SwiftUI!")
                .font(.title)
                .foregroundColor(isHighlighted ? .blue : .black)
                .padding()
                .background(isHighlighted ? Color.yellow : Color.clear)
                .cornerRadius(isHighlighted ? 10 : 0)
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Using Conditional View Modifiers with if Statement",
                DDescription: "Apply a modifier conditionally by wrapping it with an if statement for more complex conditions.",
                sampleView: AnyView(
                    Text("Hello, SwiftUI!")
                        .font(.title)
                        .padding()
                        .background(Color.yellow.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                ),
                code: """
    struct ContentView: View {
        @State private var isActive = false

        var body: some View {
            VStack {
                Text("Tap to Toggle")
                    .font(.title)
                    .padding()
                    .background(isActive ? Color.green : Color.red)
                    .cornerRadius(8)
                    .onTapGesture {
                        isActive.toggle()
                    }
                
                if isActive {
                    Text("Active State")
                        .padding()
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(8)
                }
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Using Ternary Operators for Simple Conditions",
                DDescription: "The ternary operator can apply different modifiers based on simple true or false conditions.",
                sampleView: AnyView(
                    Text("Hello, SwiftUI!")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.yellow.opacity(0.5))
                        .cornerRadius(10)
                ),
                code: """
    struct ContentView: View {
        @State private var isOn = true

        var body: some View {
            Text("Toggle Background")
                .padding()
                .background(isOn ? Color.green : Color.gray)
                .cornerRadius(10)
                .onTapGesture {
                    isOn.toggle()
                }
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Complete Code Sample",
                DDescription: "This example shows how to create a view with multiple conditional modifiers applied.",
                sampleView: AnyView(
                    VStack {
                        Text("Conditional Modifiers in SwiftUI")
                            .padding()
                            .background(Color.yellow.opacity(0.5))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                ),
                code: """
    struct ContentView: View {
        @State private var isHighlighted = false
        @State private var isActive = true

        var body: some View {
            VStack {
                Text("Conditional Modifiers")
                    .font(.title)
                    .foregroundColor(isHighlighted ? .red : .blue)
                    .padding()
                    .background(isActive ? Color.yellow : Color.clear)
                    .cornerRadius(isActive ? 8 : 0)
                    .onTapGesture {
                        isHighlighted.toggle()
                        isActive.toggle()
                    }
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 88,
        mainImage: "",
        mainTitle: "@Published, @StateObject, and ObservableObject in SwiftUI",
        mainDescription: "Understanding how @Published and @StateObject work with ObservableObject to manage state changes in SwiftUI.",
        keywords: ["@Published", "@StateObject", "ObservableObject", "State Management", "SwiftUI", "Top 25"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Introduction to @Published",
                DDescription: "@Published is a property wrapper used in SwiftUI to automatically announce changes to properties. When a property marked with @Published changes, any views observing that property will be automatically updated.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Using @Published with ObservableObject",
                DDescription: "To use @Published, you typically define a class conforming to ObservableObject. When properties marked with @Published change, the ObservableObject protocol notifies any subscribers (e.g., SwiftUI views) to update themselves accordingly.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Understanding @StateObject",
                DDescription: "@StateObject is a property wrapper used to create and manage an instance of an ObservableObject within a SwiftUI view. It ensures that the view correctly initializes the ObservableObject and maintains its lifecycle.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Example of @Published and @StateObject in Action",
                DDescription: "Here’s an example demonstrating how @Published and @StateObject work together to update a view when data changes.",
                sampleView: AnyView(
                    VStack {
                        Text("Counter: ")
                            .font(.largeTitle)
                        Text("0") // Placeholder for the counter
                    }
                ),
                code: """
    import SwiftUI

    class CounterModel: ObservableObject {
        @Published var count: Int = 0
    }

    struct ContentView: View {
        @StateObject private var counter = CounterModel()

        var body: some View {
            VStack {
                Text("Counter: \\(counter.count)")
                    .font(.largeTitle)
                    .padding()

                Button("Increment") {
                    counter.count += 1
                }
                .padding()
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Benefits of Using @Published and @StateObject",
                DDescription: "Using @Published with ObservableObject allows for a clear and reactive way to manage state in SwiftUI. @StateObject ensures the proper lifecycle management of the object, while @Published enables automatic UI updates when the state changes.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "6. Complete Code Example",
                DDescription: "This complete code sample illustrates the interaction between @Published and @StateObject, allowing the UI to reactively update as the count changes.",
                sampleView: AnyView(
                    VStack {
                        Text("Counter Example")
                            .font(.title)
                            .padding()
                    }
                ),
                code: """
    import SwiftUI

    class CounterModel: ObservableObject {
        @Published var count: Int = 0
    }

    struct ContentView: View {
        @StateObject private var counter = CounterModel()

        var body: some View {
            VStack {
                Text("Counter: \\(counter.count)")
                    .font(.largeTitle)
                    .padding()

                Button("Increment") {
                    counter.count += 1
                }
                .padding()
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 89,
        mainImage: "",
        mainTitle: "Creating a Form Layout in SwiftUI",
        mainDescription: "An overview of how to create a form layout using the Form view in SwiftUI, including various input types and organization.",
        keywords: ["Form", "SwiftUI", "User Input", "Layouts", "Top 25"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Basic Form Implementation",
                DDescription: "A Form in SwiftUI is used to collect user input. It automatically groups form elements and provides styling suitable for input forms.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Adding Input Fields",
                DDescription: "You can add various input types like TextField, Toggle, and DatePicker inside a Form. Each element is grouped and can have labels.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Example of a Basic Form",
                DDescription: "Here’s a simple example of a Form with different input types.",
                sampleView: AnyView(
                    Form {
                        Section(header: Text("User Information")) {
                            TextField("Name", text: .constant(""))
                            TextField("Email", text: .constant(""))
                            Toggle("Subscribe to newsletter", isOn: .constant(true))
                        }
                        Section(header: Text("Settings")) {
                            DatePicker("Birthday", selection: .constant(Date()), displayedComponents: .date)
                        }
                    }
                ),
                code: """
    import SwiftUI

    struct ContentView: View {
        var body: some View {
            Form {
                Section(header: Text("User Information")) {
                    TextField("Name", text: .constant(""))
                    TextField("Email", text: .constant(""))
                    Toggle("Subscribe to newsletter", isOn: .constant(true))
                }
                Section(header: Text("Settings")) {
                    DatePicker("Birthday", selection: .constant(Date()), displayedComponents: .date)
                }
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Customizing Form Appearance",
                DDescription: "You can customize the appearance of a Form by changing section headers, adding footers, and adjusting the styles of individual elements.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Handling State Changes",
                DDescription: "Use @State to manage input values, ensuring the UI updates dynamically based on user interaction.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "6. Complete Code Example",
                DDescription: "This complete code example illustrates a functional form layout with state management for user input.",
                sampleView: AnyView(
                    VStack {
                        Text("Form Example")
                            .font(.title)
                            .padding()
                    }
                ),
                code: """
    import SwiftUI

    struct ContentView: View {
        @State private var name: String = ""
        @State private var email: String = ""
        @State private var isSubscribed: Bool = true
        @State private var birthday: Date = Date()

        var body: some View {
            Form {
                Section(header: Text("User Information")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                    Toggle("Subscribe to newsletter", isOn: $isSubscribed)
                }
                Section(header: Text("Settings")) {
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                }
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 97,
        mainImage: "",
        mainTitle: "Handling Orientation Changes in SwiftUI",
        mainDescription: "An overview of how to handle device orientation changes in SwiftUI, ensuring layouts adapt accordingly.",
        keywords: ["Orientation", "SwiftUI", "Adaptive Layout", "Device Rotation", "Top 50"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Understanding Orientation Changes",
                DDescription: "Orientation changes occur when the device is rotated between portrait and landscape modes. SwiftUI provides tools to respond to these changes dynamically.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Using @Environment to Detect Orientation",
                DDescription: "SwiftUI's @Environment can be used to detect the current size class, which helps in understanding the device's orientation.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Example of Handling Orientation Changes",
                DDescription: "This example shows how to use GeometryReader to adapt the layout based on orientation.",
                sampleView: AnyView(
                    GeometryReader { geometry in
                        VStack {
                            if geometry.size.width > geometry.size.height {
                                Text("Landscape Mode")
                                    .font(.largeTitle)
                            } else {
                                Text("Portrait Mode")
                                    .font(.largeTitle)
                            }
                        }
                        .padding()
                    }
                ),
                code: """
    import SwiftUI

    struct ContentView: View {
        var body: some View {
            GeometryReader { geometry in
                VStack {
                    if geometry.size.width > geometry.size.height {
                        Text("Landscape Mode")
                            .font(.largeTitle)
                    } else {
                        Text("Portrait Mode")
                            .font(.largeTitle)
                    }
                }
                .padding()
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Adapting Layouts with Size Classes",
                DDescription: "Using size classes, you can create adaptive layouts that change based on the current device orientation, ensuring a responsive design.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Using OnChange Modifier",
                DDescription: "SwiftUI provides the onChange modifier to respond to changes in orientation or size class dynamically, allowing for customized behavior.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "6. Complete Code Example",
                DDescription: "A complete example illustrating the handling of orientation changes using GeometryReader and adapting UI elements.",
                sampleView: AnyView(
                    VStack {
                        Text("Orientation Change Example")
                            .font(.title)
                            .padding()
                    }
                ),
                code: """
    import SwiftUI

    struct ContentView: View {
        var body: some View {
            GeometryReader { geometry in
                VStack {
                    if geometry.size.width > geometry.size.height {
                        Text("Landscape Mode")
                            .font(.largeTitle)
                    } else {
                        Text("Portrait Mode")
                            .font(.largeTitle)
                    }
                }
                .padding()
            }
        }
    }

    #Preview {
        ContentView()
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 220,
        mainImage: "",
        mainTitle: " What is code signing, Why is it important for iOS apps?",
        mainDescription: "An overview of code signing, a security mechanism required by Apple to ensure the trustworthiness and integrity of iOS apps.",
        keywords: ["Code Signing", "iOS", "Security", "App Distribution", "Top 50"],
        technology: "iOS",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. What is Code Signing?",
                DDescription: "Code signing involves attaching a digital signature to an app, verifying the developer's identity and ensuring that the code has not been tampered with. Without proper code signing, an app cannot run on actual iOS devices or be distributed via the App Store.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Importance of Code Signing",
                DDescription: """
                    - Authentication: Confirms that the app is from a verified developer, protecting users from malicious software.
                    - Integrity: Modifications to a signed app invalidate the signature, preventing unauthorized changes.
                    - Security and Trust: Forms part of Apple's infrastructure to ensure apps behave predictably and come from trusted sources.
                """,
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Components of Code Signing",
                DDescription: """
                    - Apple Developer Account: Required to create and manage certificates and provisioning profiles.
                    - Certificates:
                        - Development Certificate: For testing on devices.
                        - Distribution Certificate: For App Store distribution or enterprise deployment.
                    - Provisioning Profiles: Link app ID, certificates, and devices.
                        - Types: Development, Ad-Hoc, App Store Distribution, Enterprise.
                    - App ID: A unique identifier for the app, typically in the format com.companyname.appname.
                """,
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Code Signing Workflow",
                DDescription: """
                    - Create a Certificate: Generate a certificate request via the Apple Developer account.
                    - Create a Provisioning Profile: Combine app ID, certificate, and device list.
                    - Sign Your App in Xcode: Specify signing certificate and provisioning profile in project settings.
                    - Submission: App Store verifies the digital signature upon submission.
                """,
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Example of Code Signing in Xcode",
                DDescription: """
                    1. Open your project in Xcode.
                    2. Select your project in the navigator and choose your app target.
                    3. Go to the “Signing & Capabilities” tab.
                    4. Check "Automatically manage signing" for Xcode to handle signing settings.
                    5. Select your team associated with the Apple Developer account.
                """,
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "6. Automatic vs. Manual Signing",
                DDescription: """
                    - Automatic Signing: Xcode manages signing for you, ideal for standard workflows.
                    - Manual Signing: Allows specific configurations, suitable for advanced workflows or enterprise needs.
                """,
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 7,
                DImage: "",
                DTitle: "7. Common Code Signing Issues",
                DDescription: """
                    - Provisioning Profile Mismatch: Ensure app ID matches project settings.
                    - Expired Certificates: Renew certificates that have expired.
                    - Team Not Selected: Confirm that the developer team is selected in project settings.
                    - Incorrect Signing Identity: Check that the signing identity matches the profile type.
                """,
                sampleView: nil,
                code: ""
            )
        ]
    ),
    generalContentModel(
        id: 215,
        mainImage: "",
        mainTitle: "App States in iOS",
        mainDescription: "An overview of the different app states in iOS and how to manage them using Combine.",
        keywords: ["App States", "iOS", "SwiftUI", "Combine"],
        technology: "iOS",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Not Running",
                DDescription: "The app is not running at all. It may be in this state if it hasn't been launched or if it was terminated by the user or the system.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Inactive",
                DDescription: "The app is running in the foreground but is not receiving events. This occurs when transitioning between active and background states or when an alert is shown.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Active",
                DDescription: "The app is running in the foreground and receiving events. This is the state when the app is in use and interacting with the user.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Background",
                DDescription: "The app is running in the background and not visible to the user. It may still be executing code, such as completing a task or handling a background fetch.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Suspended",
                DDescription: "The app is in the background and not executing any code. It remains in memory but is not running, and the system may terminate it to reclaim memory.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "6. Managing App States with AppState Class",
                DDescription: """
                    This class uses Combine to observe app state changes:
                    - isActive: Indicates if the app is active.
                    - isBackground: Indicates if the app is in the background.
                    - isInactive: Indicates if the app is inactive.
                """,
                sampleView: nil,
                code: """
    import SwiftUI
    import Combine

    class AppState: ObservableObject {
        @Published var isActive: Bool = true
        @Published var isBackground: Bool = false
        @Published var isInactive: Bool = false

        private var notificationCenter: NotificationCenter
        private var cancellables: Set<AnyCancellable> = []

        init(notificationCenter: NotificationCenter = .default) {
            self.notificationCenter = notificationCenter

            notificationCenter.publisher(for: UIApplication.didBecomeActiveNotification)
                .sink { [weak self] _ in
                    self?.isActive = true
                    self?.isInactive = false
                    self?.isBackground = false
                    self?.handleAppDidBecomeActive()
                }
                .store(in: &cancellables)

            notificationCenter.publisher(for: UIApplication.didEnterBackgroundNotification)
                .sink { [weak self] _ in
                    self?.isActive = false
                    self?.isBackground = true
                    self?.handleAppDidEnterBackground()
                }
                .store(in: &cancellables)

            notificationCenter.publisher(for: UIApplication.willResignActiveNotification)
                .sink { [weak self] _ in
                    self?.isActive = false
                    self?.isInactive = true
                    self?.handleAppWillResignActive()
                }
                .store(in: &cancellables)
        }

        private func handleAppDidBecomeActive() {
            print("App became active")
        }

        private func handleAppDidEnterBackground() {
            print("App entered background")
        }

        private func handleAppWillResignActive() {
            print("App will resign active")
        }
    }
"""
            )
        ]
    ),generalContentModel(
        id: 227,
        mainImage: "",
        mainTitle: "Copy vs. Retain in Swift",
        mainDescription: "Understanding value types and reference types in Swift, and how they impact memory management, especially in SwiftUI.",
        keywords: ["Copy", "Retain", "Value Types", "Reference Types", "SwiftUI"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Copy (Value Types)",
                DDescription: """
                    In Swift, value types (like struct, enum, and basic types like Int, String) follow the concept of copy on assignment. 
                    This means when a value type is assigned to a new variable or passed to a function, a copy of that value is created, 
                    and each copy is independent.
                """,
                sampleView: nil,
                code: """
    struct Employee {
        var name: String
    }

    var employee1 = Employee(name: "Alice")
    var employee2 = employee1  // Creates a copy of employee1

    employee2.name = "Bob"  // Modifying employee2 doesn't affect employee1

    print(employee1.name)  // "Alice"
    print(employee2.name)  // "Bob"
"""
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Retain (Reference Types)",
                DDescription: """
                    Reference types (like class) do not copy on assignment. Instead, they are retained when assigned to a new variable 
                    or passed to a function. This means both variables refer to the same instance, and changing one will affect the other.
                """,
                sampleView: nil,
                code: """
    class Vehicle {
        var model: String

        init(model: String) {
            self.model = model
        }
    }

    var vehicle1 = Vehicle(model: "Tesla")
    var vehicle2 = vehicle1  // Creates a reference to the same object

    vehicle2.model = "Ford"  // Modifying vehicle2 also affects vehicle1

    print(vehicle1.model)  // "Ford"
    print(vehicle2.model)  // "Ford"
"""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Copy and Retain in SwiftUI",
                DDescription: """
                    SwiftUI relies heavily on Swift’s memory management principles. Views are typically value types (structs), 
                    which are copied when necessary, while classes are passed by reference.
                """,
                sampleView: nil,
                code: """
    struct EmployeeView: View {
        @State private var employeeName = "Alice"
        
        var body: some View {
            VStack {
                Text(employeeName)
                Button("Change Name") {
                    employeeName = "Bob"
                }
            }
        }
    }
"""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. SwiftUI with Reference Types (Retain Behavior)",
                DDescription: """
                    If you use reference types (classes) for your data models, they behave differently in SwiftUI since they are 
                    retained rather than copied. Changes to the data model will reflect immediately in the view.
                """,
                sampleView: nil,
                code: """
    class EmployeeModel: ObservableObject {
        @Published var name: String = "Alice"
    }

    struct EmployeeModelView: View {
        @StateObject private var employee = EmployeeModel()

        var body: some View {
            VStack {
                Text(employee.name)
                Button("Change Name") {
                    employee.name = "Bob"
                }
            }
        }
    }
"""
            )
        ]
    ),
    generalContentModel(
        id: 501,
        mainImage: "",
        mainTitle: "Core Animation in Swift",
        mainDescription: "Understanding Core Animation and how it is used to create smooth animations in SwiftUI with UIViewRepresentable.",
        keywords: ["Core Animation", "UIViewRepresentable", "Animation", "SwiftUI"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Core Animation Overview",
                DDescription: """
Core Animation is a powerful animation framework in iOS that enables developers to create smooth, high-performance animations.
It operates at a lower level than UIKit animations, providing more control over the animations by directly manipulating the layer properties.
""",
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "CoreAnimationView Structure",
                DDescription: """
                    The CoreAnimationView struct conforms to UIViewRepresentable, allowing UIKit views and animations to be integrated 
                    within SwiftUI. It provides a way to use UIView and its layer-based animations within a SwiftUI view hierarchy.
                """,
                sampleView: nil,
                code: """
    struct CoreAnimationView: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            // Creates a clear background UIView
            let view = UIView()
            view.backgroundColor = .clear

            // Create a square view
            let squareView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
            squareView.backgroundColor = .blue
            view.addSubview(squareView)

            // Trigger the animation when the view appears
            DispatchQueue.main.async {
                self.animate(view: squareView)
            }

            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            // No updates needed
        }
    }
"""
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Animation Method",
                DDescription: """
                    The animate(view:) method creates and configures animations using CABasicAnimation and CAAnimationGroup.
                    The position and opacity of the squareView are animated simultaneously.
                """,
                sampleView: nil,
                code: """
    private func animate(view: UIView) {
        // Create position animation
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = CGPoint(x: 100, y: 100)
        positionAnimation.toValue = CGPoint(x: 300, y: 300)
        positionAnimation.duration = 2.0

        // Create opacity animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.0
        opacityAnimation.duration = 2.0

        // Create animation group
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [positionAnimation, opacityAnimation]
        animationGroup.duration = 2.0
        animationGroup.fillMode = .removed
        animationGroup.isRemovedOnCompletion = false

        // Add the animation group to the view's layer
        view.layer.add(animationGroup, forKey: "moveAndFade")

        // Update the view's position and opacity
        view.layer.position = CGPoint(x: 300, y: 300)
        view.layer.opacity = 0.0
    }
"""
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "Key Components Explained",
                DDescription: """
- CABasicAnimation: Used for simple animations on layer properties. Here, it animates the position and opacity.
- CAAnimationGroup: Groups multiple animations, allowing them to run concurrently.
- DispatchQueue.main.async: Ensures the animation is triggered after the view appears.
""",
                sampleView: nil,
                code: nil
            )
        ]
    ),
    generalContentModel(
        id: 502,
        mainImage: "",
        mainTitle: "@Environment in SwiftUI",
        mainDescription: "Understanding the purpose and usage of the @Environment property wrapper in SwiftUI for accessing shared data and settings.",
        keywords: ["@Environment", "SwiftUI", "Property Wrapper", "Dependency Injection", "Top 50"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Purpose of @Environment",
                DDescription: """
    The @Environment property wrapper in SwiftUI is used to read values from the environment, allowing views to access shared data or settings. 
    It promotes dependency injection and facilitates dynamic updates when the environment value changes.
""",
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Usage Example",
                DDescription: """
    The following example demonstrates how to use @Environment to access the current color scheme in a SwiftUI view:
""",
                sampleView: nil,
                code: """
    import SwiftUI

    struct ContentView: View {
        @Environment(\\.colorScheme) var colorScheme  // Accessing the environment's color scheme

        var body: some View {
            VStack {
                Text("Current Color Scheme")
                    .font(.title)
                    .padding()

                Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .cornerRadius(10)
            }
            .padding()
            .background(colorScheme == .dark ? Color.gray : Color.blue) // Background based on color scheme
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
                    .preferredColorScheme(.light)  // Light mode preview

                ContentView()
                    .preferredColorScheme(.dark)   // Dark mode preview
            }
        }
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Explanation",
                DDescription: """
    - Accessing Environment Values: @Environment(\\.colorScheme) retrieves the current color scheme (light or dark).
    - Dynamic UI: The text color and background change based on the retrieved colorScheme, demonstrating dynamic responsiveness.
    - Previewing: ContentView_Previews uses .preferredColorScheme() for previews in both light and dark modes.
    """,
                sampleView: nil,
                code: nil
            )
        ]
    ),
    
    generalContentModel(
        id: 504,
        mainImage: "",
        mainTitle: "NavigationStack in SwiftUI",
        mainDescription: "An improved navigation container for SwiftUI, offering enhanced flexibility, state management, and multiple destination support.",
        keywords: ["NavigationStack", "SwiftUI", "Navigation", "State Management"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "NavigationStack Overview",
                DDescription: """
    NavigationStack is a SwiftUI container that presents a stack of views over a root view. Users navigate using NavigationLink, and the stack automatically manages state, maintaining the root view and a back button.
    """,
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Benefits of NavigationStack",
                DDescription: """
    - State Management: Bind a NavigationStack to a collection to control navigation state programmatically.
    - Data-Driven Navigation: Ensures type-safe navigation with data-bound destinations.
    - Multiple Destinations: Supports multiple destination types using navigationDestination.
    """,
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Example: Basic Navigation with Data Binding",
                DDescription: "Create a NavigationStack bound to a data array to track the view hierarchy programmatically.",
                sampleView: nil,
                code: """
    struct ContentView: View {
        @State private var presentedParks: [Park] = [] 
    /// by default navigation is managed in stack 
    /// however we can add more control by using out own stack
        var body: some View {
            NavigationStack(path: $presentedParks) {
                List(parks) { park in
                    NavigationLink(park.name, value: park)
                }
                .navigationDestination(for: Park.self) { park in
                    ParkDetails(park: park)
                }
            }
        }
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "Navigating Multiple View Types",
                DDescription: "Use navigationDestination to show different types of views in a single stack by matching NavigationLink types to respective destinations.",
                sampleView: nil,
                code: """
    struct ContentView: View {
        @State private var path = NavigationPath()
        var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    NavigationLink("Go to Park Details", value: Park(name: "Yellowstone"))
                    NavigationLink("Go to Animal Details", value: Animal(name: "Grizzly Bear"))
                }
                .navigationDestination(for: Park.self) { park in
                    ParkDetails(park: park)
                }
                .navigationDestination(for: Animal.self) { animal in
                    AnimalDetails(animal: animal)
                }
            }
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 34,
        mainImage: "",
        mainTitle: "Handling User Gestures in SwiftUI",
        mainDescription: "Learn how to handle common user gestures such as tap, swipe, and drag in SwiftUI.",
        keywords: ["SwiftUI", "Gestures", "Tap", "Swipe", "Drag"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Tap Gesture",
                DDescription: """
    A tap gesture is recognized when the user taps on a view. You can use the `onTapGesture` modifier to handle taps.
    """,
                sampleView: nil,
                code: """
    struct TapGestureView: View {
        @State private var tapCount = 0

        var body: some View {
            Text("Tap Count: \\(tapCount)")
                .onTapGesture {
                    tapCount += 1
                }
        }
    }
    """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Swipe Gesture",
                DDescription: """
    A swipe gesture is recognized when the user swipes in a specific direction. You can use the `onSwipeGesture` modifier to handle swipes.
    """,
                sampleView: nil,
                code: """
    struct SwipeGestureView: View {
        @State private var message = "Swipe me!"

        var body: some View {
            Text(message)
                .gesture(
                    DragGesture(minimumDistance: 30)
                        .onEnded { value in
                            if value.translation.width > 0 {
                                message = "Swiped Right!"
                            } else {
                                message = "Swiped Left!"
                            }
                        }
                )
        }
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Drag Gesture",
                DDescription: """
    A drag gesture allows the user to move a view around the screen. You can use the `DragGesture` modifier to handle drags.
    """,
                sampleView: nil,
                code: """
    struct DragGestureView: View {
        @State private var offset = CGSize.zero

        var body: some View {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .offset(x: offset.width, y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                        .onEnded { _ in
                            offset = .zero // Reset position after drag
                        }
                )
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 51,
        mainImage: "",
        mainTitle: "Integrating UIKit and SwiftUI",
        mainDescription: "Learn how to integrate UIKit views within SwiftUI using UIViewRepresentable and how to navigate to UIKit view controllers from SwiftUI.",
        keywords: ["UIKit", "SwiftUI", "UIViewRepresentable", "Integration", "Navigation"],
        technology: "SwiftUI & UIKit",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Using UIViewRepresentable",
                DDescription: """
    The `UIViewRepresentable` protocol allows you to wrap a UIKit view in a SwiftUI view. This is useful for using UIKit components that are not available in SwiftUI.
    """,
                sampleView: nil,
                code: """
    struct CustomUIView: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            // Update view properties here
        }
    }

    struct ContentView: View {
        var body: some View {
            CustomUIView()
                .frame(width: 200, height: 200)
        }
    }
    """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Navigating to a Storyboard UIViewController",
                DDescription: """
    You can navigate to a UIKit `UIViewController` from SwiftUI by creating a custom view that uses `UIViewControllerRepresentable`.
    """,
                sampleView: nil,
                code: """
    import SwiftUI

    class MyViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .green
        }
    }

    struct MyViewControllerRepresentable: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> MyViewController {
            return MyViewController()
        }

        func updateUIViewController(_ uiViewController: MyViewController, context: Context) {
            // Update the view controller if needed
        }
    }

    struct ContentView: View {
        var body: some View {
            NavigationView {
                NavigationLink(destination: MyViewControllerRepresentable()) {
                    Text("Go to UIKit View Controller")
                }
            }
        }
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Adding SwiftUI to UIKit",
                DDescription: """
    To add a SwiftUI view to a UIKit application, use `UIHostingController`. This allows you to embed SwiftUI views in UIKit view controllers.
    """,
                sampleView: nil,
                code: """
    import UIKit
    import SwiftUI

    class MyUIKitViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()

            let swiftUIView = MySwiftUIView()
            let hostingController = UIHostingController(rootView: swiftUIView)
            
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.view.frame = view.bounds
            hostingController.didMove(toParent: self)
        }
    }

    struct MySwiftUIView: View {
        var body: some View {
            Text("Hello from SwiftUI!")
                .padding()
        }
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "Using SwiftUI as a View in UIKit",
                DDescription: """
    You can use a `UIHostingController` to present a SwiftUI view from UIKit. This allows you to leverage SwiftUI's declarative syntax within UIKit.
    """,
                sampleView: nil,
                code: """
    class AnotherUIKitViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()

            let hostingController = UIHostingController(rootView: MySwiftUIView())
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.view.frame = view.bounds
            hostingController.didMove(toParent: self)
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 527,
        mainImage: "",
        mainTitle: "Using Combine for Asynchronous Data Management",
        mainDescription: "Combine is a framework that provides a declarative Swift API for processing values over time. It enables the creation of complex data pipelines for handling asynchronous events.",
        keywords: ["Combine", "Asynchronous", "Data Flow", "Swift", "API Call"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Overview of Combine",
                DDescription: """
    Combine allows developers to work with asynchronous data streams in a more manageable way. It helps in handling events, processing values, and chaining operations.
    """,
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Basic Components",
                DDescription: """
    Combine introduces several key components, including Publishers, Subscribers, and Operators. 
    Publishers emit values over time, Subscribers receive those values, and Operators transform the values in between.
    """,
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Example of Using Combine",
                DDescription: """
    Here’s a simple example demonstrating how to use Combine to manage a network request. In this case, we create a publisher that fetches data from a URL.
    """,
                sampleView: nil,
                code: """
    import Combine

    class NetworkManager {
        var cancellables = Set<AnyCancellable>()

        func fetchData(from url: URL) {
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: YourModel.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Finished")
                    case .failure(let error):
                        print("Error: \\(error)")
                    }
                }, receiveValue: { value in
                    print("Received value: \\(value)")
                })
                .store(in: &cancellables)
        }
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "Benefits of Using Combine",
                DDescription: """
    Combine provides a unified way to handle events and data flows, improving code readability and maintainability. It allows for chaining operations and handling errors more elegantly.
    """,
                sampleView: nil,
                code: nil
            )
        ]
    ),
    generalContentModel(
        id: 48,
        mainImage: "",
        mainTitle: "Managing State with Combine and @Published in SwiftUI",
        mainDescription: "Using Combine along with @Published properties allows for reactive state management in SwiftUI apps. This facilitates automatic UI updates when the state changes.",
        keywords: ["Combine", "@Published", "State Management", "SwiftUI"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Overview of State Management",
                DDescription: """
    State management is crucial in SwiftUI apps to ensure the UI reflects the underlying data model. Combine and @Published simplify this process by providing a reactive approach.
    """,
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Using @Published",
                DDescription: """
    The @Published property wrapper allows you to automatically notify views when a property value changes. When a property marked with @Published is updated, any view observing this property will re-render.
    """,
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Example of Using @Published",
                DDescription: """
    In the following example, we create a simple view model that holds a counter. The counter's value is updated, and the UI automatically reflects this change.
    """,
                sampleView: nil,
                code: """
    import Combine

    class CounterViewModel: ObservableObject {
        @Published var count = 0

        func increment() {
            count += 1
        }
    }

    struct CounterView: View {
        @ObservedObject var viewModel = CounterViewModel()

        var body: some View {
            VStack {
                Text("Count: \\(viewModel.count)")
                Button("Increment") {
                    viewModel.increment()
                }
            }
        }
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "Benefits of Using Combine with @Published",
                DDescription: """
    Using Combine with @Published helps in creating a more reactive user interface. It reduces the need for manual updates, making code cleaner and easier to manage.
    """,
                sampleView: nil,
                code: nil
            )
        ]
    ),
    generalContentModel(
        id: 503,
        mainImage: "",
        mainTitle: "Mastering Combine in SwiftUI",
        mainDescription: "Unlock the power of Combine for building dynamic, reactive, and efficient SwiftUI applications. Learn about Publishers, Subscribers, operators, state management, and more!",
        keywords: ["Combine", "SwiftUI", "Reactive Programming", "Publishers", "Subscribers", "Operators", "Data Flow", "Asynchronous", "State Management", "@Published", "API Calls", "Error Handling"],
        technology: "Swift",
        viewComponentDescription: [
            // Section 1: Introduction to Combine
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "What is Combine?",
                DDescription: """
    Combine is a powerful framework in Swift that provides a declarative API for handling asynchronous events and data flows. It allows you to work with values that change over time, making your code more reactive and easier to manage. Combine's key components are Publishers, Subscribers, and Operators.
    """,
                sampleView: nil,
                code: nil
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Basic Components: Publishers, Subscribers, and Operators",
                DDescription: """
    - Publishers: Entities that emit sequences of values over time. Think of them as sources of data.
    - Subscribers: Entities that react to the values emitted by publishers. They handle the received values and perform actions based on them.
    - Operators: Functions that transform, filter, combine, or otherwise modify the data streams flowing between publishers and subscribers.

    Together, these components allow you to create data pipelines for handling asynchronous operations and managing data flow in your applications.
    """,
                sampleView: nil,
                code: nil
            ),
            
            // Section 2: Practical Examples
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Example: Simple Publisher & Subscriber",
                DDescription: "Let's start with a simple example to demonstrate how publishers and subscribers work.",
                sampleView: nil,
                code: """
                // Example: Simple Publisher & Subscriber
                let publisher = Just("Hello, Combine!")
                let subscriber = AnySubscriber<String, Never>(
                    receiveSubscription: { _ in print("Subscription started") },
                    receiveValue: { value in print("Received value: \\(value)") },
                    receiveCompletion: { _ in print("Completed") }
                )
                publisher.subscribe(subscriber)
                """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "Example: Using Combine for a Network Request",
                DDescription: "Here's a practical example of how to use Combine to manage a network request, fetching data from a URL.",
                sampleView: nil,
                code: """
                import Combine

                class NetworkManager {
                    var cancellables = Set<AnyCancellable>()

                    func fetchData(from url: URL) {
                        URLSession.shared.dataTaskPublisher(for: url)
                            .map { $0.data }
                            .decode(type: YourModel.self, decoder: JSONDecoder())
                            .receive(on: DispatchQueue.main)
                            .sink(receiveCompletion: { completion in
                                switch completion {
                                case .finished:
                                    print("Finished")
                                case .failure(let error):
                                    print("Error: \\(error)")
                                }
                            }, receiveValue: { value in
                                print("Received value: \\(value)")
                            })
                            .store(in: &cancellables)
                    }
                }
                """
            ),
            
            // Section 3: State Management with Combine
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "State Management in SwiftUI with Combine and @Published",
                DDescription: "Learn how to effortlessly manage your SwiftUI view's state using Combine's reactive capabilities, ensuring the UI updates automatically.",
                sampleView: nil,
                code: """
                import Combine

                class CounterViewModel: ObservableObject {
                    @Published var count = 0

                    func increment() {
                        count += 1
                    }
                }

                struct CounterView: View {
                    @ObservedObject var viewModel = CounterViewModel()

                    var body: some View {
                        VStack {
                            Text("Count: \\(viewModel.count)")
                            Button("Increment") {
                                viewModel.increment()
                            }
                        }
                    }
                }
                """
            ),

            // Section 4: Advanced Techniques
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "Powerful Combine Operators",
                DDescription: """
    Combine provides a wealth of operators to modify data streams in various ways. Here are some examples:
    - map: Transform the values emitted by a publisher.
    - filter: Keep only values that meet a specific condition.
    - flatMap: Create a new publisher based on the values from an existing publisher.
    - merge: Combine multiple publishers into one.
    - catchError: Handle errors gracefully and provide alternative values.

    Explore these and other operators to tailor your Combine pipelines to your specific needs.
    """,
                sampleView: nil,
                code: """
                // Example: Using map and filter operators
                let numbers = [1, 2, 3, 4, 5]
                let publisher = Publishers.Sequence(sequence: numbers)
                    .map { $0 * 2 }  // Double the value
                    .filter { $0 > 5 } // Keep only values greater than 5
                publisher.sink { value in
                    print("Doubled and filtered value: \\(value)")
                }
                """
            ),
            DescriptionView(
                id: 7,
                DImage: "",
                DTitle: "Error Handling with Combine",
                DDescription: "Learn how to handle errors gracefully in your Combine pipelines using operators like `catch` and `tryMap`.",
                sampleView: nil,
                code: """
                // Example: Handling potential errors
                let publisher = Just(10)
                    .tryMap { value -> Int in
                        if value < 0 {
                            throw NSError(domain: "InvalidInput", code: -1, userInfo: nil)
                        }
                        return value
                    }
                    .catch { error in
                        return Just(0) // Handle error by emitting a default value
                    }
                """
            ),
            
            // Section 5: Benefits of Combine
            DescriptionView(
                id: 8,
                DImage: "",
                DTitle: "Benefits of Using Combine",
                DDescription: """
    Combine offers numerous advantages for building modern Swift applications:
    - Cleaner Code: Combine helps to streamline asynchronous operations and data flow management, resulting in more readable and maintainable code.
    - Reactive Programming:  It enables a reactive approach to programming, allowing your UI to respond automatically to changes in data.
    - Error Handling:  Provides a robust mechanism for error handling in asynchronous processes.
    - Testability: Combine's declarative nature makes it easier to test your code and ensure the correctness of your data pipelines.
    """,
                sampleView: nil, 
                code: nil
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

struct interviewQuestionSwiftTestDuplicate : View {
    
    
    var body: some View {
        VStack{
            Button("Check Duplicate"){
                checkDuplicate()
            }
        }
    }
    func checkDuplicate(data: [generalContentModel] = interviewQuestionDataArray) {
        var seenIds = Set<Int>() // Use a Set to efficiently track seen IDs
        
        for item in data {
            if seenIds.contains(item.id) {
                print("##################### Duplicate ################")
                print("Duplicate id : \(item.id)")
                print("Title One : \(item.mainTitle)")
                // You can access the previous title by iterating through `data` or by using a dictionary if you need to store all titles.
                print("Title Two :  (Previous Title)") //  Here you'll need to get the previous title using a dictionary or loop.
                print("################################################")
            } else {
                print("checked")
                seenIds.insert(item.id)
            }
        }
    }
}
#Preview{
    interviewQuestionSwiftTestDuplicate()
}
