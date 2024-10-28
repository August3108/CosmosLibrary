////
////  CoreData.swift
////  Cosmos Library
////
////  Created by Rahul Jha on 10/09/24.
////
//
//import Foundation
//import SwiftUI
//
//struct CoreDataView: View {
//    
//    // Initialize the DataController, which sets up the Core Data stack
//    // and loads the persistent container. This is kept alive as long as the view exists.
//    @StateObject private var dataController = DataController()
//
//    // Example of how you would pass the DataController into the environment
//    // so all views can access the managed object context.
//    // This typically goes into the main app file (where the app launches).
//    // WindowGroup {
//    //     ContentView()
//    //         .environment(\.managedObjectContext, dataController.container.viewContext)
//    // }
//    
//    /// Fetch request to retrieve all `Data1` objects from Core Data.
//    /// `sortDescriptors: []` means no sorting is applied to the fetched results.
//    @FetchRequest(sortDescriptors: []) var data1: FetchedResults<Data1>
//    
//    /// Access the `managedObjectContext` from the environment.
//    /// This is needed to create, update, and save objects in Core Data.
//    @Environment(\.managedObjectContext) var moc
//
//    var body: some View {
//        ZStack {
//            VStack {
//                // Display the fetched `Data1` objects in a List.
//                List(data1) { element in
//                    // Show the name of each element, with a default value if nil.
//                    Text("\(element.name ?? "Must provide optional")")
//                }
//                
//                // Button to add a new random `Data1` object to Core Data.
//                Button("Add") {
//                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
//
//                    // Randomly select first and last names.
//                    let chosenFirstName = firstNames.randomElement()!
//                    let chosenLastName = lastNames.randomElement()!
//
//                    // Create a new `Data1` object in the managed object context.
//                    let data = Data1(context: moc)
//                    data.id = UUID()  // Assign a unique ID.
//                    data.name = "\(chosenFirstName) \(chosenLastName)"  // Set the name.
//
//                    // Save the context, which writes the new object to persistent storage.
//                    try? moc.save()
//                }
//            }
//        }
//        // Ensure the view uses the correct managed object context by injecting it into the environment.
//        .environment(\.managedObjectContext, dataController.container.viewContext)
//    }
//}
//
//#Preview {
//    CoreDataView()
//}
//
/////  Core Data Overview
/////  Core Data is Apple's framework for managing and persisting data in iOS and macOS applications. It allows you to model data as objects and store them efficiently, with capabilities that go beyond simpler storage options like UserDefaults or Codable. Core Data supports advanced features such as sorting, filtering, lazy loading, undo/redo functionality, and more, making it suitable for applications handling large and complex data sets.
//
/////  Managed Object Context
/////  In Core Data, all data manipulation happens through the managed object context (NSManagedObjectContext). This context acts as a workspace for creating, reading, and updating data objects. When changes are made in the context, they remain in memory until explicitly saved to the persistent store. Core Data uses a persistent store coordinator, which handles the actual storage of data on the device.
//
/////  Core Data Model
/////  The Core Data model (.xcdatamodeld file) defines entities, attributes, and relationships for your data. An entity is analogous to a class in Swift, representing a type of object (e.g., Student, Book, Data1), while attributes are properties of these objects (e.g., id, name).
//
/////  Fetch Requests
/////  To retrieve data from Core Data, fetch requests (NSFetchRequest) are used. SwiftUI provides a special property wrapper, @FetchRequest, which allows you to declaratively specify how data should be fetched, including sorting and filtering. The results are automatically updated in the UI when the underlying data changes, making it an ideal fit for SwiftUI's reactive design.
//
/////  @StateObject and @Environment
/////  @StateObject: This property wrapper is used to initialize and maintain an instance of a class (e.g., DataController) across view reloads in SwiftUI. By using @StateObject, you ensure that the data controller is alive for the lifetime of the view and doesn’t get reinitialized unnecessarily.
/////  @Environment: This wrapper allows views to access shared data from the SwiftUI environment, including the managed object context. By injecting the managedObjectContext into the environment, every child view can use the context to access or manipulate Core Data objects.
/////  Adding and Saving Data
/////  New objects can be added to Core Data by creating an instance of the entity’s corresponding class (e.g., Data1). This object must be initialized with a managed object context, where its attributes are set. Once the object is created and populated, you save the context to persist the changes. Saving is a critical step that ensures data is written to the persistent store.
//
/////  Persistence and Data Handling
/////  One of the biggest advantages of Core Data is the persistence of data. Data stored via Core Data remains available even after the app is closed and relaunched. Core Data handles the underlying database operations, making it a robust choice for apps needing to manage structured data over time.
//
/////  Core Data in SwiftUI
/////  SwiftUI's declarative syntax simplifies Core Data integration. With the @FetchRequest and @Environment wrappers, you can easily fetch, display, and manage Core Data objects in a SwiftUI view. Changes to data are automatically reflected in the UI, and Core Data’s managed object context ensures that all data manipulations are centralized and easy to control.
//
/////  Comparison of Core Data with Other Local Storage Options
/////  In iOS development, there are several options for persisting data locally, each with its own use cases and limitations. Core Data stands out from simpler storage solutions like UserDefaults, Codable, and file-based storage due to its power and flexibility. Below is a comparison of Core Data with other popular storage options.
//
/////  Core Data vs. UserDefaults
/////  UserDefaults: Best for storing small amounts of simple data, such as user preferences and settings.
/////  Use Case: Ideal for simple key-value pairs like user settings, flags, or preferences.
/////  Limitations: Cannot handle complex data relationships (no entities or attributes), not optimized for large datasets, no support for querying, sorting, or filtering.
/////  Core Data vs. Codable
/////  Codable: Used for easily encoding and decoding data to/from JSON, XML, or other formats.
/////  Use Case: Ideal for saving structured data in files (e.g., JSON) or sending/receiving data over the network.
/////  Limitations: Does not provide a persistent store out-of-the-box, lacks built-in support for managing relationships or object graphs, no built-in support for querying or filtering data.
/////  Core Data vs. File-Based Storage
/////  File-Based Storage: Involves manually saving data to files on disk.
/////  Use Case: Suitable for storing raw data, documents, images, or simple JSON files.
/////  Limitations: No support for querying or indexing data, no automatic handling of relationships between data entities, requires manual management of file read/write operations and potential conflicts.
/////  Core Data vs. SQLite
/////  SQLite: A lightweight, file-based SQL database commonly used for local storage in mobile applications.
/////  Use Case: Suitable for developers who need low-level control over database interactions.
/////  Limitations: Requires manual SQL queries to read/write data, no built-in object graph management, no direct integration with SwiftUI or reactive programming.
/////  Core Data vs. Cloud Storage (e.g., CloudKit)
/////  Cloud Storage: Used to sync data across multiple devices or store data remotely.
/////  Use Case: Suitable for apps that require syncing data between devices or sharing data between users.
/////  Limitations (for local use): Relies on an internet connection for data storage and syncing, higher complexity compared to local-only storage solutions
/////
