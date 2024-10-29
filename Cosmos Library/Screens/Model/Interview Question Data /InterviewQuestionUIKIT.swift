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
