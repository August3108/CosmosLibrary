//
//  Copy And Retain.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 10/09/24.
//

import Foundation
import SwiftUI

//1. Copy (Value Types)
/// In Swift, value types (such as `struct`, `enum`, and basic types like `Int`, `String`)
/// follow the concept of **copy on assignment**. This means that when you assign
/// a value type to a new variable or pass it to a function, a **copy** of that value is created.
/// Each copy is independent, so modifying one will not affect the other.

///   struct Employee {
///       var name: String
///   }
///
///   var employee1 = Employee(name: "Alice")
///   var employee2 = employee1  // This creates a copy of employee1
///
///   employee2.name = "Bob"  // Modifying employee2 doesn't affect employee1
///
///   print(employee1.name)  // "Alice"
///   print(employee2.name)  // "Bob"

/// Explanation:
/// `employee2` is a copy of `employee1`. Changing `employee2`’s name does not affect `employee1`
/// because `Employee` is a value type (a struct), and modifying `employee2` only affects that copy.

//2. Retain (Reference Types)
/// Reference types (such as `class`) do not copy on assignment. Instead, they are **retained**
/// when assigned to a new variable or passed to a function. This means both variables
/// refer to the same instance in memory, and changing one will affect the other.
///
///     class Vehicle {
///         var model: String
///
///         init(model: String) {
///             self.model = model
///         }
///     }
///
///     var vehicle1 = Vehicle(model: "Tesla")
///     var vehicle2 = vehicle1  // This does not copy, but creates a new reference to the same object
///
///     vehicle2.model = "Ford"  // Modifying vehicle2 also affects vehicle1
///
///     print(vehicle1.model)  // "Ford"
///     print(vehicle2.model)  // "Ford"
///
/// Explanation:
/// `vehicle1` and `vehicle2` refer to the same instance of the `Vehicle` class because `Vehicle`
/// is a reference type. Modifying `vehicle2`’s model changes `vehicle1` as well.

//3. Copy and Retain in SwiftUI
/// SwiftUI relies heavily on Swift’s memory management principles (such as copy and retain)
/// when dealing with state and data. However, SwiftUI's declarative UI system manages views
/// efficiently, often making copies of value types like `struct`, while classes are passed by reference.

/// In SwiftUI, views are typically value types (structs), meaning they are copied when necessary.

struct EmployeeView: View {
    @State private var employeeName = "Alice"
    
    var body: some View {
        VStack {
            Text(employeeName)
            Button("Change Name") {
                employeeName = "Bob"
            }
        }
    }
}

/// Explanation:
/// `EmployeeView` is a struct, which is a value type. SwiftUI creates copies of the view
/// when it needs to update the UI. However, the state (`@State`) is retained across these copies
/// to ensure the UI remains synchronized with the underlying data.

//4. Example: SwiftUI with Reference Types (Retain Behavior)
/// If you use reference types (classes) for your data models, they will behave differently
/// in SwiftUI since they are **retained** rather than copied.

class EmployeeModel: ObservableObject {
    @Published var name: String = "Alice"
}

struct EmployeeModelView: View {
    @StateObject private var employee = EmployeeModel()

    var body: some View {
        VStack {
            Text(employee.name)
            Button("Change Name") {
                employee.name = "Bob"
            }
        }
    }
}

/// Explanation:
/// `EmployeeModel` is a reference type (class), and it is retained when passed into the view.
/// Any changes to `employee.name` will reflect immediately in the view because SwiftUI retains
/// the reference to `employee` and observes changes via `@Published`.
