//
//  CameraPhoto.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 06/11/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct clickPhoto : View {
    var body: some View {
        Text("Hello, World!")
    }
}



private var isAuthorizedForCamera: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            // Determine if the user previously authorized camera access.
            var isAuthorized = status == .authorized
            
            // If the system hasn't determined the user's authorization status,
            // explicitly prompt them for approval.
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
