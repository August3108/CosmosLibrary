//
//  CountDownTimer.swift
//  Cosmo Library
//
//  Created by Rahul jha on 09/06/24.
//

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
