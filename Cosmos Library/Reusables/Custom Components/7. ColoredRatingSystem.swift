// It creates a blend for rating color

import Foundation
import SwiftUI

struct ColorRatingView: View {
    let rating: Double // Use Double for a fractional rating
    
    var body: some View {
        if rating > 0.9{
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

struct RatingSystemSample: View {
    var body: some View {
        VStack {
            ScrollView{
                Text("Rating:")
                ColorRatingView(rating: 4.9)
                ColorRatingView(rating: 4.8)
                ColorRatingView(rating: 4.7)
                ColorRatingView(rating: 4.6)
                ColorRatingView(rating: 4.5)
                ColorRatingView(rating: 4.4)
                ColorRatingView(rating: 4.3)
                ColorRatingView(rating: 4.3)
                ColorRatingView(rating: 4.1)
                ColorRatingView(rating: 4.0)
                ColorRatingView(rating: 3.8)
                ColorRatingView(rating: 3.7)
                ColorRatingView(rating: 3.6)
                ColorRatingView(rating: 3.5)
                ColorRatingView(rating: 3.4)
                ColorRatingView(rating: 3.3)
                ColorRatingView(rating: 3.3)
                ColorRatingView(rating: 3.1)
                ColorRatingView(rating: 2.9)
                ColorRatingView(rating: 2.8)
                ColorRatingView(rating: 2.7)
                ColorRatingView(rating: 2.6)
                ColorRatingView(rating: 2.5)
                ColorRatingView(rating: 2.4)
                ColorRatingView(rating: 2.3)
                ColorRatingView(rating: 2.3)
                ColorRatingView(rating: 2.0)
                ColorRatingView(rating: 1.9)
                ColorRatingView(rating: 1.8)
                ColorRatingView(rating: 1.7)
                ColorRatingView(rating: 1.6)
                ColorRatingView(rating: 1.5)
                ColorRatingView(rating: 1.4)
                ColorRatingView(rating: 1.3)
                ColorRatingView(rating: 1.3)
                ColorRatingView(rating: 1.1)
                ColorRatingView(rating: 2.7)
                ColorRatingView(rating: 0.9)
            }
        }
    }
}

#Preview{
        RatingSystemSample()
    }

