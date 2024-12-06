//
//  InterviewQuestionUIKIT.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 28/10/24.
//

import Foundation
import SwiftUI

let UIKITQuestionArray = [
    generalContentModel(
    id: 135,
    mainImage: "",
    mainTitle: "Different ways to dismiss keyboard in UIKit",
    mainDescription: "",
    keywords: [],
    technology: "UIKit",
    viewComponentDescription: [
                  DescriptionView(
                      id: 1,
                      DImage: "",
                      DTitle: "Using resignFirstResponder on the Text Field",
                      DDescription: "This is the simplest way to dismiss the keyboard programmatically. Call resignFirstResponder() on the active text field.",
                      sampleView: nil,
                      code: """
      textField.resignFirstResponder()
      """
                  ),
                  DescriptionView(
                      id: 2,
                      DImage: "",
                      DTitle: "End Editing on View",
                      DDescription: "Use endEditing(true) on the parent view to dismiss the keyboard from any active text field within that view.",
                      sampleView: nil,
                      code: """
      view.endEditing(true)
      """
                  ),
                  DescriptionView(
                      id: 3,
                      DImage: "",
                      DTitle: "Tap Gesture on View",
                      DDescription: "Add a tap gesture recognizer to the view, which calls endEditing(true) to dismiss the keyboard when the view is tapped.",
                      sampleView: nil,
                      code: """
      override func viewDidLoad() {
          super.viewDidLoad()

          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          view.addGestureRecognizer(tapGesture)
      }

      @objc func dismissKeyboard() {
          view.endEditing(true)
      }
      """
                  ),
                  DescriptionView(
                      id: 4,
                      DImage: "",
                      DTitle: "UITextFieldDelegate - textFieldShouldReturn",
                      DDescription: "Implement the textFieldShouldReturn method to dismiss the keyboard when the return key is tapped.",
                      sampleView: nil,
                      code: """
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
      """
                  ),
                  DescriptionView(
                      id: 5,
                      DImage: "",
                      DTitle: "NSNotification for Keyboard",
                      DDescription: "Listen for keyboard hide notifications to take actions related to dismissing the keyboard programmatically.",
                      sampleView: nil,
                      code: """
      NotificationCenter.default.addObserver(
          self, 
          selector: #selector(dismissKeyboard), 
          name: UIResponder.keyboardWillHideNotification, 
          object: nil
      )

      @objc func dismissKeyboard() {
          view.endEditing(true)
      }
      """
                  )
              ]
          ),
    generalContentModel(
           id: 72,
           mainImage: "",
           mainTitle: "How do you implement a UICollectionView with a custom cell in UIKit?",
           mainDescription: "",
           keywords: [],
           technology: "UIKit",
           viewComponentDescription: [
               DescriptionView(
                   id: 1,
                   DImage: "",
                   DTitle: "Implementing UICollectionView with Custom Cell",
                   DDescription: "This example shows how to set up a UICollectionView with a custom cell using delegate and data source methods.",
                   sampleView: AnyView(
                       VStack {
                           Text("UICollectionView Custom Cell Example")
                       }
                   ),
                   code: """
   class MultiSelectMenu : UIViewController {
       @IBOutlet var menuActionCollectionView: UICollectionView!
       var menuElements: [[CommonMenuActionCellModel]] = [] // Data source for collection view cells

       override func viewDidLoad() {
           super.viewDidLoad()
           setupCollectionView() // Set up collection view properties
       }

       // Sets up the collection view with delegate, data source, and registration of the custom cell
       func setupCollectionView() {
           menuActionCollectionView.delegate = self
           menuActionCollectionView.dataSource = self
           menuActionCollectionView.backgroundColor = .white
           menuActionCollectionView.register(UINib(nibName: "CommonMenuActionCell", bundle: nil), forCellWithReuseIdentifier: "CommonMenuActionCell")
           menuActionCollectionView.isScrollEnabled = false // Disables scrolling
       }
   }

   extension MultiSelectMenu: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       
       // Returns the number of sections in the collection view, based on the outer array's count
       func numberOfSections(in collectionView: UICollectionView) -> Int {
           return menuElements.count
       }

       // Returns the number of items in each section, based on the inner array's count for the given section
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return menuElements[section].count
       }

       // Configures each cell with data and returns it for display
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommonMenuActionCell", for: indexPath) as! CommonMenuActionCell
           let element = menuElements[indexPath.section][indexPath.item]
           cell.setupCell(
               menu: element.menu,
               action: element.action,
               rightIconImg: element.rightIconImg,
               rightIconColor: element.rightIconColor,
               leftIconImg: element.leftIconImg,
               leftIconColor: element.leftIconColor,
               title: element.title,
               titleColor: element.titleColor, 
               height: menuActionCellHeight
           )
           return cell
       }

       // Specifies the size of each cell in the collection view
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           if let width = w {
               let cellWidth = (Int(width) / menuElements[indexPath.section].count) - 5 // Calculate width based on view width and cell count
               return CGSize(width: cellWidth, height: 40)
           }
           return CGSize(width: 70, height: 40) // Default size if width is nil
       }

       // Sets insets (padding) around each section in the collection view
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return menuActionCellPadding
       }

       // Specifies the minimum spacing between items in the same row of the collection view
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 5
       }

       // Specifies the minimum spacing between rows in the collection view
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 5
       }
   }
   """
               )
           ]
       ), generalContentModel(
        id: 127,
        mainImage: "",
        mainTitle: "What are layoutMargins, and how do they differ from constraints in UIKit?",
        mainDescription: "",
        keywords: ["UIKit", "layoutMargins", "constraints"],
        technology: "UIKit",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Understanding layoutMargins and Constraints",
                DDescription: """
    layoutMargins are insets around the edges of a view, providing padding to adjust content spacing from the view’s bounds. \n\nConstraints, on the other hand, are explicit rules that control the position, size, and relationships between views. \n\nWhile layoutMargins set spacing within a view’s edges, constraints define specific relationships between views to manage layout across the interface.
    """,
                sampleView: AnyView(
                    VStack {
                        Text("Using layoutMargins and Constraints Example")
                    }
                ),
                code: """
    class LayoutExampleViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Example of layoutMargins
            let containerView = UIView()
            containerView.backgroundColor = .lightGray
            containerView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            
            let label = UILabel()
            label.text = "This label is inset by layoutMargins."
            label.numberOfLines = 0
            label.textAlignment = .center
            label.backgroundColor = .white
            containerView.addSubview(label)
            
            // Using layoutMarginsGuide for padding within containerView
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor),
                label.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor),
                label.bottomAnchor.constraint(equalTo: containerView.layoutMarginsGuide.bottomAnchor)
            ])
            
            view.addSubview(containerView)
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            // Using constraints to position containerView in the center of the screen
            NSLayoutConstraint.activate([
                containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                containerView.heightAnchor.constraint(equalToConstant: 150)
            ])
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 91,
        mainImage: "",
        mainTitle: "How do you handle the lifecycle of a UIViewController in UIKit?",
        mainDescription: "In UIKit, view controllers are essential for managing a screen of content. They encapsulate the logic for a view and its behavior, allowing developers to control how views appear and respond to user interactions. Each view controller manages a view hierarchy and facilitates transitions between different screens. Understanding the lifecycle of a UIViewController is crucial for efficient resource management, ensuring that views are loaded, updated, and released correctly during the app's execution. This knowledge helps in implementing smooth user experiences and optimizing performance.",
        keywords: ["UIKit", "UIViewController", "Lifecycle"],
        technology: "UIKit",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "init",
                DDescription: """
    This initializer is called when an instance of the view controller is created programmatically. It's used for initial setup.
    """,
                sampleView: nil,
                code: """
    override init() {
        super.init(nibName: nil, bundle: nil)
        print("0 - init") // Called first
    }
    """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "required init(coder:)",
                DDescription: """
    This initializer is required when using Storyboards. It sets up the view controller from the storyboard and must be implemented when subclassing.
    """,
                sampleView: nil,
                code: """
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "loadView",
                DDescription: """
    This method is called when the view controller's view is about to be created. It’s where you create your custom view hierarchy.
    """,
                sampleView: nil,
                code: """
    override func loadView() {
        super.loadView()
        print("1 - loadView") // Custom view hierarchy setup
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "viewDidLoad",
                DDescription: """
    This method is called when the view is loaded into memory. It's a good place to perform any additional setup required for the view.
    """,
                sampleView: nil,
                code: """
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2 - viewDidLoad") // Setup UI elements and load data
    }
    """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "viewWillAppear",
                DDescription: """
    This method is called just before the view is added to the window. It is used to prepare the view for display, such as updating UI elements with the latest data.
    """,
                sampleView: nil,
                code: """
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("3 - viewWillAppear") // Update UI before the view appears
    }
    """
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "viewWillLayoutSubviews",
                DDescription: """
    This method is called before the view controller's view lays out its subviews. It is useful for updating layout constraints or view frames.
    """,
                sampleView: nil,
                code: """
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("5 - viewWillLayoutSubviews") // Prepare layout before subviews are laid out
    }
    """
            ),
            DescriptionView(
                id: 7,
                DImage: "",
                DTitle: "viewDidLayoutSubviews",
                DDescription: """
    This method is called after the view controller's view has laid out its subviews. It is useful for additional adjustments to the layout.
    """,
                sampleView: nil,
                code: """
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("6 - viewDidLayoutSubviews") // Additional layout adjustments after subviews are laid out
    }
    """
            ),
            DescriptionView(
                id: 8,
                DImage: "",
                DTitle: "viewDidAppear",
                DDescription: """
    This method is called after the view has appeared on the screen. Use this for starting animations, timers, or tracking user interactions.
    """,
                sampleView: nil,
                code: """
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("4 - viewDidAppear") // Start animations or analytics tracking
    }
    """
            ),
            DescriptionView(
                id: 9,
                DImage: "",
                DTitle: "viewWillDisappear",
                DDescription: """
    This method is called before the view is removed from the screen. It's a good place to save data or stop ongoing processes that should pause when the view goes away.
    """,
                sampleView: nil,
                code: """
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("7 - viewWillDisappear") // Save data or stop animations
    }
    """
            ),
            DescriptionView(
                id: 10,
                DImage: "",
                DTitle: "viewDidDisappear",
                DDescription: """
    This method is called after the view has been removed from the screen. Use this to clean up resources or stop any processes that should not continue in the background.
    """,
                sampleView: nil,
                code: """
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("8 - viewDidDisappear") // Release resources
    }
    """
            ),
            DescriptionView(
                id: 11,
                DImage: "",
                DTitle: "deinit",
                DDescription: """
    This method is called just before the view controller is deallocated. It’s the last chance to clean up any resources or perform final tasks.
    """,
                sampleView: nil,
                code: """
    deinit {
        print("9 - deinit") // Called when the view controller is deallocated
    }
    """
            )
        ]
    ), generalContentModel(
        id: 92,
        mainImage: "",
        mainTitle: "How do you implement pull-to-refresh functionality in a UITableView?",
        mainDescription: "",
        keywords: ["UITableView", "UIRefreshControl", "Pull-to-Refresh"],
        technology: "UIKit",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Setup UITableView",
                DDescription: """
    In this step, we set up the UITableView and initialize the data source. This includes registering any custom cells if needed.
    """,
                sampleView: nil,
                code: """
    class RefreshableTableViewController: UIViewController {
        @IBOutlet var tableView: UITableView!
        var data: [String] = [] // Sample data

        override func viewDidLoad() {
            super.viewDidLoad()
            setupTableView()
            loadData()
        }

        func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        func loadData() {
            // Load your data here
            data = ["Item 1", "Item 2", "Item 3"]
            tableView.reloadData()
        }
    }
    """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Adding UIRefreshControl",
                DDescription: """
    Create and add a UIRefreshControl to the table view. This control will trigger the refresh action when the user pulls down on the table view.
    """,
                sampleView: nil,
                code: """
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        loadData()
    }
    """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Implementing the Refresh Method",
                DDescription: """
    This method is called when the user pulls down to refresh. It performs the data fetching or refreshing logic and ends the refreshing animation.
    """,
                sampleView: nil,
                code: """
    @objc func refreshData() {
        // Simulate data loading with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadData() // Reload your data
            self.tableView.refreshControl?.endRefreshing() // End refreshing
        }
    }
    """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "UITableView Data Source Methods",
                DDescription: """
    Implement the required UITableViewDataSource methods to display the data in the table view.
    """,
                sampleView: nil,
                code: """
    extension RefreshableTableViewController: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = data[indexPath.row]
            return cell
        }
    }
    """
            )
        ]
    ),
    generalContentModel(
        id: 2001,
        mainImage: "",
        mainTitle: "Strong, Weak and Unowned",
        mainDescription: "",
        keywords: ["Important, UIKit, Memory Management"],
        technology: "UIKit",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "Strong Reference",
                DDescription: """
                1. Ownership: A strong reference means an object will stay in memory as long as there's a strong reference to it.
                2. Default Behavior: In Swift, references are strong by default unless specified otherwise.
                3. Memory Management: As long as there’s a strong reference, the object will not be deallocated.
                4. Retain Cycles: Can lead to memory leaks if two objects strongly reference each other (a retain cycle).
                5. Deallocation: When a view controller or object holding a strong reference is deallocated, the object is also deallocated if no other strong references exist.
                6. If house is deallocated, the strong reference to Person (owner) would also be released. However, if there's another strong reference to the same Person instance elsewhere, it will not be deallocated until all strong references are removed.
                """,
                
                sampleView: nil,
                
                code: """
    class Person {
        var name: String
        init(name: String) {
            self.name = name
        }
    }

    class House {
        var owner: Person? // Strong reference to `Person`
    }

    let house = House()
    house.owner = Person(name: "Alice") // `house.owner` keeps `Person` in memory

    """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "Weak Reference",
                DDescription: """
                1. No Ownership: A weak reference does not own the object it points to, meaning it doesn’t keep the object in memory.
                2. Automatic nil Assignment: When the referenced object is deallocated, a weak reference automatically becomes nil.
                3. Optional by Nature: Weak references must always be optional (nil), as they can lose their object at any time.
                4. Preventing Retain Cycles: Commonly used in situations like delegates to avoid retain cycles.
                5. Deallocation: The object will be deallocated if no other strong references exist, even if weak references still point to it.
                6. When the Teacher instance has no more strong references, it will be deallocated, and classroom.teacher will automatically become nil. When the view closes, any remaining strong references to Teacher will be released, and if there are no strong references, Teacher will be deallocated, leaving teacher as nil.
                """,
                
                sampleView: nil,
                
                code: """
    class Teacher {
        var name: String
        init(name: String) {
            self.name = name
        }
    }

    class Classroom {
        weak var teacher: Teacher? // Weak reference to `Teacher` to avoid retain cycle
    }

    let classroom = Classroom()
    classroom.teacher = Teacher(name: "Mr. Smith") // `teacher` points to `Teacher` weakly

    """
            ),
            
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "Unowned Reference",
                DDescription: """
                1. Non-Optional Reference: An unowned reference assumes that the object it points to will never become nil once set.
                2. No Ownership: Like weak references, unowned references do not retain the object.
                3. Non-Optional Requirement: Unlike weak references, unowned references cannot be nil; they are non-optional.
                4. Stable Relationships: Commonly used when one object has a guaranteed dependent lifecycle on another (e.g., a Customer and their CreditCard).
                5. Runtime Crash on Deallocation: If the referenced object is deallocated and an unowned reference tries to access it, the app will crash with a runtime error.
                6. What Happens on View Closure: If customer is deallocated, card.customer will point to deallocated memory, and accessing customer in CreditCard will cause a runtime crash. Therefore, unowned references are safe only when you are certain the referenced object will outlive or live as long as the object containing the unowned reference.
                """,
                
                sampleView: nil,
                
                code: """
    class Teacher {
        var name: String
        init(name: String) {
            self.name = name
        }
    }

    class Classroom {
        weak var teacher: Teacher? // Weak reference to `Teacher` to avoid retain cycle
    }

    let classroom = Classroom()
    classroom.teacher = Teacher(name: "Mr. Smith") // `teacher` points to `Teacher` weakly

    """
            )
        ]
    ),generalContentModel(
        id: 2002,
        mainImage: "",
        mainTitle: "Memory Management, Leaks",
        mainDescription: "The best shortest way to find memory leak is by using breakpoint. Create a symbollic breakpoint and put UIViewcontroller dealloc method in it. it will trigger breakpoint when its deallocated",
        keywords: [],
        technology: "UIKit",
        viewComponentDescription: [
        ]
    ),
    generalContentModel(
        id: 2003,
        mainImage: "",
        mainTitle: "Understanding Async/Await in Swift",
        mainDescription: "This tutorial explores the async/await syntax in Swift, a powerful feature for simplifying asynchronous code and enhancing your Swift applications.\n in symbol : use the action log message to consol  with --- dealloc @(id)[$arg1 description]@ @(id)[$arg1 title]@",
        keywords: ["async", "await", "Swift", "Concurrency", "Asynchronous Programming", "Error Handling", "Task Groups"],
        technology: "Swift",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Key Concepts",
                DDescription: "Let's dive into the core ideas behind async/await in Swift.",
                sampleView: nil,
                code: """
                // async Functions:
                func fetchData() async throws -> Data {
                    // ... (Asynchronous operation)
                }

                // await Keyword:
                let data = try await fetchData()

                // Concurrency:
                Task {
                    // ... (Asynchronous code)
                }

                // Structured Concurrency:
                // Tasks automatically canceled when no longer needed

                // Error Handling:
                do {
                    let data = try await fetchData()
                } catch {
                    // Handle errors
                }
                """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Example: Fetching Data from an API",
                DDescription: "Let's see how async/await makes asynchronous API calls more readable and manageable.",
                sampleView: nil,
                code: """
                // Without async/await (Callback Approach)
                func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
                    URLSession.shared.dataTask(with: URL(string: "https://api.example.com/data")!) { data, response, error in
                        if let error = error {
                            completion(.failure(error))
                            return
                        }
                        completion(.success(data!))
                    }.resume()
                }

                fetchData { result in
                    switch result {
                    case .success(let data):
                        print("Data received: \\(data)")
                    case .failure(let error):
                        print("Error: \\(error)")
                    }
                }

                // With async/await
                func fetchData() async throws -> Data {
                    let url = URL(string: "https://api.example.com/data")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    return data
                }

                Task {
                    do {
                        let data = try await fetchData()
                        print("Data received: \\(data)")
                    } catch {
                        print("Error: \\(error)")
                    }
                }
                """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Using async/await in View Controllers",
                DDescription: "Here's how to incorporate async/await into SwiftUI or UIKit view controllers.",
                sampleView: nil,
                code: """
                class MyViewController: UIViewController {
                    override func viewDidLoad() {
                        super.viewDidLoad()
                        
                        Task {
                            do {
                                let data = try await fetchData()
                                // Update UI on the main thread if necessary
                                DispatchQueue.main.async {
                                    // Update UI with the fetched data
                                }
                            } catch {
                                print("Error fetching data: \\(error)")
                            }
                        }
                    }
                }
                """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Benefits of async/await",
                DDescription: "Let's highlight the advantages of using async/await in Swift.",
                sampleView: nil,
                code: """
                // Improved Readability
                // Error Handling
                // Concurrency Management
                """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Additional async/await Patterns",
                DDescription: "Explore more advanced async/await techniques.",
                sampleView: nil,
                code: """
                // Parallel Asynchronous Calls
                async let data1 = fetchData(from: url1)
                async let data2 = fetchData(from: url2)

                let (result1, result2) = await (data1, data2)

                // Task Groups
                await withTaskGroup(of: Data.self) { group in
                    for url in urls {
                        group.addTask {
                            try await fetchData(from: url)
                        }
                    }
                }
                """
            ),
            DescriptionView(
                id: 6,
                DImage: "",
                DTitle: "6. Summary",
                DDescription: "Async/await is a powerful tool for working with asynchronous code in Swift, making your code more readable, efficient, and maintainable.",
                sampleView: nil,
                code: """
                // ... (Summary)
                """
            )
        ]
    ),
    generalContentModel(
        id: 1,
        mainImage: "",
        mainTitle: "Understanding Frame and Bounds in UIKit",
        mainDescription: "This tutorial explains the key differences between `frame` and `bounds` properties in UIKit, two fundamental concepts for positioning and sizing views.",
        keywords: ["frame", "bounds", "UIView", "UIKit", "positioning", "sizing", "coordinate system", "transformations"],
        technology: "UIKit",
        viewComponentDescription: [
            DescriptionView(
                id: 1,
                DImage: "",
                DTitle: "1. Frame",
                DDescription: "The `frame` property describes the view's location and size relative to its superview's coordinate system.",
                sampleView: nil,
                code: """
                // Creating a UIView
                let view = UIView()

                // Setting the frame
                view.frame = CGRect(x: 50, y: 100, width: 200, height: 100) 

                // Explanation:
                // - x: 50 points from the left edge of the superview
                // - y: 100 points from the top edge of the superview
                // - width: 200 points
                // - height: 100 points 
                """
            ),
            DescriptionView(
                id: 2,
                DImage: "",
                DTitle: "2. Bounds",
                DDescription: "The `bounds` property describes the view's location and size in its own coordinate system (not its superview's).",
                sampleView: nil,
                code: """
                let view = UIView()

                // Setting the bounds
                view.bounds = CGRect(x: 0, y: 0, width: 200, height: 100)

                // Explanation:
                // - x: 0 (default origin within the view's coordinate system)
                // - y: 0
                // - width: 200 points
                // - height: 100 points
                """
            ),
            DescriptionView(
                id: 3,
                DImage: "",
                DTitle: "3. Key Differences",
                DDescription: "Let's summarize the key differences between `frame` and `bounds`.",
                sampleView: nil,
                code: """
                // Coordinate System:
                // - frame: Superview's coordinate system
                // - bounds: View's own coordinate system

                // Positioning:
                // - frame: Includes the view's position in the superview
                // - bounds: Typically has an origin of (0, 0)

                // Changing Origin:
                // - bounds.origin: Shifts the view's content without moving the view itself
                // - frame.origin: Changes the view's position relative to its superview

                // Transformations:
                // - frame: Changes with rotations or scaling to reflect new size/position
                // - bounds: Size remains the same, but internal layout adjusts
                """
            ),
            DescriptionView(
                id: 4,
                DImage: "",
                DTitle: "4. Example: Modifying `bounds.origin`",
                DDescription: "This example demonstrates how changing `bounds.origin` affects the view's content without altering its position in the superview.",
                sampleView: nil,
                code: """
                // Shifting the content within the view
                view.bounds.origin = CGPoint(x: 50, y: 50)

                // Explanation:
                // - The content of the view will shift 50 points left and 50 points up
                // - The view itself remains at the same position relative to its superview
                """
            ),
            DescriptionView(
                id: 5,
                DImage: "",
                DTitle: "5. Summary",
                DDescription: "Understanding the distinction between `frame` and `bounds` is crucial when working with transformations, animations, and complex layouts in UIKit.",
                sampleView: nil,
                code: """
                // frame:  Used for positioning and sizing the view relative to its superview.
                // bounds: Used for positioning and sizing the content within the view itself.
                """
            )
        ]
    )

    

    
    
    
    
    
    ]

let tempUOKIT = generalContentModel(
    id: 18,
    mainImage: "",
    mainTitle: " ",
    mainDescription: "T",
    keywords: [],
    technology: "SwiftUI",
    viewComponentDescription: [
        DescriptionView(
            id: 1,
            DImage: "",
            DTitle: "",
            DDescription: "",
            
            sampleView: AnyView(
                VStack {
                }
            ),
            
            code: """
"""
        )
    ]
)
