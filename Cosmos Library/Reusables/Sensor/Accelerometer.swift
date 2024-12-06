//
//  Accelerometer.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 08/11/24.
//

import SwiftUI
import CoreMotion


struct AccelerometerView: View {
    @State private var accelerationX: Double = 0.0
    @State private var accelerationY: Double = 0.0
    @State private var accelerationZ: Double = 0.0

    let motionManager = CMMotionManager()

    var body: some View {
        VStack {
            Text("Acceleration (X, Y, Z):")
            Text("(\(accelerationX), \(accelerationY), \(accelerationZ))")
                .padding()

            Button("Start Accelerometer") {
                startAccelerometerUpdates()
            }
            .disabled(motionManager.isAccelerometerActive)
        }
    }

    func startAccelerometerUpdates() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1 // Update frequency
            motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                if let data = data {
                    self.accelerationX = data.acceleration.x
                    self.accelerationY = data.acceleration.y
                    self.accelerationZ = data.acceleration.z
                }
            }
        }
    }

    func stopAccelerometerUpdates() {
        motionManager.stopAccelerometerUpdates()
    }
}
