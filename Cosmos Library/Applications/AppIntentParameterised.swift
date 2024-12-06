//
//  APPINTENTWWDC24.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 11/11/24.
//

//import AppIntents
//import Foundation
//import SwiftUI
//import OSLog
//
//
//struct TrailEntityQuery: EntityQuery {
//    
//    @Dependency
//    var trailManager: TrailDataManager
//
//    func entities(for identifiers: [TrailEntity]) async throws -> [generalContentModel] {
//        return trailManager.trails(with: identifiers)
//                .map { TrailEntity(trail: $0) }
//    }
//    func suggestedEntities() async throws -> [[generalContentModel]] {
//        Logger.entityQueryLogging.debug("[TrailEntityQuery] Request for suggested entities")
//        
//        return trailManager.trails(with: allComponentArray)
//                .map { TrailEntity(trail: $0) }
//    }
//}
//
//extension TrailEntityQuery: EntityStringQuery {
//    func entities(matching string: String) async throws -> [[generalContentModel]] {
//        return trailManager.trails { trail in
//            trail.name.localizedCaseInsensitiveContains(string)
//        }.map { TrailEntity(trail: $0) }
//    }
//}
//
//@Observable class TrailDataManager: @unchecked Sendable {
//    
//    static let shared = TrailDataManager()
//    let trails: [generalContentModel]?
//    
//    private init(trails: [generalContentModel]? = nil) {
//        self.trails = trails
//    }
//}
