//
//  BalancedChips.swift
//  Cosmo Library
//
//  Created by Rahul jha on 06/06/24.
//

import Foundation
import SwiftUI
struct idNameModel: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
}

struct BalancedChips: View {
    let myArray: [idNameModel]
    let numberOfStacks: Int
    
    var body: some View {
        VStack {
            ForEach(0..<numberOfStacks, id: \.self) { index in
                HStack {
                    ForEach(splitWordsEvenly(array: myArray, into: numberOfStacks)[index], id: \.id) { item in
                        Text(item.name)
                            .modifier(paddedOverlay(paddingAmount: 8))
                    }
                    Spacer()
                }.padding(.horizontal,1)
            }
        }
    }
    
    func splitWordsEvenly(array: [idNameModel], into parts: Int) -> [[idNameModel]] {
        let sortedArray = array.sorted(by: { $0.name.count > $1.name.count }) // Sort by word length
        
        var buckets: [[idNameModel]] = Array(repeating: [], count: parts)
        
        for word in sortedArray {
            let shortestBucket = buckets.min { $0.reduce(0) { $0 + $1.name.count } < $1.reduce(0) { $0 + $1.name.count } } ?? []
            buckets[buckets.firstIndex(of: shortestBucket) ?? 0].append(word)
        }
        
        return buckets
    }
}


