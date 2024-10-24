//
//  ResumeData.swift
//  Cosmo Library
//
//  Created by Rahul jha on 06/06/24.
//

import Foundation
import SwiftUI


let myExperience : [experienceModel] = [
    experienceModel(companyName: "CodeNicely",
                    companyLogo: "CN",
                    position: "iOS Developer", duration: "06/23 to present",
                    skillkeyword: [
                        idNameModel(id: 1, name: "SwiftUI"),
                        idNameModel(id: 2, name: "UIKit"),
                        idNameModel(id: 3, name: "UI development"),
                        idNameModel(id: 4, name: "Data management"),
                        idNameModel(id: 5, name: "Networking"),
                        idNameModel(id: 6, name: "API requests"),
                        idNameModel(id: 7, name: "Local storage"),
                        idNameModel(id: 8, name: "Keychain Services"),
                        idNameModel(id: 9, name: "Firebase"),
                        idNameModel(id: 10, name: "In-app purchases"),
                        idNameModel(id: 11, name: "Firebase Cloud Messaging"),
                        idNameModel(id: 12, name: "User permissions"),
                        idNameModel(id: 13, name: "CocoaPods"),
                        idNameModel(id: 14, name: "App Store Connect"),
                        idNameModel(id: 15, name: "Xcode")
                    ],
                    Description: [
                        "• Developed and shipped native iOS applications using SwiftUI and UIKit.",
                        "• Built user interfaces:",
                        "  - Streamlined app launch process by optimising initial view setup.",
                        "  - Created reusable custom SwiftUI components for efficient UI development.",
                        "  - Implemented user-friendly banners and UIs for UIKit projects.",
                        "• Implemented robust data management and networking solutions:",
                        "  - Handled API requests for data retrieval in both SwiftUI and UIKit apps, ensuring data integrity.",
                        "  - Utilised local storage and Keychain Services for secure data storage.",
                        "  - Integrated Firebase for analytics and notifications.",
                        "• Enhanced app functionality with advanced features:",
                        "  - Implemented StoreKit purchases for seamless in-app purchases.",
                        "  - Handled various notification types (silent and in-app) using Firebase Cloud Messaging to deliver timely updates.",
                        "  - Managed user permissions for features like location access and photos, ensuring user privacy.",
                        "• Leveraged CocoaPods for efficient third-party library integration.",
                        "• Managed App Store Connect to publish updates and launched fresh app independently."
                    ])

    ]
let myEducation : [experienceModel] = [
    experienceModel(companyName: "Rungta College Of Engineering & Technology",
                    companyLogo: "college",
                    position: "B.TECH CSE, CPI 8.75",
                    duration: "08/19 to 06/23",
                    skillkeyword: [],
                    Description: [])

]
let myCompanyProjects : [experienceModel] = [
    experienceModel(companyName: "SteelLive",
                    companyLogo: "SL",
                    position: "Technology : SwiftUI",
                    duration: "",
                    skillkeyword: [],
                    Description: ["Independently built the user interface and managed launch of SteelLive, a B2B platform for the steel industry. Managed the app store listing process and certificates, ensuring a smooth rollout for users.\n",
                                  "Integrated key functionalities: Implemented Firebase Cloud Messaging (FCM) for real-time communication, in-app purchases for a monetization strategy, and Keychain for secure data storage.\n",
                                  "Ensured secure and user-friendly experience: Managed API integrations for seamless data exchange, implemented user permissions for data control, and prioritized user experience throughout development.\n"]),
    experienceModel(companyName: "HealthPotli",
                    companyLogo: "HP",
                    position: "Technology : UIKit",
                    duration: "",
                    skillkeyword: [],
                    Description: ["Order Meds Online: HealthPotli offers a convenient app to order medicines and healthcare products for delivery, including prescriptions and over-the-counter options.\n",
                                  "Independently developing and launching new modules: This included implementing a cashback functionality and guest user login system. These features aim to improve user experience and potentially attract new users.\n",
                                  "Managing bug fixes and app updates: I ensured a smooth user experience by identifying and resolving bugs, as well as managing the launch of updates for the app. This involves maintaining app stability and functionality.\n"]),
    experienceModel(companyName: "GimBooks",
                    companyLogo: "GB",
                    position: "Technology : UIKit",
                    duration: "",
                    skillkeyword: [],
                    Description: ["GST Invoice Manager provides an Easy way to create Invoices and manage accounts. You can create and manage invoices, e-invoices, e-waybills, quotations. etc.\n",
                                  "The development process prioritizes pixel-perfect design, ensuring every element within the GimBooks app is visually stunning and intuitive for users.\n",
                                  "Working alongside experienced developers, I honed my skills in writing clean, efficient, and maintainable code of industry's best practices. Which improves the app's stability, performance, and long-term scalability.\n"]),
    experienceModel(companyName: "Cosmo Library",
                    companyLogo: "applogoimg",
                    position: "Technology : SwiftUI",
                    duration: "",
                    skillkeyword: [],
                    Description: ["Cosmo Library is personal project aimed to make a collection of commonly used functions and custom components\n",
                                  "It have various custom components and system components which makes development times faster by several folds\n"
                                 ])
    
    
]
struct experienceModel {
    let companyName : String
    let companyLogo : String
    let position : String
    let duration : String
    let skillkeyword : [idNameModel]
    let Description : [String]
}

