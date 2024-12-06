//
//  MultiThreading.swift
//  Cosmos Library
//
//  Created by Rahul jha on 25/11/24.
//

import Foundation


import SwiftUI

struct GCDMultiThreading: View {
    @State private var data: String = "Loading..."

    var body: some View {
        VStack {
            Text(data)
                .padding()
            Button("Fetch Data") {
                fetchDataInBackground()
            }
        }
    }

    func fetchDataInBackground() {
        // Dispatch a task to a background queue
        DispatchQueue.global(qos: .background).async {
            // Simulate network or heavy task
            sleep(2) // Replace with your background task
            
            let fetchedData = "Data fetched successfully"
            
            // Update the UI on the main thread
            DispatchQueue.main.async {
                data = fetchedData
            }
        }
    }
}


//so async does task in parallel and if i need async result then i put await
import SwiftUI

struct asyncAwaitMultiThreading: View {
    @State private var data: String = "Loading..."

    var body: some View {
        VStack {
            Text(data)
                .padding()
            Button("Fetch Data") {
                Task {
                    await fetchData()
                }
            }
        }
    }

    // Using async/await to fetch data asynchronously
    func fetchData() async {
        // Simulate background work
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2 seconds delay
        
        // Update the UI on the main thread
        data = "Data fetched successfully"
    }
}

import SwiftUI

struct operationQueueMultiThreading: View {
    @State private var data: String = "Loading..."

    var body: some View {
        VStack {
            Text(data)
                .padding()
            Button("Fetch Data") {
                fetchDataWithOperationQueue()
            }
        }
    }

    func fetchDataWithOperationQueue() {
        let operationQueue = OperationQueue()
        
        // Create a background operation
        operationQueue.addOperation {
            // Simulate heavy background task
            sleep(2)
            
            let fetchedData = "Data fetched successfully"
            
            // Once the task is done, update the UI on the main thread
            OperationQueue.main.addOperation {
                data = fetchedData
            }
        }
    }
}
