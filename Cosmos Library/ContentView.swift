//
//  ContentView.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 18/08/24.
//

import SwiftUI

#Preview {
    TestView()
}

import SwiftUI

struct TestView: View {
    var body: some View {
        Grid {
            ForEach(0..<10) { row in
                GridRow {
                    Text("Hello")
                    Text("work")
                }
                
            }
        }
        Grid {
            ForEach(0..<10) { row in
                GridRow {
                    ForEach(0..<3) { column in
                        Text("Row \(row), Col \(column)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(row % 2 == 0 ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                }
            }
        }
        .padding()
    }
}

