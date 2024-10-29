//
//  Modifiers.swift
//  Cosmo Library
//
//  Created by Rahul jha on 06/06/24.
//

import Foundation
import SwiftUI

struct paddedOverlay: ViewModifier {
    var strokeColor : Color = Color.primarycolor
    var paddingAmount : CGFloat = 15
    var cornerRadius : CGFloat = 10
    func body(content: Content) -> some View {
        content
            .padding(paddingAmount)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor, lineWidth: 1)
            )
            .padding(0.5)
    }
}
struct buttonView: ViewModifier {
    @State var color : Color = Color.primarycolor
    @State var height : CGFloat = 30
    @State var buttonTextSize : CGFloat = 12
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .font(.system(size: buttonTextSize))
//            .padding()
            .background(color)
            .cornerRadius(10)
    }
}

struct cardView: ViewModifier {
    @State var padding : CGFloat = 10
    @State var cornerRadius : CGFloat = 10
    @State var bgColor : Color = Color.cardBackground
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(padding)
            .background(bgColor)
            .cornerRadius(cornerRadius)
    }
}

struct paddedOverlayDashed: ViewModifier {
    var strokeColor : Color = .black
    var paddingAmount : CGFloat = 15
    var lineWidth : CGFloat = 2
    var dash : CGFloat = 5
    var cornerRadius : CGFloat = 5
    func body(content: Content) -> some View {
        content
            .padding(paddingAmount)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: [dash]))
                    .foregroundColor(strokeColor)
            )
    }
}

struct DashedDivider: View {
    var strokeColor : Color = .black
    var body: some View {
        Rectangle()
            .frame(height: 1) // Adjust the height of the divider
            .foregroundColor(.clear)
            .background(
                GeometryReader { geometry in
                    Path { path in
                        path.addLines([
                            CGPoint(x: 0, y: 0),
                            CGPoint(x: geometry.size.width, y: 0)
                        ])
                    }
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundColor(strokeColor) // Adjust the color of the dashed line
                }
            )
    }
}


struct DescriptionBox: View {
    @Binding var binding : String
    @State var isEditing = false
    @FocusState private var isFocused : Bool?
    @State var height : CGFloat = 125
    @State var hint: String = "Description..."
    
    var body: some View {
        ZStack(alignment: .top) {
            TextEditor(text: $binding)
                .frame(height: height)
                .multilineTextAlignment(.leading)
                .modifier(paddedOverlay())
                .focused($isFocused, equals: true)
                .onChange(of: binding) {_,_ in
                    // Update isEditing based on text changes
                    isEditing = !binding.isEmpty
                }
            if !isEditing , !(isFocused ?? false){
                VStack {
                    if binding.isEmpty{
                        HStack {
                            Text(isEditing ? "" : hint)
                                .foregroundColor(.gray)
                                .padding()
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct KeyboardAdaptive: ViewModifier {
    let offset: CGFloat // Specify how much up you want to push the keyboard
    let onDone: () -> Void // Closure to be called when "Done" button is tapped
    @State private var isKeyboardVisible = false

    init(offset: CGFloat = 0, onDone: @escaping () -> Void) {
        self.offset = offset
        self.onDone = onDone
    }

    func body(content: Content) -> some View {
        content
            .padding(.bottom, isKeyboardVisible ? offset : 0)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    print("visible")
                    isKeyboardVisible = true
                }

                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    print("hidden")
                    isKeyboardVisible = false
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        onDone()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
    }
}

struct DragGestureModifier: ViewModifier {
    @Binding var selectedTab : Int
    let upperLimit: Int
    let lowerLimit: Int
    var onValueChange: ((Int) -> Void)?
    @GestureState var translation: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .updating($translation) { value, state, _ in
                        state = value.translation.width
                    }
                    .onEnded { value in
                        if value.translation.width > 50 {
                            withAnimation(.spring()) {
                                if selectedTab == lowerLimit {} else {
                                    selectedTab = selectedTab - 1
                                }
                            }
                        } else if value.translation.width < -50 {
                            withAnimation(.spring()) {
                                if selectedTab == upperLimit {} else {
                                    selectedTab = selectedTab + 1
                                }
                            }
                        }
                        onValueChange?(selectedTab)
                    }
            )
    }
}

struct ViewTapGesture : ViewModifier {
    @State var scale : CGFloat = 1.0
    @State var lowerScale : CGFloat = 0.85
    @State var performActionWithDelay : Bool = true
    var action: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .onTapGesture {
                if !performActionWithDelay{
                    action?()
                }
                withAnimation(.interactiveSpring()) {
                    scale = lowerScale
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    if performActionWithDelay{
                        action?()
                    }
                    withAnimation(.interactiveSpring()) {
                        scale = 1.0
                    }
                }
            }
        
    }
}

struct buttonShrinkModifier : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            
    }
}
