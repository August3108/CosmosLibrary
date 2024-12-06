//
//  BiometricAuth.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 07/11/24.
//

import Foundation
import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    @State private var isPresented: Bool = false
    @State private var authenticated = false
    @State private var showPinField = false

    var body: some View {
        VStack {
            // Show authentication status
            if authenticated {
                Text("Authenticated!")
                    .font(.headline)
                    .foregroundColor(.green)
            } else {
                Text("Please Authenticate")
                    .font(.headline)
                    .foregroundColor(.red)
            }

            ZStack {
                VStack {
                    Spacer()

                    // Icon for Face ID authentication (dynamic island simulation)
                    if #available(iOS 16.0, *) {
                        Image(systemName: "faceid")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                            .background(Circle().fill(Color.white).shadow(radius: 5))
                            .offset(y: -20)
                            .onTapGesture {
                                authenticateUser()
                            }
                    } else {
                        // Fallback button for older versions
                        Button("Enter PIN") {
                            authenticateUser()
                        }
                    }
                    Spacer()
                }
            }
        }
    }

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
                            case LAError.userCancel:
                                print("User canceled the authentication.")
                            case LAError.userFallback:
                                print("User opted for fallback method.")
                                showPinField = true  // Show the PIN field
                            default:
                                print("Other error: \(error.localizedDescription)")
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

}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
