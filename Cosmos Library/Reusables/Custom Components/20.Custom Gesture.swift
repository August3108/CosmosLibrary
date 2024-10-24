// Gesture which is taken when swipes from corner of screen can be used to dismiss view
import Foundation
import SwiftUI

struct gestureback: View {
    @State private var offset: CGFloat = 0
    @State private var isDraggingFromEdge = false
    
    var body: some View {
        VStack{
            Text("Hello, World!")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let startThreshold: CGFloat = 30 // Adjust as needed
                        if value.startLocation.x < startThreshold || value.startLocation.x > UIScreen.main.bounds.width - startThreshold {
                            isDraggingFromEdge = true
                            if isDraggingFromEdge {
                                offset = value.translation.width
                            }
                        }
                    }
                    .onEnded { value in
                        withAnimation {
                            if isDraggingFromEdge {
                                if value.predictedEndTranslation.width > 100 {
                                    print("Jello")
                                    offset = UIScreen.main.bounds.width
                                } else if value.predictedEndTranslation.width < -100 {
                                    print("Hello")
                                    offset = -UIScreen.main.bounds.width
                                } else {
                                    print("bashd")
                                    offset = 0
                                }
                            }
                            isDraggingFromEdge = false
                        }
                    }
            )
    }
}
