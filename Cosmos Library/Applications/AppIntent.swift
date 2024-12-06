//
//  AppIntent.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 09/11/24.

// App intents is foundation to push core features outside the app so that siri and spotlight can access them
// app intent handles the communication between siri and app

// shortcut action
// All intents appear by default as actions in the shortcuts app

import Foundation
import Observation
import AppIntents
import WidgetKit

struct OpenCustomComponet: AppIntent {
    static let title: LocalizedStringResource = "Open SwiftUI Custom Components"
    static let description = IntentDescription("Opens the app and goes to Custom Components trails.")
    static let openAppWhenRun: Bool = true
    @MainActor
    func perform() async throws -> some IntentResult {
        navigationModel.navigateaToComponent(component: customComponentModelArray, title: "Custom Component")
        navigationModel.navigateToComponent = true
        return .result()
    }
    @Dependency
    private var navigationModel: NavigationModel
}
struct OpenSwiftuiInterviewQuestionComponet: AppIntent {
    static let title: LocalizedStringResource = "Open SwiftUI Interview Question"
    static let description = IntentDescription("Opens the app and goes to Interview Question.")
    static let openAppWhenRun: Bool = true
    @MainActor
    func perform() async throws -> some IntentResult {
        navigationModel.navigateaToComponent(component: interviewQuestionDataArray, title: "SwiftUI Interview Question")
        navigationModel.navigateToComponent = true
        return .result()
    }
    @Dependency
    private var navigationModel: NavigationModel
}
struct OpenUIkitInterviewQuestionComponet: AppIntent {
    static let title: LocalizedStringResource = "Open UIKit Interview Question"
    static let description = IntentDescription("Opens the app and goes to Interview Question.")
    static let openAppWhenRun: Bool = true
    @MainActor
    func perform() async throws -> some IntentResult {
        navigationModel.navigateaToComponent(component: UIKITQuestionArray, title: "UIKit Interview Question")
        navigationModel.navigateToComponent = true
        return .result()
    }
    @Dependency
    private var navigationModel: NavigationModel
}

@MainActor
@Observable class NavigationModel {
    var navigateToComponent : Bool = false
    var componentTitle : String?
    var selectedComponent: [generalContentModel]?
    
    init(selectedComponent: [generalContentModel]? = nil, componentTitle: String? = "Components") {
        self.selectedComponent = selectedComponent
    }
    func navigateaToComponent(component: [generalContentModel], title: String){
        componentTitle = title
        selectedComponent = component
        navigateToComponent = true
    }

}









// this is how to make a shortcut which can be added


/// parameterised intent
/// It takes in parameter
/// We must define OpenIntent so that it can take in the parameter
/// it also means that it will open app when commanded

//struct openCustomComponentWithParameter : AppIntent, OpenIntent {
//    static let title: LocalizedStringResource = "Open Cosmos Custom Component"
//    
//    @Parameter(title: "Compass")
//    var target: customEntity
//    
//    func perform() async throws -> some IntentResult {
//        print("hello world")
//        return .result()
//    }
//}

