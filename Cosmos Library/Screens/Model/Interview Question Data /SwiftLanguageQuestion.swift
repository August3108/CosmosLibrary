//
//  SwiftLanguageQuestion.swift
//  Cosmos Library
//
//  Created by Rahul jha on 12/05/25.
//

import Foundation
import SwiftUICore

let IQSwiftBasics : [generalContentModel] = [
    
    generalContentModel(
        mainImage: "",
        mainTitle: "Constants and Variables",
        mainDescription: "Learn how to use `let` and `var` to declare constants and variables in Swift. Understand the difference between values that can and cannot change.",
        keywords: ["let", "var", "variables", "constants", "swift basics"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Declaring Constants with let",
                DDescription: "Use `let` when the value should never change. Once assigned, a constant cannot be reassigned.",
                sampleView: nil,
                code: """
    let birthYear = 1995
    // birthYear = 2000 // Error: Cannot assign to value
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Declaring Variables with var",
                DDescription: "Use `var` when the value may change later in the program.",
                sampleView: nil,
                code: """
    var age = 25
    age = 26 // This is allowed
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "When to Use let or var",
                DDescription: """
    - Use `let` by default for safety.
    - Use `var` only if the value needs to change.
    This helps prevent accidental bugs.
    """,
                sampleView: nil,
                code: """
    let userName = "Alice"
    var score = 0
    score += 10
    """
            )
        ]
    ),
    
    generalContentModel(
        mainImage: "",
        mainTitle: "Type Annotations",
        mainDescription: "Learn how to specify the type of a variable or constant in Swift. This helps the compiler and makes your code more readable.",
        keywords: ["type annotation", "swift type", "inference", "variable type"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "What is Type Annotation?",
                DDescription: "Type annotation means explicitly stating what type of value a variable or constant will hold.",
                sampleView: nil,
                code: """
    let name: String = "Bob"
    var score: Int = 100
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Why Use Type Annotations?",
                DDescription: """
    - Helps avoid confusion
    - Makes the code self-explanatory
    - Required when the value is not immediately assigned
    """,
                sampleView: nil,
                code: """
    var height: Double
    height = 5.8
    """
            )
        ]
    ),
    
    generalContentModel(
        mainImage: "",
        mainTitle: "Swift Data Types",
        mainDescription: "Understand the basic data types in Swift. Includes integers, floats, booleans, tuples, and more.",
        keywords: ["int", "float", "bool", "tuples", "typealias", "swift datatypes"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Integers and Bounds",
                DDescription: "Swift has several integer types. Use `Int` for most cases. Bounds prevent overflow errors.",
                sampleView: nil,
                code: """
    let number: Int = 10
    print(Int.min)
    print(Int.max)
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Unsigned Integers",
                DDescription: "`UInt` holds only non-negative numbers. Useful for counts or indexes.",
                sampleView: nil,
                code: """
    let count: UInt = 42
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Float and Double",
                DDescription: "`Float` is less precise, `Double` is more precise. Use `Double` by default.",
                sampleView: nil,
                code: """
    let pi: Float = 3.14
    let gravity: Double = 9.81
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Boolean Type",
                DDescription: "`Bool` stores `true` or `false`. Often used in conditions.",
                sampleView: nil,
                code: """
    let isOnline: Bool = true
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Tuples",
                DDescription: "Group multiple values into one unit. Access by position or name.",
                sampleView: nil,
                code: """
    let person = (name: "Tom", age: 30)
    print(person.name)
    print(person.1)
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Type Aliases",
                DDescription: "Use `typealias` to give a type a new name. This helps with clarity.",
                sampleView: nil,
                code: """
    typealias Age = Int
    let myAge: Age = 27
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Numeric Literals",
                DDescription: "Swift allows decimal, binary, octal, and hexadecimal number formats.",
                sampleView: nil,
                code: """
    let decimal = 17
    let binary = 0b10001
    let octal = 0o21
    let hexadecimal = 0x11
    """
            )
        ]
    ),
    
    generalContentModel(
        mainImage: "",
        mainTitle: "Optionals in Swift",
        mainDescription: "Optionals allow variables to either have a value or be nil. Learn how to work safely with them using unwrapping and binding.",
        keywords: ["optionals", "nil", "if let", "guard let", "unwrapping"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "What are Optionals?",
                DDescription: "An optional means a variable may or may not contain a value. This is useful when a value might be missing.",
                sampleView: nil,
                code: """
    var name: String? = "Alice"
    var number: Int? = nil
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Force Unwrapping",
                DDescription: "Use `!` to access the value of an optional, but only if you're sure it's not nil. Otherwise, the app will crash.",
                sampleView: nil,
                code: """
    let name: String? = "Bob"
    print(name!) // Works only if name is not nil
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Optional Binding with if let",
                DDescription: "Safely unwrap an optional by checking if it has a value using `if let`.",
                sampleView: nil,
                code: """
    if let name = name {
        print("Name is \\(name)")
    } else {
        print("No name found")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using guard let",
                DDescription: "`guard let` is used to exit early if an optional is nil. It avoids deep nesting.",
                sampleView: nil,
                code: """
    func greet(_ name: String?) {
        guard let unwrapped = name else {
            print("Name missing")
            return
        }
        print("Hello, \\(unwrapped)")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Nil-Coalescing Operator",
                DDescription: "Use `??` to provide a default value if an optional is nil.",
                sampleView: nil,
                code: """
    let username: String? = nil
    print(username ?? "Guest")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Optional Chaining",
                DDescription: "Access properties of an optional safely using `?`. If the optional is nil, the call returns nil.",
                sampleView: nil,
                code: """
    let name: String? = "John"
    print(name?.count ?? 0)
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Error Handling in Swift",
        mainDescription: "Swift allows you to handle errors gracefully using `do-catch`, `try`, and `throw`.",
        keywords: ["error handling", "throw", "try", "do-catch"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "What is Error Handling?",
                DDescription: "Use error handling when something can go wrong, like reading a file or parsing data.",
                sampleView: nil,
                code: """
    enum FileError: Error {
        case notFound
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Throwing Errors",
                DDescription: "Use `throw` to signal that an error occurred in a function.",
                sampleView: nil,
                code: """
    func readFile() throws {
        throw FileError.notFound
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Try and Catch",
                DDescription: "Use `try` to call a throwing function and handle it with `do-catch`.",
                sampleView: nil,
                code: """
    do {
        try readFile()
    } catch {
        print("File not found.")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "try?, try!",
                DDescription: """
    - `try?` returns nil on failure.
    - `try!` crashes if there's an error.
    """,
                sampleView: nil,
                code: """
    let result = try? readFile() // result is nil if error
    // let mustSucceed = try! readFile() // crashes on error
    """
            )
        ]
    ),
    
    generalContentModel(
        mainImage: "",
        mainTitle: "Assertions & Preconditions",
        mainDescription: "Assertions and preconditions help catch bugs during development by checking for unexpected values.",
        keywords: ["assertions", "preconditions", "debugging"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Using Assertions",
                DDescription: "An `assert` checks that a condition is true. It runs only in debug builds.",
                sampleView: nil,
                code: """
    let age = -1
    assert(age >= 0, "Age can't be negative")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using Preconditions",
                DDescription: "A `precondition` checks conditions that must always be true, even in release builds.",
                sampleView: nil,
                code: """
    let count = -3
    precondition(count >= 0, "Count must be non-negative")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "When to Use Them",
                DDescription: """
    - Use `assert` for debug-time checks.
    - Use `precondition` when failure means critical bugs or logic errors.
    """,
                sampleView: nil,
                code: """
    func divide(_ a: Int, _ b: Int) {
        precondition(b != 0, "Cannot divide by zero")
        print(a / b)
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Enforcing Preconditions",
        mainDescription: "Use preconditions to ensure your program is always in a valid state. These checks help you catch serious logic errors during development and runtime.",
        keywords: ["precondition", "enforce", "safety", "runtime checks", "swift errors"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "What are Preconditions?",
                DDescription: "A precondition is a runtime check that must be true for your code to continue. If the condition fails, the app crashes immediately.",
                sampleView: nil,
                code: """
    let balance = -500
    precondition(balance >= 0, "Balance can't be negative")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Why Use Preconditions?",
                DDescription: """
    Use preconditions to:
    - Catch bugs early
    - Avoid unexpected program states
    - Clearly express your assumptions in code
    """,
                sampleView: nil,
                code: """
    func withdraw(amount: Int, from balance: Int) {
        precondition(amount <= balance, "Cannot withdraw more than balance")
        print("Withdraw successful")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Precondition vs Assertion",
                DDescription: """
    - `assert` is only active in **debug** builds
    - `precondition` is active in **both debug and release**
    Use `precondition` for checks that must always pass.
    """,
                sampleView: nil,
                code: """
    let age = 15
    assert(age >= 0, "Debug: Invalid age")
    precondition(age >= 0, "Runtime: Invalid age")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Using preconditionFailure()",
                DDescription: "`preconditionFailure()` crashes the app immediately. Use when an invalid path is reached.",
                sampleView: nil,
                code: """
    func process(_ value: Int?) {
        guard let val = value else {
            preconditionFailure("Value must not be nil")
        }
        print(val)
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Operators in Swift",
        mainDescription: "Operators are special symbols or phrases used to check, combine, and manipulate values. Swift includes many types of operators like arithmetic, comparison, logical, and more.",
        keywords: ["operators", "arithmetic", "comparison", "logical", "ternary", "range", "nil coalescing", "swift syntax"],
        technology: "Swift",
        viewComponentDescription: [

            // MARK: - Arithmetic Operators
            DescriptionView(
                DImage: "",
                DTitle: "Arithmetic Operators",
                DDescription: """
    These are used for basic math operations:
    - `+` Addition
    - `-` Subtraction
    - `*` Multiplication
    - `/` Division
    - `%` Remainder (Modulus)
    """,
                sampleView: nil,
                code: """
    let sum = 5 + 3       // 8
    let diff = 10 - 4     // 6
    let product = 4 * 2   // 8
    let quotient = 8 / 2  // 4
    let remainder = 9 % 2 // 1
    """
            ),

            // MARK: - Assignment Operators
            DescriptionView(
                DImage: "",
                DTitle: "Assignment Operators",
                DDescription: """
    Assign or modify values using:
    - `=` Assign
    - `+=`, `-=`, `*=`, `/=`, `%=`
    """,
                sampleView: nil,
                code: """
    var score = 10
    score += 5  // 15
    score *= 2  // 30
    """
            ),

            // MARK: - Comparison Operators
            DescriptionView(
                DImage: "",
                DTitle: "Comparison Operators",
                DDescription: """
    Used to compare two values:
    - `==` Equal to
    - `!=` Not equal to
    - `>`  Greater than
    - `<`  Less than
    - `>=` Greater than or equal to
    - `<=` Less than or equal to
    """,
                sampleView: nil,
                code: """
    let a = 5
    let b = 10
    print(a < b)   // true
    print(a == b)  // false
    """
            ),

            // MARK: - Logical Operators
            DescriptionView(
                DImage: "",
                DTitle: "Logical Operators",
                DDescription: """
    Used to combine Boolean values:
    - `!` NOT
    - `&&` AND
    - `||` OR
    """,
                sampleView: nil,
                code: """
    let isOnline = true
    let isAdmin = false

    print(!isAdmin)            // true
    print(isOnline && isAdmin) // false
    print(isOnline || isAdmin) // true
    """
            ),

            // MARK: - Ternary Operator
            DescriptionView(
                DImage: "",
                DTitle: "Ternary Operator",
                DDescription: "A shorthand `if-else` that returns one of two values based on a condition.",
                sampleView: nil,
                code: """
    let age = 20
    let result = age >= 18 ? "Adult" : "Minor"
    print(result) // Adult
    """
            ),

            // MARK: - Range Operators
            DescriptionView(
                DImage: "",
                DTitle: "Range Operators",
                DDescription: """
    Swift supports:
    - `...` Closed range (includes end)
    - `..<` Half-open range (excludes end)
    """,
                sampleView: nil,
                code: """
    for i in 1...5 {
        print(i) // 1 to 5
    }

    for j in 1..<5 {
        print(j) // 1 to 4
    }
    """
            ),

            // MARK: - Nil-Coalescing Operator
            DescriptionView(
                DImage: "",
                DTitle: "Nil-Coalescing Operator (??)",
                DDescription: "Provides a default value if an optional is nil.",
                sampleView: nil,
                code: """
    let name: String? = nil
    print(name ?? "Guest") // Guest
    """
            ),

            // MARK: - Identity Operators
            DescriptionView(
                DImage: "",
                DTitle: "Identity Operators",
                DDescription: "Used to check if two references point to the same object.",
                sampleView: nil,
                code: """
    class Dog {}
    let dog1 = Dog()
    let dog2 = dog1
    let dog3 = Dog()

    print(dog1 === dog2) // true
    print(dog1 === dog3) // false
    """
            ),

            // MARK: - Bitwise Operators
            DescriptionView(
                DImage: "",
                DTitle: "Bitwise Operators",
                DDescription: """
    Operate on binary values:
    - `&` AND
    - `|` OR
    - `^` XOR
    - `~` NOT
    - `<<` Left shift
    - `>>` Right shift
    """,
                sampleView: nil,
                code: """
    let a: UInt8 = 0b00001111
    let b: UInt8 = 0b11110000

    print(a & b)  // 0
    print(a | b)  // 255
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Strings and Characters",
        mainDescription: "Strings are sequences of characters. Swift provides powerful tools to work with text, from literals and interpolation to modifying and comparing strings.",
        keywords: ["string", "character", "interpolation", "substring", "mutability", "swift text"],
        technology: "Swift",
        viewComponentDescription: [

            // MARK: - String Literals
            DescriptionView(
                DImage: "",
                DTitle: "String Literals",
                DDescription: "A string literal is a fixed value written directly into your code.",
                sampleView: nil,
                code: """
    let greeting = "Hello, world!"
    """
            ),

            // MARK: - Multiline String Literals
            DescriptionView(
                DImage: "",
                DTitle: "Multiline String Literals",
                DDescription: "Use triple quotes (`\"\"\"`) to create multiline strings.",
                sampleView: nil,
                code: """
    let quote = \"\"\"
    This is a
    multiline string.
    \"\"\"
    """
            ),

            // MARK: - Special Characters in Strings
            DescriptionView(
                DImage: "",
                DTitle: "Special Characters in String Literals",
                DDescription: "Use backslash (`\\`) to include special characters in a string.",
                sampleView: nil,
                code: """
    let text = "Line 1\\nLine 2\\tTabbed"
    """
            ),

            // MARK: - Extended String Delimiters
            DescriptionView(
                DImage: "",
                DTitle: "Extended String Delimiters",
                DDescription: "Use `#` to avoid needing backslashes for escape characters inside strings.",
                sampleView: nil,
                code: """
    let raw = #"This is a raw string with \\n."#
    """
            ),

            // MARK: - String Mutability
            DescriptionView(
                DImage: "",
                DTitle: "String Mutability",
                DDescription: "Strings declared with `var` can be modified; those with `let` cannot.",
                sampleView: nil,
                code: """
    var name = "John"
    name += " Doe"
    // let fixedName = "Tom"
    // fixedName += " Hanks" // Error
    """
            ),

            // MARK: - Strings Are Value Types
            DescriptionView(
                DImage: "",
                DTitle: "Strings Are Value Types",
                DDescription: "Strings are copied when assigned or passed. They do not share memory.",
                sampleView: nil,
                code: """
    var original = "Swift"
    var copy = original
    copy += " Rocks"
    print(original) // Still "Swift"
    """
            ),

            // MARK: - Concatenating Strings and Characters
            DescriptionView(
                DImage: "",
                DTitle: "Concatenating Strings and Characters",
                DDescription: "Use `+` to join strings or `.append()` to add characters.",
                sampleView: nil,
                code: """
    let name = "Alice"
    let greeting = "Hi, " + name

    var mood = "Happy"
    mood.append("!")
    """
            ),

            // MARK: - String Interpolation
            DescriptionView(
                DImage: "",
                DTitle: "String Interpolation",
                DDescription: "Insert values inside strings using `\\(value)` syntax.",
                sampleView: nil,
                code: """
    let age = 25
    let message = "You are \\(age) years old."
    """
            ),

            // MARK: - Accessing and Modifying a String
            DescriptionView(
                DImage: "",
                DTitle: "Accessing and Modifying a String",
                DDescription: "Use `.startIndex`, `.endIndex`, or `.index()` to read or change parts of a string.",
                sampleView: nil,
                code: """
    let str = "Hello"
    let firstChar = str[str.startIndex] // "H"
    """
            ),

            // MARK: - Inserting and Removing
            DescriptionView(
                DImage: "",
                DTitle: "Inserting and Removing",
                DDescription: "You can insert or remove characters or substrings using specific methods.",
                sampleView: nil,
                code: """
    var text = "Hello"
    text.insert("!", at: text.endIndex)
    text.remove(at: text.index(before: text.endIndex))
    """
            ),

            // MARK: - Substrings
            DescriptionView(
                DImage: "",
                DTitle: "Substrings",
                DDescription: "Use slicing to create substrings. Substrings are memory-efficient but temporary.",
                sampleView: nil,
                code: """
    let name = "SwiftUI"
    let index = name.firstIndex(of: "U")!
    let part = name[..<index] // "Swift"
    """
            ),

            // MARK: - Prefix and Suffix Equality
            DescriptionView(
                DImage: "",
                DTitle: "Prefix and Suffix Equality",
                DDescription: "Check if a string starts or ends with a specific value using `.hasPrefix()` and `.hasSuffix()`.",
                sampleView: nil,
                code: """
    let email = "test@example.com"
    print(email.hasSuffix(".com")) // true
    print(email.hasPrefix("test")) // true
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Collection Types in Swift",
        mainDescription: "Swift provides powerful collection types to store groups of values: Arrays, Sets, and Dictionaries.",
        keywords: ["collections", "array", "set", "dictionary", "swift collections"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "What is a Collection?",
                DDescription: "A collection is a group of values stored as a single value. Swift provides three main collection types:",
                sampleView: nil,
                code: """
    // Array - ordered list of items
    let fruits = ["Apple", "Banana", "Orange"]

    // Set - unordered unique items
    let colors: Set = ["Red", "Green", "Blue"]

    // Dictionary - key-value pairs
    let scores = ["Alice": 90, "Bob": 85]
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Mutability of Collections",
                DDescription: "Like other values, collections declared with `var` can be modified. `let` makes them immutable.",
                sampleView: nil,
                code: """
    var numbers = [1, 2, 3]
    numbers.append(4)  // Allowed

    let fixedNumbers = [1, 2, 3]
    // fixedNumbers.append(4) // Error
    """
            )
        ]
    ),generalContentModel(
        mainImage: "",
        mainTitle: "Collection: Arrays",
        mainDescription: "An array stores values in an ordered list. Learn how to create, access, and modify arrays.",
        keywords: ["array", "array operations", "swift array", "collection"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Creating Arrays",
                DDescription: "You can create arrays using literals or with types explicitly.",
                sampleView: nil,
                code: """
    let numbers = [1, 2, 3]
    let names: [String] = ["Alice", "Bob"]
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Accessing Elements",
                DDescription: "Access elements by index. Indexing starts at 0.",
                sampleView: nil,
                code: """
    let first = numbers[0]
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Modifying Arrays",
                DDescription: "You can insert, append, or remove items if the array is mutable.",
                sampleView: nil,
                code: """
    var fruits = ["Apple", "Banana"]
    fruits.append("Orange")
    fruits.insert("Mango", at: 1)
    fruits.remove(at: 0)
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Iterating Over Arrays",
                DDescription: "Use a `for-in` loop to go through each element in the array.",
                sampleView: nil,
                code: """
    for fruit in fruits {
        print(fruit)
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Collection: Sets",
        mainDescription: "A Set stores unique values with no specific order. Ideal when you need to check for presence or perform math-like operations.",
        keywords: ["set", "swift sets", "set operations", "collection"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Creating Sets",
                DDescription: "Use Set type and curly braces. Items must be unique.",
                sampleView: nil,
                code: """
    var colors: Set = ["Red", "Green", "Blue"]
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Basic Set Operations",
                DDescription: "Add or remove items just like arrays, but no duplicates allowed.",
                sampleView: nil,
                code: """
    colors.insert("Yellow")
    colors.remove("Red")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Fundamental Set Operations",
                DDescription: """
    Sets support math-like operations:
    - Union: combine two sets
    - Intersection: common items
    - Subtraction: items in A not in B
    """,
                sampleView: nil,
                code: """
    let a: Set = [1, 2, 3]
    let b: Set = [3, 4, 5]

    a.union(b)         // [1, 2, 3, 4, 5]
    a.intersection(b)  // [3]
    a.subtracting(b)   // [1, 2]
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Collection: Dictionaries",
        mainDescription: "A dictionary stores key-value pairs. It's useful when you want to associate values with identifiers.",
        keywords: ["dictionary", "key value", "swift map", "collection"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Creating a Dictionary",
                DDescription: "Use square brackets with `key: value` pairs. Keys must be unique.",
                sampleView: nil,
                code: """
    var scores = ["Alice": 95, "Bob": 88]
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Accessing and Modifying Values",
                DDescription: "Access values by their key. You can also update or remove entries.",
                sampleView: nil,
                code: """
    let aliceScore = scores["Alice"]

    scores["Bob"] = 90
    scores["Charlie"] = 85
    scores.removeValue(forKey: "Alice")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Looping Through Dictionary",
                DDescription: "Loop through keys and values using a `for-in` loop.",
                sampleView: nil,
                code: """
    for (name, score) in scores {
        print("\\(name): \\(score)")
    }
    """
            )
        ]
    ),
    
    
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    
    generalContentModel(
        mainImage: "",
        mainTitle: "While and Repeat-While Loops",
        mainDescription: "Use while loops when the number of iterations isn’t known in advance.",
        keywords: ["while", "repeat-while", "loops"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "While Loop",
                DDescription: "Repeats a block of code while a condition is true.",
                sampleView: nil,
                code: """
    var count = 0
    while count < 3 {
        print(count)
        count += 1
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Repeat-While Loop",
                DDescription: "Runs the loop body at least once, then checks the condition.",
                sampleView: nil,
                code: """
    var number = 1
    repeat {
        print(number)
        number += 1
    } while number <= 3
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Conditional Statements",
        mainDescription: "Swift uses `if`, `else`, and `else if` to make decisions based on conditions.",
        keywords: ["if", "if-else", "conditionals"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Using if",
                DDescription: "Executes code only if the condition is true.",
                sampleView: nil,
                code: """
    let temp = 30
    if temp > 25 {
        print("It's hot!")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "if-else",
                DDescription: "Adds an alternate path when the condition is false.",
                sampleView: nil,
                code: """
    if temp > 25 {
        print("Hot")
    } else {
        print("Cool")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "if-else if",
                DDescription: "Checks multiple conditions in sequence.",
                sampleView: nil,
                code: """
    if temp > 35 {
        print("Very hot")
    } else if temp > 25 {
        print("Warm")
    } else {
        print("Cold")
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Guard Statements",
        mainDescription: "Use `guard` to check conditions early and exit if they’re not met.",
        keywords: ["guard", "early exit", "validation"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Basic guard usage",
                DDescription: "`guard` allows clean exit when conditions fail. It avoids deep nesting.",
                sampleView: nil,
                code: """
    func greet(name: String?) {
        guard let name = name else {
            print("No name provided")
            return
        }
        print("Hello, \\(name)")
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Switch Statements",
        mainDescription: "Switch makes complex decision-making easier. Swift switch must be exhaustive.",
        keywords: ["switch", "case", "pattern matching", "intervals"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Basic switch",
                DDescription: "Switch compares a value against multiple patterns.",
                sampleView: nil,
                code: """
    let grade = "A"

    switch grade {
    case "A":
        print("Excellent")
    case "B":
        print("Good")
    default:
        print("Needs Improvement")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Interval Matching",
                DDescription: "Use ranges in cases for numeric values.",
                sampleView: nil,
                code: """
    let score = 85

    switch score {
    case 90...100:
        print("A grade")
    case 80..<90:
        print("B grade")
    default:
        print("C grade or lower")
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Advanced Switch Patterns",
        mainDescription: "Learn value binding, where clauses, and compound cases in switch statements.",
        keywords: ["switch", "pattern matching", "compound case", "value binding", "where clause"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Tuples and Value Bindings",
                DDescription: "Use tuples and bind values inside a switch case.",
                sampleView: nil,
                code: """
    let point = (1, 1)

    switch point {
    case let (x, y):
        print("x is \\(x), y is \\(y)")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Where Clauses",
                DDescription: "`where` adds conditions to switch cases.",
                sampleView: nil,
                code: """
    switch point {
    case let (x, y) where x == y:
        print("x equals y")
    default:
        break
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Compound Cases",
                DDescription: "Match multiple values in a single case.",
                sampleView: nil,
                code: """
    let char = "a"

    switch char {
    case "a", "e", "i", "o", "u":
        print("Vowel")
    default:
        print("Consonant")
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Control Transfer Statements",
        mainDescription: "Swift provides statements to control the flow of execution: `continue`, `break`, `fallthrough`, `return`.",
        keywords: ["control flow", "continue", "break", "fallthrough", "return"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "continue",
                DDescription: "Skips current iteration and moves to the next.",
                sampleView: nil,
                code: """
    for i in 1...5 {
        if i == 3 {
            continue
        }
        print(i)
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "break",
                DDescription: "Exits the loop or switch statement early.",
                sampleView: nil,
                code: """
    for i in 1...5 {
        if i == 3 {
            break
        }
        print(i)
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "fallthrough",
                DDescription: "In switch, moves to the next case even if matched.",
                sampleView: nil,
                code: """
    let number = 5

    switch number {
    case 5:
        print("Five")
        fallthrough
    case 6:
        print("Also checking six")
    default:
        break
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "return",
                DDescription: "Ends function execution and optionally returns a value.",
                sampleView: nil,
                code: """
    func greet(_ name: String) {
        if name.isEmpty {
            return
        }
        print("Hello, \\(name)")
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Checking API Availability",
        mainDescription: "Use `if #available` to safely run newer API features on supported OS versions.",
        keywords: ["available", "api check", "os version"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Using if #available",
                DDescription: "Ensure your code runs only when the OS version supports it.",
                sampleView: nil,
                code: """
    if #available(iOS 15, *) {
        print("Use iOS 15 features")
    } else {
        print("Fallback for older iOS")
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "For-In Loops in Swift",
        mainDescription: "Swift's for-in loop allows you to iterate over ranges, collections, dictionaries, strings, and even custom types with concise syntax and powerful variations.",
        keywords: ["for-in", "loop", "iteration", "stride", "range", "lazy", "zip", "pattern matching"],
        technology: "Swift",
        viewComponentDescription: [

            // Basic usage
            DescriptionView(
                DImage: "",
                DTitle: "Basic for-in Loops",
                DDescription: """
    - Use closed (`1...5`) or half-open (`1..<5`) ranges
    - Iterate over arrays, sets, and dictionaries
    """,
                sampleView: nil,
                code: """
    for i in 1...5 { print(i) }
    for i in 1..<5 { print(i) }

    let array = [10, 20, 30]
    for value in array { print(value) }

    let set: Set = [1, 2, 3]
    for item in set { print(item) }

    let dict = ["a": 1, "b": 2]
    for (key, value) in dict {
        print("\\(key): \\(value)")
    }
    """
            ),

            // Stride & indices
            DescriptionView(
                DImage: "",
                DTitle: "Stride and Indices",
                DDescription: """
    Use `stride()` to create custom step intervals, including floating point.
    Use `.indices` to access array indexes.
    """,
                sampleView: nil,
                code: """
    for i in stride(from: 0, to: 10, by: 2) { print(i) }
    for i in stride(from: 0, through: 10, by: 2) { print(i) }
    for i in stride(from: 5, through: 1, by: -1) { print(i) }

    let names = ["Tom", "Jerry"]
    for index in names.indices {
        print("\\(index): \\(names[index])")
    }
    """
            ),

            // Tuples, enumeration, slices
            DescriptionView(
                DImage: "",
                DTitle: "Working with Tuples and Enumeration",
                DDescription: """
    You can iterate over arrays of tuples or get index + value using `.enumerated()`.
    """,
                sampleView: nil,
                code: """
    let points = [(1,2), (3,4)]
    for (x, y) in points { print("x: \\(x), y: \\(y)") }

    let items = ["a", "b", "c"]
    for (index, value) in items.enumerated() {
        print("\\(index): \\(value)")
    }

    let numbers = [1, 2, 3, 4, 5]
    for number in numbers[1...3] {
        print(number)
    }
    """
            ),

            // Control flow variations
            DescriptionView(
                DImage: "",
                DTitle: "Loop Filtering and Control",
                DDescription: """
    Use `guard`, `where`, or filtering inside the loop for custom behavior.
    Labeled loops help control nested flow.
    """,
                sampleView: nil,
                code: """
    for i in 1...5 {
        guard i != 3 else { continue }
        print(i)
    }

    for i in 1...10 where i % 2 == 0 {
        print(i)
    }

    outer: for i in 1...3 {
        for j in 1...3 {
            if i == j {
                continue outer
            }
            print("i: \\(i), j: \\(j)")
        }
    }

    for i in 0...5 {
        if i % 2 == 0 {
            print(i)
        }
    }
    """
            ),

            // Optionals and compactMap
            DescriptionView(
                DImage: "",
                DTitle: "For-In with Optional Collections",
                DDescription: """
    Use `?? []` or optional binding to safely loop over optional arrays.
    Use `compactMap` to filter and unwrap optionals in one step.
    """,
                sampleView: nil,
                code: """
    let optionalArray: [Int]? = [1, 2, 3]
    for value in optionalArray ?? [] { print(value) }

    if let safeArray = optionalArray {
        for value in safeArray {
            print(value)
        }
    }

    let strings = ["1", "two", "3"]
    for number in strings.compactMap({ Int($0) }) {
        print(number)
    }
    """
            ),

            // Strings, pattern matching, zip
            DescriptionView(
                DImage: "",
                DTitle: "Strings, Pattern Matching, Zip",
                DDescription: """
    You can loop through characters in a string, match types using `case let`, or zip multiple arrays together.
    """,
                sampleView: nil,
                code: """
    for char in "Hello" {
        print(char)
    }

    let values: [Any] = [1, "Hello", 3.14]
    for case let number as Int in values {
        print(number)
    }

    let letters = ["A", "B", "C"]
    let nums = [1, 2, 3]
    for (letter, number) in zip(letters, nums) {
        print("\\(letter): \\(number)")
    }
    """
            ),

            // Custom Sequences and Lazy
            DescriptionView(
                DImage: "",
                DTitle: "Lazy & Custom Sequences",
                DDescription: """
    Define your own sequence using `Sequence` and `IteratorProtocol`, or improve performance with `.lazy`.
    """,
                sampleView: nil,
                code: """
    struct Countdown: Sequence, IteratorProtocol {
        var count: Int
        mutating func next() -> Int? {
            if count == 0 { return nil }
            defer { count -= 1 }
            return count
        }
    }
    for number in Countdown(count: 3) {
        print(number)
    }

    for value in (1...5).lazy {
        print(value)
    }
    """
            ),

            // Miscellaneous
            DescriptionView(
                DImage: "",
                DTitle: "Other for-in Variants",
                DDescription: """
    You can loop with floating point strides, repeat a value multiple times, or use `.map()` just to apply side effects.
    """,
                sampleView: nil,
                code: """
    for value in stride(from: 0.0, through: 1.0, by: 0.25) {
        print(value)
    }

    for word in repeatElement("Hi", count: 3) {
        print(word)
    }

    [1, 2, 3].map { print($0) }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Function Parameters and Return Values",
        mainDescription: "Functions can accept parameters and return values. Learn how to use them effectively.",
        keywords: ["parameters", "return", "tuple", "function"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Functions with Parameters",
                DDescription: "You can pass values to a function using parameters.",
                sampleView: nil,
                code: """
    func greet(name: String) {
        print("Hello, \\(name)")
    }
    greet(name: "Alice")
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Multiple Parameters and No Parameters",
                DDescription: "Functions can have multiple or zero parameters.",
                sampleView: nil,
                code: """
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    print(add(a: 3, b: 5))

    func sayHi() {
        print("Hi!")
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "No Return and Multiple Return Values",
                DDescription: "Functions can return nothing (`Void`) or multiple values using tuples.",
                sampleView: nil,
                code: """
    func logMessage() {
        print("Logged")
    }

    func minMax(numbers: [Int]) -> (min: Int, max: Int) {
        return (numbers.min() ?? 0, numbers.max() ?? 0)
    }

    let result = minMax(numbers: [3, 7, 1, 9])
    print("Min: \\(result.min), Max: \\(result.max)")
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Function Parameters in Detail",
        mainDescription: "Swift provides useful parameter features like argument labels, default values, variadic, and in-out parameters.",
        keywords: ["function", "inout", "variadic", "default parameter", "labels"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Argument Labels and Omitting Them",
                DDescription: "You can customize or omit argument labels for clarity.",
                sampleView: nil,
                code: """
    func greet(person name: String) {
        print("Hello, \\(name)!")
    }
    greet(person: "Alice")

    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    add(2, 3)
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Default and Variadic Parameters",
                DDescription: "Parameters can have default values or accept variable numbers of arguments.",
                sampleView: nil,
                code: """
    func greet(name: String = "Guest") {
        print("Hello, \\(name)")
    }
    greet() // Hello, Guest

    func sum(numbers: Int...) -> Int {
        return numbers.reduce(0, +)
    }
    sum(numbers: 1, 2, 3) // 6
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "In-Out Parameters",
                DDescription: "Use `inout` to modify a passed variable directly. Use `&` when calling.",
                sampleView: nil,
                code: """
    func increment(_ number: inout Int) {
        number += 1
    }
    var value = 5
    increment(&value)
    print(value) // 6
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Function Types and Higher-Order Functions",
        mainDescription: "Functions in Swift are first-class types. You can pass them as arguments, return them, and nest them.",
        keywords: ["function types", "higher-order", "map", "filter", "nested"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Using Functions as Types",
                DDescription: "Functions can be stored in variables, passed as parameters, or returned.",
                sampleView: nil,
                code: """
    func double(x: Int) -> Int {
        return x * 2
    }

    func applyFunction(value: Int, operation: (Int) -> Int) -> Int {
        return operation(value)
    }
    print(applyFunction(value: 5, operation: double)) // 10
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "High-Order Functions: map, filter, reduce",
                DDescription: """
    These methods operate on collections using closures:
    - `map`: transform each element
    - `filter`: keep only matching
    - `reduce`: combine into one value
    """,
                sampleView: nil,
                code: """
    let numbers = [1, 2, 3, 4, 5]
    let doubled = numbers.map { $0 * 2 }       // [2, 4, 6, 8, 10]
    let evens = numbers.filter { $0 % 2 == 0 } // [2, 4]
    let sum = numbers.reduce(0) { $0 + $1 }    // 15
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Nested Functions",
                DDescription: "You can define a function inside another. The inner function is private to the outer one.",
                sampleView: nil,
                code: """
    func outerFunction() {
        print("Outer")

        func innerFunction() {
            print("Inner")
        }

        innerFunction()
    }
    outerFunction()
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Closures in Swift",
        mainDescription: "Closures are self-contained blocks of code that can be passed and stored. They're a key part of Swift's functional programming capabilities.",
        keywords: ["closures", "closure syntax", "@escaping", "@autoclosure", "capturing", "trailing closures"],
        technology: "Swift",
        viewComponentDescription: [

            // Basic closure syntax
            DescriptionView(
                DImage: "",
                DTitle: "Closure Expression Syntax",
                DDescription: """
    Closures look like functions without a name. You can store and execute them later.
    """,
                sampleView: nil,
                code: """
    let greet = { (name: String) -> String in
        return "Hello, \\(name)!"
    }
    print(greet("Alice"))
    """
            ),

            // Inferred type
            DescriptionView(
                DImage: "",
                DTitle: "Type Inference in Closures",
                DDescription: "Swift can infer types from context. You can also use shorthand `$0`, `$1` for parameters.",
                sampleView: nil,
                code: """
    let numbers = [1, 2, 3]
    let doubled = numbers.map { $0 * 2 }
    print(doubled) // [2, 4, 6]
    """
            ),

            // Trailing closure syntax
            DescriptionView(
                DImage: "",
                DTitle: "Trailing Closures",
                DDescription: "If a closure is the last parameter of a function, you can write it outside the parentheses.",
                sampleView: nil,
                code: """
    func fetchData(completion: () -> Void) {
        print("Fetching...")
        completion()
    }

    fetchData {
        print("Data fetched!")
    }
    """
            ),

            // Capturing values
            DescriptionView(
                DImage: "",
                DTitle: "Capturing Values",
                DDescription: "Closures can capture and store references to constants and variables from the surrounding context.",
                sampleView: nil,
                code: """
    func makeCounter() -> () -> Int {
        var count = 0
        return {
            count += 1
            return count
        }
    }

    let counter = makeCounter()
    print(counter()) // 1
    print(counter()) // 2
    """
            ),

            // Reference type behavior
            DescriptionView(
                DImage: "",
                DTitle: "Closures Are Reference Types",
                DDescription: "Closures are reference types. Assigning them to multiple variables points to the same captured state.",
                sampleView: nil,
                code: """
    let firstCounter = makeCounter()
    let secondCounter = firstCounter

    print(firstCounter()) // 3
    print(secondCounter()) // 4
    """
            ),

            // Escaping vs non-escaping
            DescriptionView(
                DImage: "",
                DTitle: "Escaping vs Non-Escaping Closures",
                DDescription: """
    Non-escaping: closure is called before the function returns.
    Escaping: closure may be stored and called later.
    """,
                sampleView: nil,
                code: """
    var handlers: [() -> Void] = []

    func addHandler(_ handler: @escaping () -> Void) {
        handlers.append(handler)
    }

    func executeNow(_ handler: () -> Void) {
        handler()
    }
    """
            ),

            // Autoclosures
            DescriptionView(
                DImage: "",
                DTitle: "Using Autoclosures",
                DDescription: "@autoclosure automatically wraps an expression into a closure. It's useful for delayed evaluation.",
                sampleView: nil,
                code: """
    func logMessage(_ message: @autoclosure () -> String) {
        print("Log: \\(message())")
    }

    logMessage("Something happened")
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Enumerations (Enums) in Swift",
        mainDescription: "Enums let you define a group of related values in a type-safe way. You can match, associate values, assign raw values, and even make them recursive.",
        keywords: ["enum", "enumeration", "associated values", "raw values", "recursive", "switch pattern"],
        technology: "Swift",
        viewComponentDescription: [

            // Basic enum syntax
            DescriptionView(
                DImage: "",
                DTitle: "Enumeration Syntax",
                DDescription: "Define enums using the `enum` keyword followed by cases.",
                sampleView: nil,
                code: """
    enum Direction {
        case north
        case south
        case east
        case west
    }

    let dir = Direction.north
    """
            ),

            // Pattern matching with switch
            DescriptionView(
                DImage: "",
                DTitle: "Matching Enums with Switch",
                DDescription: "Use a `switch` statement to handle enum values.",
                sampleView: nil,
                code: """
    switch dir {
    case .north:
        print("Go up")
    case .south:
        print("Go down")
    default:
        print("Turn")
    }
    """
            ),

            // Associated values
            DescriptionView(
                DImage: "",
                DTitle: "Associated Values",
                DDescription: "Enum cases can carry extra data, which you can extract with pattern matching.",
                sampleView: nil,
                code: """
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qr(String)
    }

    let product = Barcode.qr("XYZ123")

    switch product {
    case .upc(let a, let b, let c, let d):
        print("UPC: \\(a)-\\(b)-\\(c)-\\(d)")
    case .qr(let code):
        print("QR Code: \\(code)")
    }
    """
            ),

            // Raw values
            DescriptionView(
                DImage: "",
                DTitle: "Raw Values",
                DDescription: "Enums can have predefined raw values like `Int` or `String`.",
                sampleView: nil,
                code: """
    enum Planet: Int {
        case mercury = 1
        case venus, earth, mars
    }

    print(Planet.earth.rawValue) // 3
    """
            ),

            // Implicit raw values
            DescriptionView(
                DImage: "",
                DTitle: "Implicit Raw Values",
                DDescription: "When using `String` or `Int`, Swift can auto-assign raw values.",
                sampleView: nil,
                code: """
    enum Direction: String {
        case north, south, east, west
    }

    print(Direction.east.rawValue) // "east"
    """
            ),

            // Init from raw value
            DescriptionView(
                DImage: "",
                DTitle: "Init from Raw Value",
                DDescription: "Use `init?(rawValue:)` to create an enum from a raw value. This returns an optional.",
                sampleView: nil,
                code: """
    if let planet = Planet(rawValue: 3) {
        print("Planet: \\(planet)")
    } else {
        print("Invalid planet")
    }
    """
            ),

            // Recursive enums
            DescriptionView(
                DImage: "",
                DTitle: "Recursive Enumerations",
                DDescription: "Use `indirect` to allow enums to refer to themselves. Useful in trees or nested expressions.",
                sampleView: nil,
                code: """
    indirect enum Expression {
        case number(Int)
        case addition(Expression, Expression)
    }

    let sum = Expression.addition(.number(2), .number(3))
    """
            )
        ]
    ),
    
generalContentModel(
    
    mainImage: "",
    mainTitle: "Differentiate between map, filter and reduce",
    mainDescription: "T",
    keywords: [],
    technology: "SwiftUI",
    viewComponentDescription: [
        DescriptionView(
            
            DImage: "",
            DTitle: "map",
            DDescription: "The map function is used to transform each element in a collection and return a new collection with the transformed elements.\n\nPurpose: Apply the same operation to each element and create a new collection.\nReturns: A collection of the same size with transformed elements.",
            
            sampleView: nil,
            
            code: """
"""
        )
    ]
),
    generalContentModel(
        mainImage: "",
        mainTitle: "Explain the difference between struct and class in Swift.",
        mainDescription: "Structs and classes are both used to define custom data types in Swift, but they differ in memory behavior, inheritance, and usage. Here's a breakdown of their differences and similarities.",
        keywords: ["struct", "class", "value type", "reference type", "arc", "inheritance", "copy", "identity"],
        technology: "SwiftUI",
        viewComponentDescription: [

            DescriptionView(
                DImage: "",
                DTitle: "Value Type vs. Reference Type",
                DDescription: """
    Structs are **value types** — they are copied on assignment or when passed to a function.
    Classes are **reference types** — multiple variables can refer to the same instance.
    """,
                sampleView: nil,
                code: """
    struct UserStruct {
        var name: String
    }
    class UserClass {
        var name: String
        init(name: String) {
            self.name = name
        }
    }

    var a = UserStruct(name: "A")
    var b = a
    b.name = "B"
    print(a.name) // A

    var x = UserClass(name: "X")
    var y = x
    y.name = "Y"
    print(x.name) // Y
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Memory Management",
                DDescription: """
    Structs are not managed by ARC (Automatic Reference Counting).
    Classes are managed by ARC, which automatically keeps track of references for memory cleanup.
    """,
                sampleView: nil,
                code: """
    // ARC applies only to class instances
    class Car {
        var model: String
        init(model: String) {
            self.model = model
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Inheritance",
                DDescription: """
    Structs **do not support inheritance**. They cannot inherit from other structs.
    Classes **do support inheritance**, allowing reuse and override of properties and methods.
    """,
                sampleView: nil,
                code: """
    class Animal {
        func sound() {
            print("Some sound")
        }
    }
    class Dog: Animal {
        override func sound() {
            print("Bark")
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Mutability",
                DDescription: """
    Structs declared with `let` are completely immutable — you can’t change any property.
    Classes declared with `let` have a constant reference, but their mutable properties can still be changed.
    """,
                sampleView: nil,
                code: """
    struct Point {
        var x: Int
    }
    var p = Point(x: 10)
    p.x = 20 // OK

    let p2 = Point(x: 5)
    // p2.x = 6 // ❌ Error

    class Counter {
        var value = 0
    }
    let c = Counter()
    c.value = 5 // ✅ allowed
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Performance Considerations",
                DDescription: """
    Structs are typically allocated on the **stack**, making them lightweight and faster for small data.
    Classes live on the **heap** and involve ARC, making them better for complex reference-sharing needs.
    """,
                sampleView: nil,
                code: """
    struct Point {
        var x = 0
        var y = 0
    }
    class LargeModel {
        var data = Array(repeating: 0, count: 10_000)
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Definition Syntax",
                DDescription: "Use `struct` or `class` to define your custom types. Structs get a free memberwise initializer; classes don't.",
                sampleView: nil,
                code: """
    struct Point {
        var x: Int
        var y: Int
    }

    class Person {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Stored and Computed Properties",
                DDescription: "Both can have stored and computed properties. Use `get` and `set` to define computed ones.",
                sampleView: nil,
                code: """
    struct Rectangle {
        var width: Int
        var height: Int
        var area: Int {
            return width * height
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Instance Methods",
                DDescription: "Struct methods that modify properties must be marked `mutating`. Classes don’t need that.",
                sampleView: nil,
                code: """
    struct Counter {
        var count = 0
        mutating func increment() {
            count += 1
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Identity Operators",
                DDescription: "`===` checks if two class variables point to the same instance. Not available for structs.",
                sampleView: nil,
                code: """
    let dog1 = Dog(name: "Max")
    let dog2 = dog1
    let dog3 = Dog(name: "Max")

    print(dog1 === dog2) // true
    print(dog1 === dog3) // false
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Properties in Swift",
        mainDescription: "Properties store values in types like structs and classes. Swift offers stored, computed, observed, wrapped, and type properties to model data and behavior efficiently.",
        keywords: ["stored properties", "computed", "property wrapper", "didSet", "willSet", "static property"],
        technology: "Swift",
        viewComponentDescription: [

            // Stored Properties
            DescriptionView(
                DImage: "",
                DTitle: "Stored Properties",
                DDescription: "Stored properties are variables or constants that store a value directly as part of an instance.",
                sampleView: nil,
                code: """
    struct Person {
        var name: String
        let birthYear: Int
    }

    let user = Person(name: "Alice", birthYear: 1990)
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Lazy Stored Properties",
                DDescription: "`lazy` properties are initialized only when accessed for the first time.",
                sampleView: nil,
                code: """
    class DataLoader {
        lazy var fileData: String = {
            return "Loaded content"
        }()
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Stored Properties in Struct Constants",
                DDescription: "If a struct instance is a constant (`let`), its stored properties cannot be changed — even if declared with `var`.",
                sampleView: nil,
                code: """
    struct Car {
        var model = "Tesla"
    }

    let c = Car()
    // c.model = "BMW" // ❌ Error: Cannot modify
    """
            ),

            // Computed Properties
            DescriptionView(
                DImage: "",
                DTitle: "Computed Properties",
                DDescription: "Computed properties calculate a value rather than store it. Use `get` and optionally `set`.",
                sampleView: nil,
                code: """
    struct Rectangle {
        var width: Int
        var height: Int

        var area: Int {
            return width * height
        }

        var halfWidth: Int {
            get { width / 2 }
            set { width = newValue * 2 }
        }
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Read-Only Computed Properties",
                DDescription: "If only `get` is provided, you can omit `get` keyword.",
                sampleView: nil,
                code: """
    struct Circle {
        var radius: Double
        var diameter: Double {
            radius * 2
        }
    }
    """
            ),

            // Property Observers
            DescriptionView(
                DImage: "",
                DTitle: "Property Observers",
                DDescription: "`willSet` and `didSet` let you observe and respond to value changes.",
                sampleView: nil,
                code: """
    var score: Int = 0 {
        willSet {
            print("About to set score to \\(newValue)")
        }
        didSet {
            print("Score changed from \\(oldValue) to \\(score)")
        }
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Observers on Inherited Properties",
                DDescription: "You can add observers to a property you inherit, even if it's a stored property in the superclass.",
                sampleView: nil,
                code: """
    class Base {
        var value = 10
    }

    class Sub: Base {
        override var value: Int {
            didSet {
                print("Value changed in subclass")
            }
        }
    }
    """
            ),

            // Property Wrappers
            DescriptionView(
                DImage: "",
                DTitle: "Property Wrappers",
                DDescription: "You can extract reusable logic using property wrappers. They wrap stored properties with custom logic.",
                sampleView: nil,
                code: """
    @propertyWrapper
    struct Capitalized {
        private var text: String = ""
        var wrappedValue: String {
            get { text }
            set { text = newValue.capitalized }
        }
    }

    struct User {
        @Capitalized var name: String
    }
    """
            ),
            DescriptionView(
                DImage: "",
                DTitle: "Default & Projected Values",
                DDescription: "Property wrappers can expose extra values using the `$` prefix (projectedValue).",
                sampleView: nil,
                code: """
    @propertyWrapper
    struct Clamped {
        private var value = 0
        var wrappedValue: Int {
            get { value }
            set { value = min(max(0, newValue), 100) }
        }
        var projectedValue: String {
            return "Current: \\(value)"
        }
    }

    struct Volume {
        @Clamped var level: Int
    }

    let v = Volume(level: 110)
    print(v.$level) // "Current: 100"
    """
            ),

            // Global and Local Properties
            DescriptionView(
                DImage: "",
                DTitle: "Global and Local Variables",
                DDescription: "You can define properties outside types. Global constants are lazy and evaluated once.",
                sampleView: nil,
                code: """
    let appName = "MyApp"

    func greet() {
        let localGreeting = "Hi there"
        print(localGreeting)
    }
    """
            ),

            // Type Properties
            DescriptionView(
                DImage: "",
                DTitle: "Type Properties",
                DDescription: "Use `static` for properties shared across all instances. Classes can override `class` properties.",
                sampleView: nil,
                code: """
    struct Counter {
        static var total = 0
        var value = 0
    }

    class Animal {
        class var species: String {
            return "Unknown"
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Object-Oriented Programming in Swift",
        mainDescription: "Object-Oriented Programming (OOP) is a paradigm based on the concept of 'objects'. Swift supports OOP through classes and to some extent with structs.",
        keywords: ["oop", "object oriented", "class", "struct", "encapsulation", "inheritance", "polymorphism", "abstraction"],
        technology: "Swift",
        viewComponentDescription: [

            // OOP Core Concepts
            DescriptionView(
                DImage: "",
                DTitle: "What is Object-Oriented Programming?",
                DDescription: """
    OOP is a way to structure code using:
    - **Encapsulation**: Hiding internal state and exposing only necessary interface.
    - **Inheritance**: Creating new types from existing types.
    - **Polymorphism**: Using a common interface to interact with different types.
    - **Abstraction**: Focusing on essential features and hiding complexity.
    """,
                sampleView: nil,
                code: """
    class Animal {
        func sound() {
            print("Some sound")
        }
    }

    class Dog: Animal {
        override func sound() {
            print("Bark")
        }
    }

    let pet: Animal = Dog()
    pet.sound() // Bark (polymorphism)
    """
            ),

            // OOP with Classes
            DescriptionView(
                DImage: "",
                DTitle: "How Classes Support OOP",
                DDescription: "Classes in Swift are reference types and fully support OOP principles like inheritance, overriding, and polymorphism.",
                sampleView: nil,
                code: """
    class Vehicle {
        var speed = 0
        func accelerate() {
            speed += 10
        }
    }

    class Car: Vehicle {
        override func accelerate() {
            speed += 20
        }
    }
    """
            ),

            // Structs in OOP
            DescriptionView(
                DImage: "",
                DTitle: "What About Structs?",
                DDescription: """
    Structs support:
    - **Encapsulation** (via private/public)
    - **Methods and properties**
    But they do **not support inheritance** or polymorphism. They are value types and not reference types.
    """,
                sampleView: nil,
                code: """
    struct Point {
        var x: Int
        var y: Int

        func display() {
            print("Point: \\(x), \\(y)")
        }
    }
    """
            ),

            // When to Use Class or Struct in OOP
            DescriptionView(
                DImage: "",
                DTitle: "Struct vs Class in OOP",
                DDescription: """
    Use `class` when:
    - You need inheritance
    - You want shared references
    - You need identity checking

    Use `struct` when:
    - Data is simple and copied
    - Performance matters
    - You want immutability by default
    """,
                sampleView: nil,
                code: """
    struct Size {
        var width: Int
        var height: Int
    }

    class User {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Initialization in Swift",
        mainDescription: "Initialization sets up an instance with initial values for its properties. Swift offers flexible initialization features for structs and classes, including default values, custom initializers, delegation, and more.",
        keywords: ["initializer", "init", "memberwise", "failable", "required", "default values", "delegation"],
        technology: "Swift",
        viewComponentDescription: [

            // Default property values
            DescriptionView(
                DImage: "",
                DTitle: "Default Property Values",
                DDescription: "You can assign default values directly to stored properties. This makes instances ready without requiring init.",
                sampleView: nil,
                code: """
    struct User {
        var name = "Guest"
        var age = 18
    }

    let newUser = User()
    """
            ),

            // Assigning in init
            DescriptionView(
                DImage: "",
                DTitle: "Assigning Values in Initializer",
                DDescription: "You can set values manually in an initializer using the `init` method.",
                sampleView: nil,
                code: """
    struct Car {
        var model: String
        var year: Int

        init(model: String, year: Int) {
            self.model = model
            self.year = year
        }
    }
    """
            ),

            // Multiple custom inits
            DescriptionView(
                DImage: "",
                DTitle: "Multiple Initializers",
                DDescription: "You can define multiple initializers with different parameters for flexibility.",
                sampleView: nil,
                code: """
    struct Rectangle {
        var width: Int
        var height: Int

        init() {
            width = 0
            height = 0
        }

        init(width: Int, height: Int) {
            self.width = width
            self.height = height
        }
    }
    """
            ),

            // Default init for classes
            DescriptionView(
                DImage: "",
                DTitle: "Default Initializer",
                DDescription: "If all properties have default values and no custom init is provided, Swift gives a default one automatically.",
                sampleView: nil,
                code: """
    class Lamp {
        var isOn = false
    }

    let lamp = Lamp()
    """
            ),

            // Memberwise initializer for structs
            DescriptionView(
                DImage: "",
                DTitle: "Memberwise Initializers for Structs",
                DDescription: "Structs get a free init with parameters matching all stored properties — unless you define your own.",
                sampleView: nil,
                code: """
    struct Point {
        var x: Int
        var y: Int
    }

    let p = Point(x: 10, y: 20)
    """
            ),

            // Initializer delegation for value types
            DescriptionView(
                DImage: "",
                DTitle: "Initializer Delegation (Structs)",
                DDescription: "You can call another initializer from within an initializer using `self.init(...)`.",
                sampleView: nil,
                code: """
    struct Size {
        var width: Int
        var height: Int

        init() {
            self.init(width: 0, height: 0)
        }

        init(width: Int, height: Int) {
            self.width = width
            self.height = height
        }
    }
    """
            ),

            // Class initializers
            DescriptionView(
                DImage: "",
                DTitle: "Class: Designated vs Convenience Initializers",
                DDescription: """
    - **Designated initializer**: Fully initializes all properties directly or via superclass.
    - **Convenience initializer**: Must call another initializer from the same class.
    """,
                sampleView: nil,
                code: """
    class Person {
        var name: String

        init(name: String) {
            self.name = name
        }

        convenience init() {
            self.init(name: "Anonymous")
        }
    }
    """
            ),

            // Automatic initializer inheritance
            DescriptionView(
                DImage: "",
                DTitle: "Automatic Initializer Inheritance",
                DDescription: "Subclasses inherit inits from superclass **only** if they don’t define any of their own.",
                sampleView: nil,
                code: """
    class Animal {
        var age: Int
        init(age: Int) {
            self.age = age
        }
    }

    class Dog: Animal {
        // No initializer defined — inherits init(age:)
    }
    """
            ),

            // Failable initializer
            DescriptionView(
                DImage: "",
                DTitle: "Failable Initializer",
                DDescription: "Use `init?` to return nil if initialization fails (e.g., invalid input).",
                sampleView: nil,
                code: """
    struct ID {
        let value: String

        init?(value: String) {
            if value.isEmpty { return nil }
            self.value = value
        }
    }
    """
            ),

            // Required initializers
            DescriptionView(
                DImage: "",
                DTitle: "Required Initializers",
                DDescription: "Mark with `required` to ensure all subclasses implement the initializer.",
                sampleView: nil,
                code: """
    class Base {
        required init() {
            print("Base init")
        }
    }

    class Sub: Base {
        required init() {
            super.init()
            print("Sub init")
        }
    }
    """
            ),

            // Default value via closure
            DescriptionView(
                DImage: "",
                DTitle: "Default Property Value via Closure",
                DDescription: "Use a closure or function to assign a default value that needs computation.",
                sampleView: nil,
                code: """
    struct Logger {
        let timestamp: String = {
            let date = Date()
            return "\\(date)"
        }()
    }
    """
            )
        ]
    ),





generalContentModel(
    
    mainImage: "",
    mainTitle: "Protocols and Delegate",
    mainDescription: "",
    keywords: [],
    technology: "UIKit",
    viewComponentDescription: [
        DescriptionView(
            
            DImage: "",
            DTitle: "Protocol",
            DDescription: "",
            
            sampleView: nil,
            
            code: """
// MARK: Protocols

// Define a protocol named `beingCool`
// This protocol requires any conforming type to have a `name` property (read-only) 
// and to implement the `coolGreeting` method.
protocol beingCool {
    var name: String { get } // A read-only property requirement
    
    func coolGreeting() // A method requirement with no default implementation
}

// Define a struct `iAmCool` that conforms to the `beingCool` protocol
// This struct provides an implementation for the `name` property and `coolGreeting` method.
struct iAmCool: beingCool {
    var name: String // Fulfills the protocol requirement for the `name` property
    
    func coolGreeting() { // Provides the required method implementation
        print(name + " is cool") // Prints a cool message using the `name`
    }
}
"""
        ),
        DescriptionView(
            
            DImage: "",
            DTitle: "Delegate",
            DDescription: "",
            
            sampleView: nil,
            
            code: """

// MARK: Delegate

// Define a protocol `TaskDelegate` to act as a delegate.
// It requires a conforming class to implement the `taskDidComplete` method.
// The `AnyObject` constraint ensures that only class types can conform to this protocol.
protocol TaskDelegate: AnyObject {
    func taskDidComplete() // A method to be called when a task completes
}

// Define a class `ProtocolHolder` that uses a delegate to communicate task completion.
// This class has a weak reference to the delegate to avoid strong reference cycles.
class ProtocolHolder {
    weak var delegate: TaskDelegate? // A weak reference to avoid retain cycles
    
    func startTask() {
        print("Task started") // Simulate starting a task
        // Notify the delegate when the task is complete, if it exists
        delegate?.taskDidComplete()
    }
}

// Define a class `Requester` that conforms to the `TaskDelegate` protocol.
// This class provides the required `taskDidComplete` method to handle the notification.
class Requester: TaskDelegate {
    func taskDidComplete() { // Implements the required method from `TaskDelegate`
        print("Requester received the task completion notification.")
    }
}

"""
        )
    ]
),

generalContentModel(
    mainImage: "",
    mainTitle: "What Are Generics in Swift?",
    mainDescription: "Generics in Swift are a powerful feature that allows you to write flexible, reusable, and type-safe code. Instead of specifying a specific data type, generics enable you to write code that works with any type. This avoids code duplication while maintaining type safety.",
    keywords: [],
    technology: "UIKit",
    viewComponentDescription: [
        DescriptionView(
            
            DImage: "",
            DTitle: "",
            DDescription: "",
            sampleView: nil,
            
            code: """
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

// Example usage
var x = 10
var y = 20
swapValues(&x, &y) // x becomes 20, y becomes 10

var str1 = "Hello"
var str2 = "World"
swapValues(&str1, &str2) // str1 becomes "World", str2 becomes "Hello"
"""
        )
    ]
),
    
generalContentModel(
    mainImage: "",
    mainTitle: "References : Strong, Weak, Unowned",
    mainDescription: "",
    keywords: [],
    technology: "UIKit",
    viewComponentDescription: [
        DescriptionView(
            
            DImage: "",
            DTitle: "Strong References",
            DDescription: """
            Definition: A strong reference is the default reference type in Swift. It keeps a firm hold on the referred object, ensuring that the object remains in memory as long as the strong reference exists.
            Effect: ARC increases the object's reference count when a strong reference is created. The object will not be deallocated as long as there's at least one strong reference.
            Use Case: Used for ownership relationships where one object needs to own another.
            """,
            
            sampleView: nil,
            
            code: """
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var john = Person(name: "John") // Strong reference to `Person` instance
"""
        ),
        DescriptionView(
            
            DImage: "",
            DTitle: "Weak References",
            DDescription: """
            Definition: A weak reference does not increase the reference count of the object it points to. This means the object can be deallocated even if a weak reference exists.
            Effect: A weak reference is always optional (nil) because it is automatically set to nil when the object is deallocated.
            Use Case: Used for avoiding strong reference cycles, particularly in delegation or parent-child relationships (e.g., a child object references its parent weakly).
            """,
            
            sampleView: nil,
            
            code: """
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\\(name) is being deallocated")
    }
}

class Apartment {
    weak var tenant: Person? // Weak reference to avoid retain cycle
}

var john: Person? = Person(name: "John")
var apartment = Apartment()
apartment.tenant = john // Assign `john` to `tenant`
john = nil // `john` is deallocated here as there are no strong references

"""
        ),
        DescriptionView(
            
            DImage: "",
            DTitle: "3. Unowned References",
            DDescription: """
            Definition: An unowned reference does not increase the reference count of the object. Unlike a weak reference, it is non-optional and assumes that the object it references will not be deallocated while the unowned reference exists.
            Effect: Since it’s non-optional, accessing an unowned reference after the object has been deallocated will result in a runtime crash.
            Use Case: Used when the referenced object has the same or a longer lifecycle, and you’re certain it won’t be nil.

            """,
            
            sampleView: nil,
            
            code: """
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\\(name) is being deallocated")
    }
}

class CreditCard {
    unowned var owner: Person // Unowned reference
    init(owner: Person) {
        self.owner = owner
    }
}

var john: Person? = Person(name: "John")
var card = CreditCard(owner: john!) // Create unowned reference to `john`
john = nil // Deallocates `john`. Accessing `card.owner` now will cause a crash.

"""
        )
    ]
),
    generalContentModel(
        mainImage: "",
        mainTitle: "Memory Management and ARC in Swift",
        mainDescription: "Learn how Swift automatically manages memory using ARC (Automatic Reference Counting), and how to use tools like memory graphs and Instruments to detect leaks.",
        keywords: ["ARC", "memory management", "retain cycle", "strong", "weak", "unowned", "memory leaks"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "What is ARC?",
                DDescription: """
                ARC (Automatic Reference Counting) automatically tracks and manages memory usage for class instances. Each time you create a reference to an object, its reference count increases.
                When the count drops to 0, the memory is freed.
                """,
                sampleView: nil,
                code: """
    class Person {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    var john: Person? = Person(name: "John")
    john = nil // ARC deallocates memory
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Strong Reference Cycles",
                DDescription: "Two class instances holding strong references to each other can cause a memory leak. This is called a strong reference cycle.",
                sampleView: nil,
                code: """
    class Owner {
        var item: Item?
    }

    class Item {
        var owner: Owner?
    }

    var owner = Owner()
    var item = Item()
    owner.item = item
    item.owner = owner // 🚫 Reference cycle
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Avoiding Cycles with weak/unowned",
                DDescription: """
                - Use `weak` for optional, non-owning references (e.g., delegates).
                - Use `unowned` when you're sure the object will never be nil during its lifetime.
                """,
                sampleView: nil,
                code: """
    class Owner {
        var item: Item?
    }

    class Item {
        weak var owner: Owner?
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Tools for Debugging Memory",
                DDescription: """
                Swift and Xcode offer tools to detect memory leaks:
                - Use the **Memory Graph Debugger** (⌘ + I)
                - Use **Instruments → Leaks**
                - Use `deinit` to observe object deallocation
                """,
                sampleView: nil,
                code: """
    class ViewController {
        deinit {
            print("Deallocated!")
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Type Casting in Swift",
        mainDescription: "Swift supports safe and forced type casting using `is`, `as?`, and `as!`. Learn how to check and convert types at runtime.",
        keywords: ["type casting", "is", "as", "as?", "as!", "downcasting", "upcasting"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Checking Type with `is`",
                DDescription: "Use the `is` operator to check whether an instance is of a certain type.",
                sampleView: nil,
                code: """
    let value: Any = "Hello"

    if value is String {
        print("It's a string!")
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Optional Downcasting with `as?`",
                DDescription: "`as?` tries to downcast and returns nil if it fails. This is the safe way to cast.",
                sampleView: nil,
                code: """
    let value: Any = "Swift"

    if let string = value as? String {
        print(string.uppercased()) // Output: SWIFT
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Forced Downcasting with `as!`",
                DDescription: "`as!` forcibly casts the type. It crashes if the cast is invalid — use only when you're sure.",
                sampleView: nil,
                code: """
    let number: Any = 42
    let intValue = number as! Int // Works
    // let fail = number as! String // ❌ Crashes at runtime
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Upcasting to a Common Type",
                DDescription: "You can use `as` to upcast to a superclass or protocol type when needed.",
                sampleView: nil,
                code: """
    class Animal {}
    class Dog: Animal {}

    let dog = Dog()
    let pet: Animal = dog as Animal
    """
            )
        ]
    ),
    generalContentModel(
        mainImage: "",
        mainTitle: "Any and AnyObject in Swift",
        mainDescription: "`Any` and `AnyObject` let you work with values of unknown or mixed types. Learn when and how to use them safely.",
        keywords: ["any", "anyobject", "type erasure", "dynamic type", "type checking"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "`Any` – Any Type",
                DDescription: "`Any` can hold a value of any type — including value and reference types (like `Int`, `String`, `Class`, etc.).",
                sampleView: nil,
                code: """
    let mixed: [Any] = [1, "Hello", true]

    for item in mixed {
        if let str = item as? String {
            print("String: \\(str)")
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "`AnyObject` – Class Types Only",
                DDescription: "`AnyObject` is limited to class instances (reference types). Useful when working with Objective-C APIs or class-only protocols.",
                sampleView: nil,
                code: """
    class Person {
        var name: String
        init(name: String) {
            self.name = name
        }
    }

    let objects: [AnyObject] = [Person(name: "Alice")]
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Use Cases of `Any` and `AnyObject`",
                DDescription: """
                - Use `Any` for handling mixed-type arrays or generic JSON.
                - Use `AnyObject` for class-constrained APIs or dynamic class lists.
                """,
                sampleView: nil,
                code: """
    func printValues(_ items: [Any]) {
        for item in items {
            print(item)
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Downcasting from `Any`",
                DDescription: "To work with values inside `Any`, you must downcast using `as?` or `as!`.",
                sampleView: nil,
                code: """
    let unknown: Any = "Swift"

    if let name = unknown as? String {
        print("Name: \\(name)")
    }
    """
            )
        ]
    ),

    generalContentModel(
        mainImage: "",
        mainTitle: "Access Control in Swift",
        mainDescription: "Access control lets you define the visibility and accessibility of your code elements to enforce encapsulation and module boundaries.",
        keywords: ["access control", "private", "fileprivate", "internal", "public", "open", "encapsulation"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                DImage: "",
                DTitle: "Why Access Control?",
                DDescription: """
                Helps:
                - Hide implementation details
                - Prevent unintended access
                - Enforce modularity
                """,
                sampleView: nil,
                code: """
    class BankAccount {
        private var balance = 0

        func deposit(amount: Int) {
            balance += amount
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "private",
                DDescription: "Accessible only within the same enclosing scope (class, struct, etc.).",
                sampleView: nil,
                code: """
    private var secretCode = "1234"
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "fileprivate",
                DDescription: "Accessible anywhere within the same source file.",
                sampleView: nil,
                code: """
    fileprivate class Logger {
        func log(_ msg: String) {
            print(msg)
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "internal (default)",
                DDescription: "Accessible anywhere in the same module. This is the default access level.",
                sampleView: nil,
                code: """
    struct User {
        var name: String
    } // Accessible throughout the app
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "public",
                DDescription: "Accessible from any module but cannot be subclassed or overridden outside the module.",
                sampleView: nil,
                code: """
    public struct Shape {
        public init() {}
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "open",
                DDescription: "Like `public`, but allows subclassing and overriding from other modules.",
                sampleView: nil,
                code: """
    open class Animal {
        open func speak() {}
    }
    """
            )
        ]
    ),

    generalContentModel(
        mainImage: "",
        mainTitle: "Importing Libraries in Swift",
        mainDescription: "Swift provides various ways to import system frameworks, third-party packages, and modules to organize and reuse code.",
        keywords: ["import", "modules", "frameworks", "third-party libraries", "swift packages"],
        technology: "Swift",
        viewComponentDescription: [

            DescriptionView(
                DImage: "",
                DTitle: "Importing System Frameworks",
                DDescription: "Use `import` to include Apple frameworks like Foundation, UIKit, SwiftUI, etc.",
                sampleView: nil,
                code: """
    import Foundation
    import SwiftUI
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Importing Custom Modules",
                DDescription: "Split your code into modules (target or framework), then import them where needed.",
                sampleView: nil,
                code: """
    // In another file or target
    import MyCustomModule
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Using Swift Package Manager",
                DDescription: "SwiftPM is the native package manager for Swift. Add dependencies via Xcode or `Package.swift`.",
                sampleView: nil,
                code: """
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0")
    ]
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Using CocoaPods",
                DDescription: "A popular dependency manager for Objective-C/Swift projects. Add dependencies via a Podfile.",
                sampleView: nil,
                code: """
    target 'MyApp' do
      use_frameworks!
      pod 'Alamofire', '~> 5.6'
    end
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Using Carthage",
                DDescription: "A lightweight dependency manager. It builds binaries you can drag into Xcode.",
                sampleView: nil,
                code: """
    github "Alamofire/Alamofire" ~> 5.6
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Importing Objective-C Code",
                DDescription: "Use a bridging header to access Objective-C code in Swift.",
                sampleView: nil,
                code: """
    // In Bridging-Header.h
    #import "MyObjectiveCFile.h"
    """
            )
        ]
    ),



generalContentModel(
    mainImage: "",
    mainTitle: "Extensions",
    mainDescription: "Extension allows us to add functionality to existing classes, structure, enumerations or protocol. They provide a way to extend the behaviour of a type",
    keywords: [],
    technology: "Swift",
    viewComponentDescription: [
        DescriptionView(
            
            DImage: "",
            DTitle: "Using extension",
            DDescription: """
            To use extensions, We simply extension followed by classes, structure, enumerations or protocol name
            """,
            
            sampleView: nil,
            
            code: """
class Person {
    
}

extension Person{

}
"""
        ),DescriptionView(
            
            DImage: "",
            DTitle: "Using Extension for different Scenario",
            DDescription: """
            Extensions allow you to add computed properties to existing types.
            """,
            
            sampleView: nil,
            
            code: """
// Computed Property
extension Int {
    var squared: Int {
        return self * self
    }
}

let number = 5
print(number.squared)  // Output: 25

// Adding Methods
extension String {
    func reversedString() -> String {
        return String(self.reversed())
    }
}

let text = "Swift"
print(text.reversedString())  // Output: "tfiwS"

// Adding Initializers
struct Point {
    var x: Double
    var y: Double
}

extension Point {
    init(value: Double) {
        self.x = value
        self.y = value
    }
}

let point = Point(value: 5.0)
print(point)  // Output: Point(x: 5.0, y: 5.0)

4. Adding Subscripts
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

let numbers = [10, 20, 30]
print(numbers[safe: 1] ?? "Out of bounds")  // Output: 20
print(numbers[safe: 5] ?? "Out of bounds")  // Output: Out of bounds

5. Adding Protocol Conformance
protocol Describable {
    func describe() -> String
}

extension Int: Describable {
    func describe() -> String {
        return "The number is \\(self)"
    }
}

print(10.describe())  // Output: The number is 10

6. Adding Nested Types
extension Int {
    enum NumberType {
        case even, odd
    }
    
    var type: NumberType {
        return self % 2 == 0 ? .even : .odd
    }
}

print(7.type)  // Output: odd


"""
        )
    ]
),
    
    
generalContentModel(
    mainImage: "",
    mainTitle: "nil vs NSNull",
    mainDescription: "Nil",
    keywords: [],
    technology: "Swift",
    viewComponentDescription: [
        DescriptionView(
            
            DImage: "",
            DTitle: "nil",
            DDescription: "Represents the absence of a value in optionals",
            sampleView: nil,
            code: """
var name: String? = nil  // name has no value

"""
        ),DescriptionView(
            DImage: "",
            DTitle: "NSNull",
            DDescription: "A class (NSNull) that represents null in collections\nUsed when storing null values in collections",
            
            sampleView: nil,
            
            code: """
let array: [Any] = ["Swift", NSNull(), 42]
print(array)  // Output: ["Swift", <null>, 42]

if array[1] is NSNull {
    print("The second element is NSNull")  // Output: The second element is NSNull
}
"""
        )
    ]
),
    
    generalContentModel(
        mainImage: "",
        mainTitle: "Multithreading, Aysnc, Await in Swift",
        mainDescription: "Swift supports multiple concurrency approaches to handle background work and keep the UI responsive. Learn about GCD, OperationQueue, and Swift Concurrency (async/await).",
        keywords: ["multithreading", "concurrency", "GCD", "async await", "operation queue", "swift threading"],
        technology: "SwiftUI",
        viewComponentDescription: [

            DescriptionView(
                DImage: "",
                DTitle: "Using Grand Central Dispatch (GCD)",
                DDescription: "Use GCD to run tasks in background and update UI on the main thread.",
                sampleView: AnyView(GCDMultiThreading()),
                code: """
    import Foundation
    import SwiftUI

    struct GCDMultiThreading: View {
        @State private var data: String = "Loading..."

        var body: some View {
            VStack {
                Text(data).padding()
                Button("Fetch Data") {
                    fetchDataInBackground()
                }
            }
        }

        func fetchDataInBackground() {
            DispatchQueue.global(qos: .background).async {
                sleep(2)
                let fetchedData = "Data fetched successfully"
                DispatchQueue.main.async {
                    data = fetchedData
                }
            }
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Using async/await",
                DDescription: "Swift’s modern concurrency model with structured `Task` execution and clear `await` points.",
                sampleView: AnyView(asyncAwaitMultiThreading()),
                code: """
    import SwiftUI

    struct asyncAwaitMultiThreading: View {
        @State private var data: String = "Loading..."

        var body: some View {
            VStack {
                Text(data).padding()
                Button("Fetch Data") {
                    Task {
                        await fetchData()
                    }
                }
            }
        }

        func fetchData() async {
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            data = "Data fetched successfully"
        }
    }
    """
            ),

            DescriptionView(
                DImage: "",
                DTitle: "Using OperationQueue",
                DDescription: "`OperationQueue` gives more control over execution and dependencies.",
                sampleView: AnyView(operationQueueMultiThreading()),
                code: """
    import SwiftUI

    struct operationQueueMultiThreading: View {
        @State private var data: String = "Loading..."

        var body: some View {
            VStack {
                Text(data).padding()
                Button("Fetch Data") {
                    fetchDataWithOperationQueue()
                }
            }
        }

        func fetchDataWithOperationQueue() {
            let operationQueue = OperationQueue()
            operationQueue.addOperation {
                sleep(2)
                let fetchedData = "Data fetched successfully"
                OperationQueue.main.addOperation {
                    data = fetchedData
                }
            }
        }
    }
    """
            )
        ]
    )


]
