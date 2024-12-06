//
//  AppIntentNavigationModel.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 11/11/24.
//

import Foundation

class AppIntentNavigationModel: ObservableObject{
    static let intentNavigationModel = AppIntentNavigationModel()
    @Published var shouldNavigate: Bool = false
    @Published var arrayToPass: [generalContentModel] = customComponentModelArray
    
    
    
}

