import SwiftUI

struct SlantedRectangle: Shape {
    var slantWidth: CGFloat // Width of the slanted side
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the points of the original slanted rectangle
        let topLeft = CGPoint(x: rect.minX, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX + slantWidth, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX , y: rect.maxY)
        
        // Create the slanted rectangle path
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.closeSubpath()
        
        return path
    }
}

struct MirroredSlantedRectangle: Shape {
    var slantWidth: CGFloat // Width of the slanted side
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the points of the mirrored slanted rectangle
        let topLeft = CGPoint(x: rect.minX + slantWidth, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX , y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        
        // Create the mirrored slanted rectangle path
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.closeSubpath()
        
        return path
    }
}

struct SlantedTwinButton: View {
    @State private var slant: CGFloat = 20
    @State private var Button1Text: String = "Buy"
    @State private var Button2Text: String = "Sell"
    var Button1color: Color = .blue
    var Button2color: Color = Color.red
    var ButtonHeight:CGFloat = 120
    var ButtonWidth:CGFloat = 200
    
    let button1Action: () -> Void
    let button2Action: () -> Void
    
    init(button1Action: @escaping () -> Void, button2Action: @escaping () -> Void) {
        self.button1Action = button1Action
        self.button2Action = button2Action
    }
    
    var body: some View {
        HStack(spacing: 1) {
            Button(action: {
                self.button1Action()
            }) {
                SlantedRectangle(slantWidth: slant)
                    .fill(Button1color)
                    .frame(width: ButtonWidth/2 - 10, height: ButtonHeight/2)
                    .overlay(
                        Text(Button1Text)
                            .bold()
                            .foregroundColor(.white)
                    )
            }
            
            Button(action: {
                self.button2Action()
            }) {
                MirroredSlantedRectangle(slantWidth: slant)
                    .fill(Button2color)
                    .frame(width: ButtonWidth/2 + 10, height: ButtonHeight/2)
                    .overlay(
                        Text(Button2Text)
                            .bold()
                            .foregroundColor(.white)
                    )
            }
        }
    }
}

struct SlantedTwinButtonSample: View {
    func buyAction() {
            print("Buy button tapped")
        }

        func sellAction() {
            print("Sell button tapped")
        }

        var body: some View {
            VStack{
                SlantedTwinButton(button1Action: buyAction, button2Action: sellAction)
                    .cornerRadius(50)
            }
        }
}



#Preview{
    SlantedTwinButtonSample()
}
