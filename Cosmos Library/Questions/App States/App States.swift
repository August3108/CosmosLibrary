//
//  App States.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 10/09/24.
//

import Foundation
import SwiftUI

/// App States in iOS
/// Not Running: The app is not running at all. It can be in this state if it hasn't been launched yet or if it was terminated by the user or system.

/// Inactive: The app is running in the foreground but is not receiving events. This state usually occurs when the app is transitioning between active and background states or when an alert or system modal is shown.

/// Active: The app is running in the foreground and receiving events. This is the state when the app is in use and interacting with the user.

/// Background: The app is running in the background and not visible to the user. It may still be executing code, such as completing a task or handling a background fetch.

/// Suspended: The app is in the background and not executing any code. It remains in memory but is not running. The system may terminate it if it needs to reclaim memory.
import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var isActive: Bool = true
    @Published var isBackground: Bool = false
    @Published var isInactive: Bool = false

    private var notificationCenter: NotificationCenter
    private var cancellables: Set<AnyCancellable> = []

    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter

        notificationCenter.publisher(for: UIApplication.didBecomeActiveNotification)
            .sink { [weak self] _ in
                self?.isActive = true
                self?.isInactive = false
                self?.isBackground = false
                self?.handleAppDidBecomeActive()
            }
            .store(in: &cancellables)

        notificationCenter.publisher(for: UIApplication.didEnterBackgroundNotification)
            .sink { [weak self] _ in
                self?.isActive = false
                self?.isBackground = true
                self?.handleAppDidEnterBackground()
            }
            .store(in: &cancellables)

        notificationCenter.publisher(for: UIApplication.willResignActiveNotification)
            .sink { [weak self] _ in
                self?.isActive = false
                self?.isInactive = true
                self?.handleAppWillResignActive()
            }
            .store(in: &cancellables)
    }

    private func handleAppDidBecomeActive() {
        print("App became active")
        // Perform actions when app becomes active
    }

    private func handleAppDidEnterBackground() {
        print("App entered background")
        // Perform actions when app enters background
    }

    private func handleAppWillResignActive() {
        print("App will resign active")
        // Perform actions when app will resign active
    }
}
