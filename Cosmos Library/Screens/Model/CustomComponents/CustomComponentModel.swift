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
        mainImage: "",
        mainTitle: "Animated Changing Text View in SwiftUI",
        mainDescription: "This guide explains how to build an animated text view that simulates typing effects for different phrases.",
        keywords: ["SwiftUI", "Animation", "Text View"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
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
        mainImage: "",
        mainTitle: "Custom Picker View in SwiftUI",
        mainDescription: "This guide shows how to create a dropdown picker view using a SwiftUI Menu and Picker. In this you can customise how view triggering the picker looks",
        keywords: ["SwiftUI", "Picker", "Menu", "Dropdown"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
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
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Custom Chips Component with Balanced Dynamic Rows in SwiftUI",
        mainDescription: "Explanation on creating a custom SwiftUI chips component with dynamically arranged rows based on screen width.",
        keywords: ["SwiftUI", "Chips", "Dynamic Rows", "Responsive UI"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Struct Definition and Bindings",
                DDescription: "The `productChips` struct defines the chips component, where selected chips are passed as a binding, and all chips are provided as a state variable. `onClick` is used for actions triggered upon chip addition.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Row Arrangement Logic",
                DDescription: "The `divideIntoRowsProduct` function arranges chips into rows dynamically based on `availableWidth`, ensuring chips fit within the screen’s width by calculating each chip’s width.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Chip Removal",
                DDescription: "The `removeChip` function removes a chip from the selected list by locating it by `id` and removing it from `selectedChips`.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Button to Add Chips",
                DDescription: "The '+ Add' button calls `onClick` when tapped, allowing further chips to be selected.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Complete Code",
                DDescription: "The complete code for a custom chip component that arranges chips in rows according to available width and handles selection, removal, and addition of chips.",
                sampleView: AnyView(productChips(selectedChips: .constant([1, 2]), allChips: [ChipsInputStruct(id: 1, name: "Chip1"), ChipsInputStruct(id: 2, name: "Chip2"), ChipsInputStruct(id: 3, name: "Chip3")], onClick: {})),
                code: """
    import Foundation
    import SwiftUI

    struct productChips : View {
        @Binding var selectedChips: [Int]
        @State var allChips : [ChipsInputStruct]
        var onClick: (() -> Void)
        var body: some View {
            VStack {
                let rows = divideIntoRowsProduct(selectedIndex: selectedChips, chips: allChips, availableWidth: AppConstants.AppScreenWidth)
                ForEach(rows, id: \\.self) { rowChips in
                    HStack(spacing: 8) {
                        ForEach(rowChips, id: \\.id) { chip in
                            HStack {
                                Text(chip.name)
                                Text("X")
                                    .bold()
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        removeChip(at: chip.id)
                                    }
                            }.modifier(paddedOverlay(paddingAmount: 10, cornerRadius: 30))
                        }.multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                HStack {
                    Button {
                        onClick()
                    } label: {
                        Text("+ Add")
                            .padding(10)
                            .padding(.horizontal, 2)
                            .background(.blue.opacity(0.1))
                            .cornerRadius(30)
                            .foregroundColor(.blue)
                            .modifier(paddedOverlay(strokeColor: .blue, paddingAmount: 0, cornerRadius: 30))
                    }
                    Spacer()
                }
            }
        }
        
        func removeChip(at id: Int) {
            if let index = selectedChips.firstIndex(where: { $0 == id }) {
                selectedChips.remove(at: index)
            }
        }

        private func calculateTextWidth(text: String) -> CGFloat {
            let font = UIFont.systemFont(ofSize: 17)
            let attributes = [NSAttributedString.Key.font: font]
            let size = (text as NSString).size(withAttributes: attributes)
            return size.width
        }
        
        private func divideIntoRowsProduct(selectedIndex: [Int], chips: [ChipsInputStruct], availableWidth: CGFloat) -> [[ChipsInputStruct]] {
            var rows: [[ChipsInputStruct]] = []
            var currentRowChips: [ChipsInputStruct] = []
            var currentRowWidth: CGFloat = 0

            for index in selectedIndex {
                if let chip = allChips.first(where: { $0.id == index }) {
                    let chipWidth = calculateTextWidth(text: chip.name) + 50
                    if currentRowWidth + chipWidth <= availableWidth {
                        currentRowChips.append(chip)
                        currentRowWidth += chipWidth
                    } else {
                        rows.append(currentRowChips)
                        currentRowChips = [chip]
                        currentRowWidth = chipWidth
                    }
                }
            }
            if !currentRowChips.isEmpty {
                rows.append(currentRowChips)
            }
            return rows
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Implementing Dynamic Color Rating View in SwiftUI",
        mainDescription: "Steps to create a custom rating view that adjusts its color and text dynamically based on a fractional rating, blending colors for intermediate values.",
        keywords: ["SwiftUI", "Rating System", "Dynamic Color", "Hex Colors", "Blend Color"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(

                DImage: "",
                DTitle: "Defining the `ColorRatingView` Structure",
                DDescription: "The main structure `ColorRatingView` takes a rating and dynamically changes its color based on the score, with color transitioning for fractional values. It also rounds the rating for display.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Color Blending for Fractional Ratings",
                DDescription: "The `textColor` function calculates a color based on the rating. It transitions smoothly between two colors based on fractional values using `blendColor`.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Extension for Color Components and Hex Initialization",
                DDescription: "An extension for `Color` provides RGB component extraction and a hex initializer to allow color customization using hex values.",
                sampleView: nil,
                code: ""
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Sample View with Ratings Displayed",
                DDescription: "The `RatingSystemSample` view demonstrates the `ColorRatingView` with various ratings. The preview shows different colors based on the rating, providing a full overview of the gradient effect.",
                sampleView: AnyView(RatingSystemSample()),
                code: """
    import Foundation
    import SwiftUI

    struct ColorRatingView: View {
        let rating: Double // Use Double for a fractional rating
        
        var body: some View {
            if rating > 0.9 {
                Text(String(format: "%.1f★", rating))
                    .foregroundColor(textColor())
                    .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
                    .background(textColor().opacity(0.2))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(textColor(), lineWidth: 2)
                    )
            }
        }
        
        private func textColor() -> Color {
            let roundedRating = round(rating * 10) / 10.0 // Round to one decimal place
            
            switch roundedRating {
            case 5.0:
                return Color(hex: "#57e32c") // green
            case 4.0..<5.0:
                let fraction = (roundedRating - 4.0) / 1.0
                return blendColor(from: Color(hex: "#b7dd29"), to: Color(hex: "#57e32c"), fraction: fraction)
            case 3.0..<4.0:
                let fraction = (roundedRating - 3.0) / 1.0
                return blendColor(from: Color(hex: "#ffe234"), to: Color(hex: "#b7dd29"), fraction: fraction)
            case 2.0..<3.0:
                let fraction = (roundedRating - 2.0) / 1.0
                return blendColor(from: Color(hex: "#ffa534"), to: Color(hex: "#ffe234"), fraction: fraction)
            case 1.0..<2.0:
                return Color(hex: "#ff4545") // Red
            default:
                return .black
            }
        }
        
        private func blendColor(from start: Color, to end: Color, fraction: Double) -> Color {
            let red = start.components.red + (end.components.red - start.components.red) * fraction
            let green = start.components.green + (end.components.green - start.components.green) * fraction
            let blue = start.components.blue + (end.components.blue - start.components.blue) * fraction
            return Color(red: red, green: green, blue: blue)
        }
    }

    extension Color {
        var components: (red: Double, green: Double, blue: Double) {
            let uiColor = UIColor(self)
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
            return (Double(red), Double(green), Double(blue))
        }
        
        init(hex: String) {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
            
            var rgb: UInt64 = 0
            Scanner(string: hexSanitized).scanHexInt64(&rgb)
            
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue)
        }
    }

    #Preview {
            ColorRatingView(rating: 4.7)
    }
    """
            )
        ]
    ),
    generalContentModel(
                mainImage: "",
                mainTitle: "Implementing a Search Bar with Delayed Search in SwiftUI",
                mainDescription: "Learn how to create a search bar in SwiftUI that automatically triggers a search action after a brief delay when the user stops typing, improving user experience by reducing unnecessary searches.",
                keywords: ["SwiftUI", "Search Bar", "Delayed Search", "Timer", "onChange"],
                technology: "SwiftUI",
                viewComponentDescription: [
                    DescriptionView(
                        DImage: "",
                        DTitle: "Creating the `SearchBar` Structure",
                        DDescription: "Define the `SearchBar` struct, which will hold the UI elements and logic for the search bar. It takes properties like `searchHint`, `delaySecond`, and a binding for the search text (`searchBar`).",
                        sampleView: nil,
                        code: """
        struct SearchBar: View {
            @State var searchHint : String
            @State var delaySecond : TimeInterval
            @Binding var searchBar : String
            @State private var timer: Timer? = nil
            var searchAction: (() -> Void)
            
            var body: some View {
                VStack {
                    TextField(searchHint, text: $searchBar)
                        .font(.system(size: 16))
                        .onChange(of: searchBar) {oldValue, newValue in
                            timer?.invalidate() // Invalidate previous timer
                            timer = Timer.scheduledTimer(withTimeInterval: delaySecond, repeats: false) { _ in
                                searchAction()
                            }
                        }
                }
            }
        }
        """
                    ),
                    DescriptionView(
                        DImage: "",
                        DTitle: "Using `onChange` for Text Changes",
                        DDescription: "The `onChange` modifier is attached to the `searchBar` binding to detect changes in the search text. When the text changes, it triggers the logic to manage the timer.",
                        sampleView: nil,
                        code: """
        .onChange(of: searchBar) {oldValue, newValue in
            timer?.invalidate() // Invalidate previous timer
            timer = Timer.scheduledTimer(withTimeInterval: delaySecond, repeats: false) { _ in
                searchAction()
            }
        }
        """
                    ),
                    DescriptionView(
                        DImage: "",
                        DTitle: "Managing the Timer",
                        DDescription: "Inside the `onChange` closure, a timer is created with the specified `delaySecond`. When the timer fires, the `searchAction` closure is executed, triggering the search logic.",
                        sampleView: nil,
                        code: """
        timer?.invalidate() // Invalidate previous timer
        timer = Timer.scheduledTimer(withTimeInterval: delaySecond, repeats: false) { _ in
            searchAction()
        }
        """
                    ),
                    DescriptionView(
                        DImage: "",
                        DTitle: "Preview Example",
                        DDescription: "Here's a preview example to test the `SearchBar` functionality. You can replace the `print` statement with your actual search logic.",
                        sampleView: AnyView(SearchBar_Preview()),
                        code: """
        struct SearchBar_Preview: View {
            @State var searchText: String = ""
            
            var body: some View {
                VStack{
                    SearchBar(searchHint: "Search", delaySecond: 0.4, searchBar: $searchText) {
                        print("searching for \\(searchText)")
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
        mainImage: "",
        mainTitle: "Implementing a Multi-Select Chip Group in SwiftUI",
        mainDescription: "Learn how to create a flexible and customizable chip group view in SwiftUI that supports both single and multiple selections, allowing users to easily choose from a list of options.",
        keywords: ["SwiftUI", "Chip Group", "Multi-Select", "Chips", "UI Design", "Customizable"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Defining the `ChipsInputStruct`",
                DDescription: "Create a structure to represent each chip in the group. It will contain an `id` for identification and a `name` for displaying the chip's label.",
                sampleView: nil,
                code: """
        struct ChipsInputStruct: Identifiable, Hashable, Codable {
            let id: Int
            let name: String
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Creating the `ChipGroup` View",
                DDescription: "Define the `ChipGroup` view, which will contain the logic for displaying and managing the chips. It takes a binding for the selected chips (`selectedChips`), an array of chips (`chips`), a flag for allowing multiple selections (`allowMultipleSelection`), and optional parameters for customization.",
                sampleView: nil,
                code: """
        struct ChipGroup: View {
            @Binding var selectedChips: [Int]
            let chips: [ChipsInputStruct]
            let allowMultipleSelection: Bool
            var isSelectMarketView : Bool = false
            let numberOfStacks = 3 // split is 3 lines when isSelectMarketView
            var body: some View {
                VStack(alignment: .leading, spacing: 8) {
                    if isSelectMarketView{
                        ScrollView(.horizontal, showsIndicators: false){
                            ForEach(0..<numberOfStacks, id: \\.self) { index in
                                HStack {
                                    ForEach(splitWordsEvenly(array: chips, into: numberOfStacks)[index], id: \\.id) { chip in
                                        createChipView(chip: chip)
                                        
                                    }
                                    Spacer()
                                }.padding(.horizontal,1)
                            }
                            
                        }
                    }
                    else {
                        let rows = divideIntoRows(chips: chips, availableWidth: AppConstants.AppScreenWidth)
                        ForEach(rows, id: \\.self) { rowChips in
                            HStack(spacing: 8) {
                                
                                ForEach(rowChips, id: \\.id) { chip in
                                    createChipView(chip: chip)
                                }.multilineTextAlignment(.center)
                                
                            }
                        }
                    }
                }
            }
        
            private func createChipView(chip: ChipsInputStruct) -> some View {
                Button(action: {
                    toggleSelection(chip.id)
                }) {
                    Text("\\(chip.name)")
                        .foregroundColor(selectedChips.contains(chip.id) ? .white : .black)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(selectedChips.contains(chip.id) ? Color.blue : Color.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(selectedChips.contains(chip.id) ? Color.blue : Color.gray, lineWidth: 0.2)
                        )
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                }
                .buttonStyle(PlainButtonStyle()) // Remove button highlighting
            }
        
            private func divideIntoRows(chips: [ChipsInputStruct], availableWidth: CGFloat) -> [[ChipsInputStruct]] {
                var rows: [[ChipsInputStruct]] = []
                var currentRowChips: [ChipsInputStruct] = []
                var currentRowWidth: CGFloat = 0
        
                for chip in chips {
                    let chipWidth = calculateTextWidth(text: chip.name) + 40 // Add padding to chip width
                    if currentRowWidth + chipWidth <= availableWidth {
                        currentRowChips.append(chip)
                        currentRowWidth += chipWidth
                    } else {
                        rows.append(currentRowChips)
                        currentRowChips = [chip]
                        currentRowWidth = chipWidth
                    }
                }
        
                if !currentRowChips.isEmpty {
                    rows.append(currentRowChips)
                }
        
                return rows
            }
            
            // equally divides into rows
            func splitWordsEvenly(array: [ChipsInputStruct], into parts: Int) -> [[ChipsInputStruct]] {
                let sortedArray = array.sorted(by: { $0.name.count > $1.name.count }) // Sort by word length
                
                var buckets: [[ChipsInputStruct]] = Array(repeating: [], count: parts)
                
                for word in sortedArray {
                    let shortestBucket = buckets.min { $0.reduce(0) { $0 + $1.name.count } < $1.reduce(0) { $0 + $1.name.count } } ?? []
                    buckets[buckets.firstIndex(of: shortestBucket) ?? 0].append(word)
                }
                
                return buckets
            }
        
            private func toggleSelection(_ chipId: Int) {
                if allowMultipleSelection {
                    if let index = selectedChips.firstIndex(of: chipId) {
                        selectedChips.remove(at: index)
                    } else {
                        selectedChips.append(chipId)
                    }
                } else {
                    if selectedChips.contains(chipId) {
                        selectedChips.removeAll()
                    } else {
                        selectedChips = [chipId]
                    }
                }
            }
        
        
            private func calculateTextWidth(text: String) -> CGFloat {
                let font = UIFont.systemFont(ofSize: 17)
                let attributes = [NSAttributedString.Key.font: font]
                let size = (text as NSString).size(withAttributes: attributes)
                return size.width
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Creating a Chip View",
                DDescription: "Inside the `ChipGroup` view, create a helper function `createChipView` to define the appearance and behavior of each individual chip. This function will handle the selection logic, styling, and tap actions.",
                sampleView: nil,
                code: """
        private func createChipView(chip: ChipsInputStruct) -> some View {
            Button(action: {
                toggleSelection(chip.id)
            }) {
                Text("\\(chip.name)")
                    .foregroundColor(selectedChips.contains(chip.id) ? .white : .black)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(selectedChips.contains(chip.id) ? Color.blue : Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(selectedChips.contains(chip.id) ? Color.blue : Color.gray, lineWidth: 0.2)
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
            }
            .buttonStyle(PlainButtonStyle()) // Remove button highlighting
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Handling Chip Selection",
                DDescription: "Implement the `toggleSelection` function within the `ChipGroup` view to manage the selection state of the chips. This function determines how the selected chips are updated based on whether multiple selections are allowed.",
                sampleView: nil,
                code: """
        private func toggleSelection(_ chipId: Int) {
            if allowMultipleSelection {
                if let index = selectedChips.firstIndex(of: chipId) {
                    selectedChips.remove(at: index)
                } else {
                    selectedChips.append(chipId)
                }
            } else {
                if selectedChips.contains(chipId) {
                    selectedChips.removeAll()
                } else {
                    selectedChips = [chipId]
                }
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Arranging Chips in Rows",
                DDescription: "Create the `divideIntoRows` function to arrange the chips into multiple rows, ensuring that they fit within the available width of the screen. This helps maintain a visually appealing layout.",
                sampleView: nil,
                code: """
        private func divideIntoRows(chips: [ChipsInputStruct], availableWidth: CGFloat) -> [[ChipsInputStruct]] {
            var rows: [[ChipsInputStruct]] = []
            var currentRowChips: [ChipsInputStruct] = []
            var currentRowWidth: CGFloat = 0

            for chip in chips {
                let chipWidth = calculateTextWidth(text: chip.name) + 40 // Add padding to chip width
                if currentRowWidth + chipWidth <= availableWidth {
                    currentRowChips.append(chip)
                    currentRowWidth += chipWidth
                } else {
                    rows.append(currentRowChips)
                    currentRowChips = [chip]
                    currentRowWidth = chipWidth
                }
            }

            if !currentRowChips.isEmpty {
                rows.append(currentRowChips)
            }

            return rows
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Splitting Chips into Even Rows",
                DDescription: "Create the `splitWordsEvenly` function to split the chips into an even number of rows for a more visually appealing layout when the `isSelectMarketView` flag is set to true. This function uses a sorting and bucket-filling approach to distribute chips evenly across rows.",
                sampleView: nil,
                code: """
        // equally divides into rows
        func splitWordsEvenly(array: [ChipsInputStruct], into parts: Int) -> [[ChipsInputStruct]] {
            let sortedArray = array.sorted(by: { $0.name.count > $1.name.count }) // Sort by word length
            
            var buckets: [[ChipsInputStruct]] = Array(repeating: [], count: parts)
            
            for word in sortedArray {
                let shortestBucket = buckets.min { $0.reduce(0) { $0 + $1.name.count } < $1.reduce(0) { $0 + $1.name.count } } ?? []
                buckets[buckets.firstIndex(of: shortestBucket) ?? 0].append(word)
            }
            
            return buckets
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Calculating Text Width",
                DDescription: "Create a helper function `calculateTextWidth` to determine the width of each chip's text, which is used in the `divideIntoRows` function to accurately calculate the arrangement of chips within the rows.",
                sampleView: nil,
                code: """
        private func calculateTextWidth(text: String) -> CGFloat {
            let font = UIFont.systemFont(ofSize: 17)
            let attributes = [NSAttributedString.Key.font: font]
            let size = (text as NSString).size(withAttributes: attributes)
            return size.width
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Preview Example",
                DDescription: "This preview example demonstrates how to use the `ChipGroup` view. It creates a list of `ChipsInputStruct` instances and passes them to the `ChipGroup` along with the necessary configuration options.",
                sampleView: AnyView(ChipGroupView()),
                code: """
        struct ChipGroupView: View {
            @State private var selectedChips: [Int] = [] // Change to [Int]

            var body: some View {
                VStack{
                    
                    ChipGroup(selectedChips: $selectedChips, chips: [
                        ChipsInputStruct(id: 1, name: "Chip"),
                        ChipsInputStruct(id: 2, name: "Chip"),
                        ChipsInputStruct(id: 3, name: "Chip"),
                    ], allowMultipleSelection: true)
                    Text("hello")
                    Spacer()
                }
            }
        }
        """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Playing GIFs in SwiftUI using WKWebView",
        mainDescription: "Learn how to display animated GIFs within your SwiftUI views using the WKWebView framework. This technique provides flexibility for loading and displaying GIFs from your project's resources.",
        keywords: ["SwiftUI", "GIF", "WKWebView", "Animation", "Image", "UIViewRepresentable"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Creating the `GifImage` Structure",
                DDescription: "Define the `GifImage` struct, which conforms to the `UIViewRepresentable` protocol. This struct will bridge the gap between SwiftUI and the `WKWebView` for displaying the GIF.",
                sampleView: nil,
                code: """
        import SwiftUI
        import WebKit

        struct GifImage: UIViewRepresentable {
            private let name: String

            init(_ name: String) {
                self.name = name
            }

            func makeUIView(context: Context) -> WKWebView {
                let webView = WKWebView()
                let url = Bundle.main.url(forResource: name, withExtension: "gif")!
                let data = try! Data(contentsOf: url)
                webView.load(
                    data,
                    mimeType: "image/gif",
                    characterEncodingName: "UTF-8",
                    baseURL: url.deletingLastPathComponent()
                )
                webView.scrollView.isScrollEnabled = false

                return webView
            }

            func updateUIView(_ uiView: WKWebView, context: Context) {
                uiView.reload()
            }

        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Implementing `makeUIView`",
                DDescription: "Inside the `GifImage` struct, implement the `makeUIView` function. This function is responsible for creating a `WKWebView` instance, loading the GIF data from your project's resources, and setting up the web view to display the animation.",
                sampleView: nil,
                code: """
        func makeUIView(context: Context) -> WKWebView {
            let webView = WKWebView()
            let url = Bundle.main.url(forResource: name, withExtension: "gif")!
            let data = try! Data(contentsOf: url)
            webView.load(
                data,
                mimeType: "image/gif",
                characterEncodingName: "UTF-8",
                baseURL: url.deletingLastPathComponent()
            )
            webView.scrollView.isScrollEnabled = false

            return webView
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Implementing `updateUIView`",
                DDescription: "Implement the `updateUIView` function to handle updates to the `GifImage` view. In this case, it simply reloads the `WKWebView` to ensure the animation continues if needed.",
                sampleView: nil,
                code: """
        func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.reload()
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using `GifImage` in your SwiftUI View",
                DDescription: "To use the `GifImage` in your SwiftUI view, simply create an instance of the `GifImage` struct, passing the name of your GIF file as the argument. Make sure your GIF is in a file, not an asset, in your project's resources.",
                sampleView: AnyView(
                    GifImage("birdGif")
                        .frame(height: 300)
                ),
                code: """
        struct GifImage_Previews: PreviewProvider {
            static var previews: some View {
                GifImage("NoData")
            }
        }
        """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Displaying Files in SwiftUI using QLPreviewController",
        mainDescription: "Learn how to integrate the `QLPreviewController` from Quick Look into your SwiftUI views to provide a native file preview experience for various file types.",
        keywords: ["SwiftUI", "QLPreviewController", "Quick Look", "File Preview", "File Types", "UIViewRepresentable"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Creating the `FilePreview` Structure",
                DDescription: "Define the `FilePreview` struct, which conforms to the `UIViewRepresentable` protocol. This struct will bridge the gap between SwiftUI and the `QLPreviewController`.",
                sampleView: nil,
                code: """
        import SwiftUI
        import QuickLook

        struct FilePreview: UIViewRepresentable {
            let fileURL: URL

            func makeUIView(context: Context) -> QLPreviewController {
                let previewController = QLPreviewController()
                previewController.dataSource = context.coordinator
                return previewController
            }

            func updateUIView(_ uiView: QLPreviewController, context: Context) {
                // No update needed, QLPreviewController handles updates internally
            }

            func makeCoordinator() -> Coordinator {
                Coordinator(fileURL: fileURL)
            }

            class Coordinator: NSObject, QLPreviewControllerDataSource {
                let fileURL: URL

                init(fileURL: URL) {
                    self.fileURL = fileURL
                }

                func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
                    return 1
                }

                func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
                    return fileURL as QLPreviewItem
                }
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Implementing `makeUIView`",
                DDescription: "Inside the `FilePreview` struct, implement the `makeUIView` function. This function creates a `QLPreviewController` instance, sets its data source to the coordinator (which handles data retrieval), and returns the preview controller.",
                sampleView: nil,
                code: """
        func makeUIView(context: Context) -> QLPreviewController {
            let previewController = QLPreviewController()
            previewController.dataSource = context.coordinator
            return previewController
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Implementing `makeCoordinator`",
                DDescription: "Implement the `makeCoordinator` function to create a coordinator object that conforms to the `QLPreviewControllerDataSource` protocol. This coordinator will be responsible for providing the file URL to the `QLPreviewController`.",
                sampleView: nil,
                code: """
        func makeCoordinator() -> Coordinator {
            Coordinator(fileURL: fileURL)
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "The Coordinator Class",
                DDescription: "Define the `Coordinator` class, which conforms to the `QLPreviewControllerDataSource` protocol. This class implements the required methods to provide data to the `QLPreviewController`, such as the number of preview items and the preview item at a given index.",
                sampleView: nil,
                code: """
        class Coordinator: NSObject, QLPreviewControllerDataSource {
            let fileURL: URL

            init(fileURL: URL) {
                self.fileURL = fileURL
            }

            func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
                return 1
            }

            func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
                return fileURL as QLPreviewItem
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using `FilePreview` in your SwiftUI View",
                DDescription: "To use the `FilePreview` in your SwiftUI view, create an instance of the `FilePreview` struct, passing the URL of the file you want to preview. Make sure the file exists and is accessible.",
                sampleView: nil,
                code: """
        // Example usage
        struct ContentView: View {
            let fileURL = Bundle.main.url(forResource: "your_file_name", withExtension: "your_file_extension")!

            var body: some View {
                FilePreview(fileURL: fileURL)
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Handling Photo Library Permissions",
                DDescription: "For previewing files from the photo library, you'll need to request permission from the user. Create a utility class like `PhotoLibraryPermissionManager` to handle the permission request.",
                sampleView: AnyView(
                    VStack{  
                        SampleFilePickerPreview()
                    }.frame(minHeight: 300)
                ),
                code: """
        class PhotoLibraryPermissionManager {
            static func checkPermission(completion: @escaping (PHAuthorizationStatus) -> Void) {
                let status = PHPhotoLibrary.authorizationStatus()
                switch status {
                case .notDetermined:
                    // Request permission
                    PHPhotoLibrary.requestAuthorization { newStatus in
                        completion(newStatus)
                    }
                case .restricted, .denied, .authorized, .limited:
                    completion(status)
                @unknown default:
                    fatalError("Unknown status of PHPhotoLibrary authorization")
                }
            }
        }
        """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Implementing Autocomplete Functionality in SwiftUI",
        mainDescription: "Learn how to build an autocomplete feature in SwiftUI to enhance user input and provide suggestions as they type. This tutorial covers the basic implementation using a `TextField` and a `List` for suggestions.",
        keywords: ["SwiftUI", "Autocomplete", "TextField", "List", "Suggestions", "User Input", "onChange"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Creating the `autoComplete` Structure",
                DDescription: "Define the `autoComplete` struct, which will hold the UI elements and logic for the autocomplete feature. It takes a binding for the search text (`searchText`), an array of suggestions (`suggestions`), and manages the visibility of the suggestion list.",
                sampleView: nil,
                code: """
        import SwiftUI

        struct autoComplete: View {
            @Binding var searchText : String
            @State var suggestions: [String]
            @State var showLists = true
            @State var clickedListItem = false
            var body: some View {
                VStack {
                    TextField("Type something", text: $searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: searchText){ _,_ in
                            if clickedListItem{
                                showLists = false
                                clickedListItem = false
                                
                            } else {
                                showLists = true
                            }
                        }
                    if showLists {
                        List {
                            ForEach(suggestions.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }, id: \\.self) { suggestion in
                                Text(suggestion)
                                    .onTapGesture {
                                        searchText = suggestion
                                        clickedListItem = true
                                    }
                            }   
                        }.frame(maxHeight: 100)
                            .listStyle(.plain)
                    }
                }
                .padding()
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using a `TextField` for Input",
                DDescription: "The `autoComplete` view uses a `TextField` to capture the user's input. The `searchText` binding is connected to the `TextField`, so changes in the text field will update the `searchText` variable.",
                sampleView: nil,
                code: """
        TextField("Type something", text: $searchText)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Managing the Suggestion List Visibility",
                DDescription: "The `showLists` state variable controls the visibility of the suggestion list. It's initially set to `true` and is updated using the `onChange` modifier on the `searchText` binding.",
                sampleView: nil,
                code: """
        @State var showLists = true
        
        .onChange(of: searchText){ _,_ in
            if clickedListItem{
                showLists = false
                clickedListItem = false
                
            } else {
                showLists = true
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Filtering Suggestions",
                DDescription: "The `List` displays suggestions from the `suggestions` array. It uses `filter` to show only suggestions that match the current search text (case-insensitive).",
                sampleView: nil,
                code: """
        List {
            ForEach(suggestions.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }, id: \\.self) { suggestion in
                // ...
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Handling Tap Gestures",
                DDescription: "Each suggestion in the `List` has an `onTapGesture` attached. When a suggestion is tapped, the `searchText` is updated with the selected suggestion, and the `clickedListItem` state variable is set to `true` to hide the suggestion list.",
                sampleView: nil,
                code: """
        Text(suggestion)
            .onTapGesture {
                searchText = suggestion
                clickedListItem = true
            }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Preview Example",
                DDescription: "Here's a preview example that shows the `autoComplete` view in action. It uses a sample list of suggestions to demonstrate the autocomplete functionality.",
                sampleView: AnyView(
                    autoCompletePreview()
                        .frame(height: 200)
                                   ),
                code: """
        struct autoCompletePreview: View {
            @State var SearchText = ""
            @State var SampleList = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grape"]
            var body : some View {
                autoComplete(searchText: $SearchText, suggestions: SampleList)
            }
        }
        """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Implementing a Countdown Timer in SwiftUI",
        mainDescription: "Learn how to create a countdown timer in SwiftUI that displays the remaining time and provides the functionality to execute a custom action when the timer reaches zero. This tutorial covers the basics of using `Timer` and state management for the countdown logic.",
        keywords: ["SwiftUI", "Countdown Timer", "Timer", "State Management", "onReceive", "onAppear"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Creating the `CountDownTimer` Structure",
                DDescription: "Define the `CountDownTimer` struct, which will hold the UI elements and logic for the countdown timer. It takes the initial `timeRemaining` as a state variable and uses a timer to update the remaining time. It also provides an optional closure (`timeReachedZeroAction`) to execute when the timer reaches zero.",
                sampleView: nil,
                code: """
        import SwiftUI
        import Combine

        struct CountDownTimer: View {
            @State var timeRemaining: Int
            let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

            @State private var startTime: Date?
            @State private var remainingTime: Int?
            @State var showSecondWhenHours : Bool = false // view related
            var timeReachedZeroAction: (() -> Void)?

            var body: some View {
                ZStack {
                    VStack {
                        Text(formattedTime)
                            .clipShape(Capsule())
                            .foregroundColor(remainingTime ?? timeRemaining > 59 ? .black : .red)
                    }.modifier(cardView())
                }

                .onReceive(timer) { _ in
                    if startTime == nil {
                        // Capture the start time when the countdown begins
                        startTime = Date()
                        remainingTime = timeRemaining
                    } else if let startTime = startTime, let remainingTime = remainingTime, remainingTime > 0 {
                        let currentTime = Date()
                        let elapsed = Int(currentTime.timeIntervalSince(startTime))
                        self.remainingTime = max(timeRemaining - elapsed, 0)
        //                print(self.remainingTime ?? 0)
                        if remainingTime <= 1 {
                                            // Execute the optional function if provided
                                            timeReachedZeroAction?()
                                        }
                    }
                }
                .onAppear {
                    startTime = Date() // Reset start time when view appears
                    remainingTime = timeRemaining
                }
            }

            var formattedTime: String {
                let remaining = remainingTime ?? timeRemaining
                let hours = remaining / 3600
                let minutes = (remaining % 3600) / 60
                let seconds = remaining % 60

                if hours > 0 {
                    if showSecondWhenHours{
                        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
                    }
                    return String(format: "%2dh:%02d", hours, minutes)
                } else if minutes > 0 {
                    return String(format: "%02d:%02d", minutes, seconds)
                } else {
                    return String(format: "%02d", seconds)
                }
            }
        }
        """
            ),
            DescriptionView(

                DImage: "",
                DTitle: "Using a `Timer`",
                DDescription: "The `CountDownTimer` view uses a `Timer` to update the time remaining. The timer publishes events every second, which are then received by the view's `onReceive` modifier. Inside the `onReceive` closure, the remaining time is calculated and updated based on the elapsed time.",
                sampleView: nil,
                code: """
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

        .onReceive(timer) { _ in
            // ... countdown logic
        }
        """
            ),
            DescriptionView(
                
                DImage: "",
                DTitle: "Calculating Remaining Time",
                DDescription: "The countdown logic calculates the elapsed time since the start time and subtracts it from the initial `timeRemaining`. The `remainingTime` state variable is updated with the new value.",
                sampleView: nil,
                code: """
        if let startTime = startTime, let remainingTime = remainingTime, remainingTime > 0 {
            let currentTime = Date()
            let elapsed = Int(currentTime.timeIntervalSince(startTime))
            self.remainingTime = max(timeRemaining - elapsed, 0)
        }
        """
            ),
            DescriptionView(
                
                DImage: "",
                DTitle: "Handling Timer Completion",
                DDescription: "When the `remainingTime` reaches zero or less, the optional `timeReachedZeroAction` closure is executed, allowing you to trigger custom actions when the timer completes.",
                sampleView: nil,
                code: """
        if remainingTime <= 1 {
            timeReachedZeroAction?()
        }
        """
            ),
            DescriptionView(
                
                DImage: "",
                DTitle: "Formatting the Time Display",
                DDescription: "The `formattedTime` computed property formats the remaining time into a readable string. It handles displaying hours, minutes, and seconds appropriately based on the remaining time.",
                sampleView: nil,
                code: """
        var formattedTime: String {
            let remaining = remainingTime ?? timeRemaining
            let hours = remaining / 3600
            let minutes = (remaining % 3600) / 60
            let seconds = remaining % 60

            // ... formatting logic
        }
        """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Creating a Custom OTP (One-Time Password) Input View in SwiftUI",
        mainDescription: "Learn how to design a visually appealing and user-friendly OTP input view in SwiftUI. This tutorial covers the implementation of a custom view that displays a series of boxes for entering digits, along with features like input validation and a done button on the keyboard.",
        keywords: ["SwiftUI", "OTP", "One-Time Password", "Input View", "Custom View", "Keyboard", "Validation", "Binding"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                
                DImage: "",
                DTitle: "Creating the `OTPBoxView` Structure",
                DDescription: "Define the `OTPBoxView` struct, which will contain the UI elements and logic for the OTP input. It takes a binding for the OTP text (`otpText`), a property for the number of digits (`numberOfDigit`), and an optional closure for handling the completion of the OTP entry (`autoCompleteFunc`).",
                sampleView: nil,
                code: """
        import Foundation
        import SwiftUI

        struct OTPBoxView : View {

            @Binding var otpText : String
            let numberOfDigit = 4

            var autoCompleteFunc: (() -> Void)?
            @FocusState private var iskeyboardShowing : Bool
            var body: some View {
                VStack{
                    HStack(spacing: 0){
                        ForEach(0..<numberOfDigit, id: \\.self){digit in
                            OTPTextBox(digit)
                        }
                    }.background(content:{
                        TextField("", text: $otpText.limit(numberOfDigit))
                            .keyboardType(.numberPad)
                            .textContentType(.oneTimeCode)
                            .focused($iskeyboardShowing)
                            .frame(width: 0.1, height: 0.1)
                            .opacity(0.0001)


                    })

                    .onTapGesture {
                        iskeyboardShowing = true
                    }
                    .onChange(of: otpText) {oldValue, newValue in

                            // MARK: making otp as num only
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.otpText = filtered
                            }
                            if newValue.count == numberOfDigit {
                                autoCompleteFunc?()
                            }
                        }

                }.onAppear(perform: {
                    iskeyboardShowing = true
                })
                .toolbar {
                    ToolbarItem(placement: .keyboard){
                        Button("Done"){
                            iskeyboardShowing.toggle()
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    }
                }
            }

            // OTP Box Design
            @ViewBuilder
            func OTPTextBox(_ index:Int)->some View{
                ZStack{
                    if otpText.count > index{
                        let startIndex = otpText.startIndex
                        let charIndex = otpText.index(startIndex, offsetBy: index)
                        let charToString = String(otpText[charIndex])
                        Text(charToString)
                    } else {
                        Text(" ")
                    }
                }.frame(width: 45, height: 45, alignment: .center)
                    // add bottom line here
        //            .background(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .overlay(
                                Rectangle()
                                    .frame(width: 45, height: 2)
                                    .foregroundColor(iskeyboardShowing && otpText.count == index ? .black:.gray) // Change the color as desired
                                    .padding(.top, 56) // Adjust the padding to position the underline
                            )
            }

        }
        """
            ),
            DescriptionView(
                
                DImage: "",
                DTitle: "Using an `HStack` for OTP Boxes",
                DDescription: "The `OTPBoxView` uses an `HStack` to arrange the individual OTP boxes side by side. This creates the familiar layout of separate boxes for entering each digit of the OTP.",
                sampleView: nil,
                code: """
        HStack(spacing: 0){
            ForEach(0..<numberOfDigit, id: \\.self){digit in
                OTPTextBox(digit)
            }
        }
        """
            ),
            DescriptionView(
                
                DImage: "",
                DTitle: "Creating the `OTPTextBox` View",
                DDescription: "Define a helper function `OTPTextBox` within the `OTPBoxView` to create the individual box view for each digit. This function handles displaying the digit, adding the bottom line, and providing the visual styling.",
                sampleView: nil,
                code: """
        @ViewBuilder
        func OTPTextBox(_ index:Int)->some View{
            ZStack{
                if otpText.count > index{
                    let startIndex = otpText.startIndex
                    let charIndex = otpText.index(startIndex, offsetBy: index)
                    let charToString = String(otpText[charIndex])
                    Text(charToString)
                } else {
                    Text(" ")
                }
            }.frame(width: 45, height: 45, alignment: .center)
                // add bottom line here
        //            .background(.gray.opacity(0.2))
                .frame(maxWidth: .infinity)
                .overlay(
                            Rectangle()
                                .frame(width: 45, height: 2)
                                .foregroundColor(iskeyboardShowing && otpText.count == index ? .black:.gray) // Change the color as desired
                                .padding(.top, 56) // Adjust the padding to position the underline
                        )
        }
        """
            ),
            DescriptionView(
                
                DImage: "",
                DTitle: "Using `onChange` for Input Validation",
                DDescription: "Attach the `onChange` modifier to the `otpText` binding to monitor changes in the OTP input. Inside the `onChange` closure, you can implement logic to filter invalid characters, enforce a maximum length, and trigger actions like `autoCompleteFunc` when the OTP is complete.",
                sampleView: nil,
                code: """
        .onChange(of: otpText) {oldValue, newValue in

            // MARK: making otp as num only
            let filtered = newValue.filter { "0123456789".contains($0) }
            if filtered != newValue {
                self.otpText = filtered
            }
            if newValue.count == numberOfDigit {
                autoCompleteFunc?()
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Adding a `Done` Button to the Keyboard",
                DDescription: "Use the `toolbar` modifier to add a custom `Done` button to the keyboard. This allows the user to dismiss the keyboard after entering the OTP.",
                sampleView: nil,
                code: """
        .toolbar {
            ToolbarItem(placement: .keyboard){
                Button("Done"){
                    iskeyboardShowing.toggle()
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using the `limit` Extension for Text Length",
                DDescription: "Create an extension for the `Binding` type (specifically for `String` values) to limit the length of the text field. This helps enforce the maximum number of digits in the OTP input.",
                sampleView: nil,
                code: """
        extension Binding where Value == String{
            func limit(_ length: Int)->Self{
                if self.wrappedValue.count > length{
                    DispatchQueue.main.async{
                        self.wrappedValue = String(self.wrappedValue.prefix(length))
                    }

                }
                return self
            }
        }
        """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using `OTPBoxView` in your SwiftUI View",
                DDescription: "To use the `OTPBoxView` in your SwiftUI view, create an instance of the `OTPBoxView` struct, passing a binding for the OTP text, the number of digits, and an optional closure for the autocompletion action.",
                sampleView: AnyView(
                    OTPBoxPreview()
                ),
                code: """
        struct ContentView: View {
            @State private var otp: String = ""

            var body: some View {
                VStack {
                    OTPBoxView(otpText: $otp, autoCompleteFunc: {
                        // Your autocompletion logic here (e.g., send OTP)
                        print("OTP entered: \\(otp)")
                    })
                }
            }
        }
        """
            )
        ]
    )










    
    
    
    
    
    
    
    
    
    
    
    
]
