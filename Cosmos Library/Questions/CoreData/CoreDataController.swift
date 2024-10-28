////
////  CoreDataController.swift
////  Cosmos Library
////
////  Created by Rahul Jha on 10/09/24.
////
//
//import Foundation
//import CoreData
//
//
//class DataController: ObservableObject {
//    let container = NSPersistentContainer(name: "Data1")
//    
//    init(){
//        container.loadPersistentStores{ description, error in
//            if let error = error {
//                print("Error to load data: \(error.localizedDescription)")
//            }
//        }
//    }
//}
