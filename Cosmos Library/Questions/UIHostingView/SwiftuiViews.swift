//
//  SwiftuiViews.swift
//  Cosmos Library
//
//  Created by Rahul jha on 25/11/24.
//

import Foundation
import SwiftUI

struct ParentSwiftUIView: View {
    var body: some View {
        VStack {
            Text("Parent SwiftUI View")
                .font(.largeTitle)
                .padding()

            // Embedding UIKit View (Child UIKit View)
            UIKitChildView()
                .frame(height: 300)
        }
    }
}

#Preview {
    ParentSwiftUIView()
}
