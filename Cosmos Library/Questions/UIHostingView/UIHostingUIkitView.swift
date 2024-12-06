//
//  UIHostingUIkitView.swift
//  Cosmos Library
//
//  Created by Rahul jha on 25/11/24.
//

import Foundation
import UIKit
import SwiftUI

class UIKitChildViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the SwiftUI view (grandchild)
        let swiftUIView = HelloWorldView()

        // Create UIHostingController to embed SwiftUI inside UIKit
        let hostingController = UIHostingController(rootView: swiftUIView)

        // Add the hostingController as a child view controller
        addChild(hostingController)

        // Add the hostingController's view to the UIKit view hierarchy
        view.addSubview(hostingController.view)

        // Set constraints to make the SwiftUI view fill the parent view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Notify the hostingController that it has been added to the view hierarchy
        hostingController.didMove(toParent: self)
    }
}

struct HelloWorldView: View {
    var body: some View {
        Text("Hello from Child SwiftUI View!")
            .font(.title)
            .foregroundColor(.blue)
            .padding()
    }
}

import SwiftUI

struct UIKitChildView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIKitChildViewController {
        return UIKitChildViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIKitChildViewController, context: Context) {
        // You can update the view controller here if necessary
    }
}
