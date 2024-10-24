//
//  AppConstant.swift
//  Cosmo Library
//
//  Created by Rahul jha on 09/06/24.
//

import Foundation
import SwiftUI

struct AppConstants {
    static let AppScreenWidth = UIScreen.main.bounds.width
    static let AppScreenHeight = UIScreen.main.bounds.height
    static let IndianRupee = "₹"

    static let topSafeAreaHeight: CGFloat = {
        if let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first {
            return windowScene.windows.first?.safeAreaInsets.top ?? 0
        }
        return 0
    }()

    static let bottomSafeAreaHeight: CGFloat = {
        if let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first {
            return windowScene.windows.first?.safeAreaInsets.bottom ?? 0
        }
        return 0
    }()
}
