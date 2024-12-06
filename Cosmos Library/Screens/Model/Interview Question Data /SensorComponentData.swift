//
//  SensorComponentData.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 08/11/24.
//

import Foundation
import SwiftUI

let sensorComponentData = [
    
    generalContentModel(
        id: 1,
        mainImage: "",
        mainTitle: "Implementing Secure Authentication with Face ID/Touch ID and PIN",
        mainDescription: "This tutorial demonstrates how to build a secure authentication system in your iOS app, offering users the choice between Face ID/Touch ID (biometric) and PIN authentication.",
        keywords: ["authentication", "Face ID", "Touch ID", "PIN", "LocalAuthentication", "security", "iOS", "SwiftUI"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Using the `LocalAuthentication` Framework",
                DDescription: "The `LocalAuthentication` framework provided by Apple provides a convenient way to implement secure authentication using device passcodes, Face ID, and Touch ID. It handles the underlying security mechanisms, making your code simpler and more secure.",
                sampleView: nil,
                code: """
                import LocalAuthentication

                let context = LAContext()
                var error: NSError?

                if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                    // ... (authentication logic)
                } else {
                    // Device does not support device passcode authentication
                }
                """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Face ID/Touch ID Authentication",
                DDescription: "The `evaluatePolicy()` method of `LAContext` is used to trigger the authentication process. You can use the `deviceOwnerAuthentication` policy to check if the user is the owner of the device and authorize access.",
                sampleView: nil,
                code: """
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Please authenticate with your device passcode") { success, error in
                    DispatchQueue.main.async {
                        if success {
                            // Authentication successful
                        } else {
                            // Authentication failed
                            // ... (handle error)
                        }
                    }
                }
                """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. PIN Authentication Fallback",
                DDescription: "If the device does not support Face ID/Touch ID or the user opts for the PIN fallback method, you need to provide a way to enter their PIN. You can use a `TextField` with `keyboardType` set to `.numberPad` for this purpose.",
                sampleView: nil,
                code: """
                // Example:
                TextField("Enter PIN", text: /* Bind to your PIN state */)
                    .keyboardType(.numberPad)
                """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Handling Authentication Errors",
                DDescription: "The `evaluatePolicy()` method returns an error if authentication fails. You should handle these errors appropriately, providing feedback to the user and potentially allowing them to retry or choose a different authentication method.",
                sampleView: AnyView (
                    VStack {
                        AuthenticationView()
                            .frame(height: 300)
                    }
                ),
                code: """
                private func authenticateUser() {
                    let context = LAContext()
                    var error: NSError?

                    // If device supports device passcode authentication (Face ID or PIN)
                    if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Please authenticate with your device passcode") { success, error in
                            DispatchQueue.main.async {
                                if success {
                                    // Authentication successful using Face ID, Touch ID, or device passcode
                                    authenticated = true
                                    print("Authentication successful")
                                } else {
                                    // Authentication failed
                                    authenticated = false
                                    if let error = error {
                                        switch error {
                                        case LAError.authenticationFailed:
                                            print("Authentication failed.")
                                            // Show an alert or message to the user that authentication failed
                                        case LAError.userCancel:
                                            print("User canceled the authentication.")
                                            // You might want to show a message that the user canceled
                                        case LAError.userFallback:
                                            print("User opted for fallback method.")
                                            // Show PIN field by setting showPinField = true
                                            showPinField = true
                                        default:
                                            print("Other error: \\(error.localizedDescription)")
                                            // Handle other errors as needed 
                                        }
                                    }
                                    print("Authentication failed")
                                }
                            }
                        }
                    } else {
                        // Device doesn't support passcode authentication or Face ID/Touch ID
                        print("Device does not support device passcode authentication")
                        showPinField = true // Show the PIN field if biometric authentication is not available
                    }
                }
                """
            )
        ]
    )

    
    ,
    
    generalContentModel(
        id: 2,
        mainImage: "",
        mainTitle: "Building a Compass with Sensory Feedback in SwiftUI",
        mainDescription: "This tutorial guides you through creating a functional compass in SwiftUI that provides haptic feedback based on compass readings, enhancing the user experience.",
        keywords: ["compass", "SwiftUI", "CoreLocation", "haptic feedback", "sensory feedback", "Combine", "UI design", "iOS"],
        technology: "SwiftUI",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. CoreLocation for Compass Data",
                DDescription: "The `CoreLocation` framework provides access to device location and heading data. We'll use the `CLLocationManager` to obtain heading updates for our compass.",
                sampleView: nil,
                code: """
                import CoreLocation

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
                """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Creating the Compass UI with SwiftUI",
                DDescription: "We'll build the compass UI using SwiftUI. The main view will consist of a rhombus shape representing the compass card and markers for directions.",
                sampleView: nil,
                code: """
                struct CompassView: View {
                    @ObservedObject var compassHeading = CompassHeading()
                    @State private var trigger = false
                    @State private var intensity: SensoryFeedback.Weight = .light

                    let angles: [Double] = Array(stride(from: 0, to: 360, by: 10))

                    var body: some View {
                        ZStack {
                            // Compass Card
                            VStack {
                                ZStack {
                                    RhombusShape()
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 7)
                                    Circle()
                                        .fill(.black)
                                        .frame(width: 1)
                                }
                            }
                            .frame(width: 300, height: 300)

                            // Compass Markers
                            ZStack {
                                ForEach(angles, id: \\.self) { angle in
                                    CompassMarkerView(degree: angle, compassDegree: $compassHeading.degrees)
                                }
                            }
                            .frame(width: 300, height: 300)
                            .rotationEffect(Angle(degrees: compassHeading.degrees))
                            .statusBar(hidden: true)
                            .onChange(of: compassHeading.degrees) { newValue, oldValue in
                                if Int(newValue) % 90 == 0 {
                                    sendSensoryFeedback(magnitude: .heavy)
                                } else if Int(newValue) % 30 == 0 {
                                    sendSensoryFeedback(magnitude: .light)
                                }
                            }
                            // Haptic Feedback
                            .sensoryFeedback(.impact(weight: intensity), trigger: trigger)
                        }
                    }

                    func sendSensoryFeedback(magnitude: SensoryFeedback.Weight) {
                        intensity = magnitude
                        trigger.toggle()
                    }
                }
                """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Implementing Compass Markers",
                DDescription: "We'll create custom `CompassMarkerView` instances to represent the direction markers on the compass. These markers will rotate based on the heading.",
                sampleView: nil,
                code: """
                struct CompassMarkerView: View {
                    let degree: Double
                    @Binding var compassDegree: Double

                    var body: some View {
                        VStack {
                            // Direction Text
                            VStack {
                                Text(getDirection())
                                    .fontWeight(.bold)
                                    .rotationEffect(textAngle())
                            }
                            .frame(height: 20)

                            // Degree Text
                            VStack {
                                if degree.truncatingRemainder(dividingBy: 30) == 0 || degree == 0 {
                                    Text("\\(degree, specifier: "%.0f")")
                                        .rotationEffect(textAngle())
                                        .font(.system(size: 12))
                                } else {
                                    Text("")
                                }
                            }
                            .frame(height: 40)

                            // Capsule Marker
                            VStack {
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
                """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Adding Sensory Feedback with `UIImpactFeedbackGenerator`",
                DDescription: "To enhance the user experience, we'll use the `UIImpactFeedbackGenerator` to provide haptic feedback when the compass heading changes to specific angles.",
                sampleView: nil,
                code: """
                struct CompassView: View {
                    @ObservedObject var compassHeading = CompassHeading()
                    @State private var trigger = false
                    @State private var intensity: SensoryFeedback.Weight = .light

                    let angles: [Double] = Array(stride(from: 0, to: 360, by: 10))

                    var body: some View {
                        ZStack {
                            // Compass Card
                            VStack {
                                ZStack {
                                    RhombusShape()
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 7)
                                    Circle()
                                        .fill(.black)
                                        .frame(width: 1)
                                }
                            }
                            .frame(width: 300, height: 300)

                            // Compass Markers
                            ZStack {
                                ForEach(angles, id: \\.self) { angle in
                                    CompassMarkerView(degree: angle, compassDegree: $compassHeading.degrees)
                                }
                            }
                            .frame(width: 300, height: 300)
                            .rotationEffect(Angle(degrees: compassHeading.degrees))
                            .statusBar(hidden: true)
                            .onChange(of: compassHeading.degrees) { newValue, oldValue in
                                if Int(newValue) % 90 == 0 {
                                    sendSensoryFeedback(magnitude: .heavy)
                                } else if Int(newValue) % 30 == 0 {
                                    sendSensoryFeedback(magnitude: .light)
                                }
                            }
                            // Haptic Feedback
                            .sensoryFeedback(.impact(weight: intensity), trigger: trigger)
                        }
                    }

                    func sendSensoryFeedback(magnitude: SensoryFeedback.Weight) {
                        intensity = magnitude
                        trigger.toggle()
                    }
                }
                """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Complete Compass with Sensory Feedback",
                DDescription: "Putting it all together, we have a functional compass that updates with device heading and provides haptic feedback for specific compass angles.",
                sampleView: AnyView (
                    CompassView()
                ),
                code: """
                struct CompassView: View {
                    @ObservedObject var compassHeading = CompassHeading()
                    @State private var trigger = false
                    @State private var intensity: SensoryFeedback.Weight = .light

                    let angles: [Double] = Array(stride(from: 0, to: 360, by: 10))

                    var body: some View {
                        ZStack {
                            // Compass Card
                            VStack {
                                ZStack {
                                    RhombusShape()
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 7)
                                    Circle()
                                        .fill(.black)
                                        .frame(width: 1)
                                }
                            }
                            .frame(width: 300, height: 300)

                            // Compass Markers
                            ZStack {
                                ForEach(angles, id: \\.self) { angle in
                                    CompassMarkerView(degree: angle, compassDegree: $compassHeading.degrees)
                                }
                            }
                            .frame(width: 300, height: 300)
                            .rotationEffect(Angle(degrees: compassHeading.degrees))
                            .statusBar(hidden: true)
                            .onChange(of: compassHeading.degrees) { newValue, oldValue in
                                if Int(newValue) % 90 == 0 {
                                    sendSensoryFeedback(magnitude: .heavy)
                                } else if Int(newValue) % 30 == 0 {
                                    sendSensoryFeedback(magnitude: .light)
                                }
                            }
                            // Haptic Feedback
                            .sensoryFeedback(.impact(weight: intensity), trigger: trigger)
                        }
                    }

                    func sendSensoryFeedback(magnitude: SensoryFeedback.Weight) {
                        intensity = magnitude
                        trigger.toggle()
                    }
                }
                """
            )
        ]
    )



]
