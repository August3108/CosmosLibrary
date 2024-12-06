//
//  NetworkRecall.swift
//  Cosmos Library
//
//  Created by Rahul jha on 26/11/24.
//

import Foundation
import Security

/// All the network calls are managed in URLSession which is part of combine
import Combine
import SwiftUI

class NetworkManagerCombineSample {
    var cancellables = Set<AnyCancellable>()

    func fetchData(from url: URL) {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data } // map because it extracts data from Tuple (data: Data, response: URLResponse)
        //
            .decode(type: pickerInputStruct.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in // excutes closure emitted by publisher
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { value in
                print("Received value: \(value)")
            })
            .store(in: &cancellables)
    }
}

func handleRequestsInUrl(){
    if let url = URL(string:"url"){
        // adding Http method
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // adding query
        request.url?.append(queryItems: [URLQueryItem(name: "key", value: "Value")])
        
        // adding body
        request.httpBody = "body".data(using: .utf8)
        
        // adding header
        request.addValue("value", forHTTPHeaderField: "key")
        
        // calling api
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
        }
    }
    
    func hostingView(){ // call this in view did load
        let swiftUIView = HelloWorldView()
        
        // Create UIHostingController to embed SwiftUI inside UIKit
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the hostingController as a child view controller
        // addChild(hostingController)
        
        // Add the hostingController's view to the UIKit view hierarchy
        // view.addSubview(hostingController.view)
        // after which we can define constraints and add view
        //        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
        //            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        //            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        //        ])
        
    }
    func manageStorage(){
        // UserDefaults: For storing simple user settings.
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
    }
    func saveAccessToken(accessToken : String) {
        
        let accessTokenData = Data(accessToken.utf8)
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "tokenPassword",
            kSecValueData as String: accessTokenData
        ]
        SecItemDelete(query as CFDictionary) // Delete any existing item
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Error saving access token to keychain")
            return
        }
        
        loadAccessToken()
    }
    
    func loadAccessToken() {
        print("loading AccessToken")
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "tokenPassword",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess, let accessTokenData = item as? Data, let savedAccessToken = String(data: accessTokenData, encoding: .utf8) else {
            print("Error loading access token from keychain")
            return
        }
//        print("AccessToken loaded:", savedAccessToken)
    }

    func registerForPush(application: UIApplication) {
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult)-> Void) {
        //silent and remote notification
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //displaynotification
        completionHandler([[.badge, .banner, .list, .sound]])
    }
    // HANDLE NOTIFICATION TAP
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
    /// .gesture(
    ///         DragGesture()
    ///         .onEnded{ drag in
    /// check if abs value in higher or lower drag.translation.width
    ///         }
    ///    )
}



/// create a datamodel
/// NspersistentContainer(named: fileNameOfDataModel)
/// 

let gridViewSample = Grid {
    ForEach(0..<10) { row in
        GridRow {
            Text("Hello")
            Text("work")
        }
        
    }
}

let geometryViewSample = AnyView(
    GeometryReader{reader in
        Text("Hello")
        .frame(width: reader.size.width * 0.5)
    }
)
struct viewBuilderSample<Content: View > : View {
    @ViewBuilder let content: Content
    @Environment(\.colorScheme) private var colorScheme // check app mode
    @SceneStorage("username") private var username: String = ""
    var body: some View {
        Text("Hello, World!")
        CoreGraphicsPreview()
        CoreAnimationView()
        /// first we define vat opacityAnimation = CABasicAnimation(key:"opacity") // key is defined in system
        /// next we define fromValue and toValue
        /// next we define
        /// then we create a
        // core graphics utilises path to make shapes which does not loose resolutions
        matchedGeometrySample()
    }
}

