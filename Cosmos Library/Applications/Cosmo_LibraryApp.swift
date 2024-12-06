//
//  Cosmo_LibraryApp.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import SwiftUI
import AppIntents

@main
struct Cosmo_LibraryApp: App {
    private let sceneNavigationModel: NavigationModel
    
    
    init(){
        let navigationModel = NavigationModel(selectedComponent: customComponentModelArray)
        sceneNavigationModel = navigationModel
        
        AppDependencyManager.shared.add(dependency: navigationModel)
    }
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(sceneNavigationModel)
        }
    }
}
