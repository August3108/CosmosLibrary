//
//  Compass.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 08/11/24.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine


struct CompassView : View {
    
    @ObservedObject var compassHeading = CompassHeading()
    @State private var trigger = false
    @State private var intensity : SensoryFeedback.Weight = .light

    
    let angels : [Double] = Array(stride(from: 0, to: 360, by: 10))
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    RhombusShape()
                    Circle()
                        .fill(.red)
                        .frame(width: 7)
                    Circle()
                        .fill(.black)
                        .frame(width: 1)
                }
            }.frame(width: 300, height: 300)
            ZStack{
                ForEach(angels, id: \.self){ angel in
                    CompassMarkerView(degree: angel, compassDegree: $compassHeading.degrees)
                }
            }.frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: compassHeading.degrees))
                .statusBar(hidden: true)
                .onChange(of: compassHeading.degrees) { newValue, oldValue in
                    if Int(newValue) % 90 == 0 {
                        sendSensoryFeedback(magnitude: .heavy)
                    }else if Int(newValue) % 30 == 0 {
                        
                        sendSensoryFeedback(magnitude: .light)
                    }
                }
                .sensoryFeedback(.impact(weight: intensity), trigger: trigger)
        }
    }
    
    func sendSensoryFeedback(magnitude : SensoryFeedback.Weight){
        intensity = magnitude
        trigger.toggle()
    }
}
struct CompassMarkerView: View {
    let degree: Double
    @Binding var compassDegree: Double
    
    var body: some View {
        VStack(){
            VStack{
                Text(getDirection())
                    .fontWeight(.bold)
                    .rotationEffect(textAngle())
            }.frame(height: 20)
            VStack{
                if degree.truncatingRemainder(dividingBy: 30) == 0 || degree == 0 {
                    Text("\(degree, specifier: "%.0f")")
                        .rotationEffect(textAngle())
                        .font(.system(size: 12))
                }else{
                    Text("")
                }
            }.frame(height: 40)
            
            VStack(){
                Capsule()
                    .frame(width: 3, height: 20)
                    .foregroundColor(capsuleColor())
                Spacer()
            }
            .frame(height: 220)
            
            
        }
        .rotationEffect(Angle(degrees: degree))
    }
    
    func getDirection() -> String {
        switch degree {
        case 0: return "N"
        case 90: return "E"
        case 180: return "S"
        case 270: return "W"
        default: return ""
        }
    }
    
    func capsuleWidth() -> CGFloat {
        return degree == 0 ? 7 : 3
    }

    func capsuleColor() -> Color {
        return degree == 0 ? .red : .gray
    }
    
    private func textAngle() -> Angle {
        return Angle(degrees: -compassDegree - degree)
    }
}


#Preview{
    CompassView()
}


class CompassHeading: NSObject, ObservableObject, CLLocationManagerDelegate {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var degrees: Double = .zero {
        didSet {
            objectWillChange.send()
        }
    }
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.setup()
    }
    
    private func setup() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.degrees = -1 * newHeading.magneticHeading
    }
}


struct RhombusShape: Shape {
    var width: CGFloat = 10
    var height: CGFloat = 50

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let centerX = rect.midX
        let centerY = rect.midY
        let halfWidth = width / 2
        let halfHeight = height / 2

        path.move(to: CGPoint(x: centerX - halfWidth, y: centerY))
        path.addLine(to: CGPoint(x: centerX, y: centerY - halfHeight))
        path.addLine(to: CGPoint(x: centerX + halfWidth, y: centerY))
        path.addLine(to: CGPoint(x: centerX, y: centerY + halfHeight))
        path.closeSubpath()

        return path
    }
}

