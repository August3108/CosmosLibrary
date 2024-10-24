//
//  GeneralDataComponent.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import Foundation
import SwiftUI

struct generalContentModel {
    let id : Int // to loop
    let mainImage : String // to show in list
    let mainTitle : String // to show in list
    let mainDescription : String // 2-3 lines description for list
    let keywords : [String]// keyword to assist in search
    let technology : String

    // there will be 2 tabs, description and view
    let viewComponentDescription : [DescriptionView]?// to show how component works in view tab
    
}

struct DescriptionView {
    let id : Int
    let DImage : String?
    let DTitle : String
    let DDescription : String
    let sampleView : AnyView?
    let code : String? // to show code to user
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case DImage
        case DTitle
        case DDescription
    }
}