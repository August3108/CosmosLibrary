// creates chip to select input

import SwiftUI

struct ChipsInputStruct: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
}

struct ChipGroup: View {
    @Binding var selectedChips: [Int] 
    let chips: [ChipsInputStruct]
    let allowMultipleSelection: Bool
    var isSelectMarketView : Bool = false
    let numberOfStacks = 3 // split is 3 lines when isSelectMarketView
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            if isSelectMarketView{
                ScrollView(.horizontal, showsIndicators: false){

                    ForEach(0..<numberOfStacks, id: \.self) { index in
                        HStack {
                            ForEach(splitWordsEvenly(array: chips, into: numberOfStacks)[index], id: \.id) { chip in
                                createChipView(chip: chip)
                                
                            }
                            Spacer()
                        }.padding(.horizontal,1)
                    }
                    
                }
            }
            else {
                let rows = divideIntoRows(chips: chips, availableWidth: AppConstants.AppScreenWidth)
                ForEach(rows, id: \.self) { rowChips in
                    HStack(spacing: 8) {
                        
                        ForEach(rowChips, id: \.id) { chip in
                            createChipView(chip: chip)
                        }.multilineTextAlignment(.center)
                        
                    }
                }
            }
        }
    }

    private func createChipView(chip: ChipsInputStruct) -> some View {
        Button(action: {
            toggleSelection(chip.id)
        }) {
            Text("\(chip.name)")
                .foregroundColor(selectedChips.contains(chip.id) ? .white : .black)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(selectedChips.contains(chip.id) ? Color.blue : Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(selectedChips.contains(chip.id) ? Color.blue : Color.gray, lineWidth: 0.2)
                )
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle()) // Remove button highlighting
    }

    private func divideIntoRows(chips: [ChipsInputStruct], availableWidth: CGFloat) -> [[ChipsInputStruct]] {
        var rows: [[ChipsInputStruct]] = []
        var currentRowChips: [ChipsInputStruct] = []
        var currentRowWidth: CGFloat = 0

        for chip in chips {
            let chipWidth = calculateTextWidth(text: chip.name) + 40 // Add padding to chip width
            if currentRowWidth + chipWidth <= availableWidth {
                currentRowChips.append(chip)
                currentRowWidth += chipWidth
            } else {
                rows.append(currentRowChips)
                currentRowChips = [chip]
                currentRowWidth = chipWidth
            }
        }

        if !currentRowChips.isEmpty {
            rows.append(currentRowChips)
        }

        return rows
    }
    
    // equally divides into rows
    func splitWordsEvenly(array: [ChipsInputStruct], into parts: Int) -> [[ChipsInputStruct]] {
        let sortedArray = array.sorted(by: { $0.name.count > $1.name.count }) // Sort by word length
        
        var buckets: [[ChipsInputStruct]] = Array(repeating: [], count: parts)
        
        for word in sortedArray {
            let shortestBucket = buckets.min { $0.reduce(0) { $0 + $1.name.count } < $1.reduce(0) { $0 + $1.name.count } } ?? []
            buckets[buckets.firstIndex(of: shortestBucket) ?? 0].append(word)
        }
        
        return buckets
    }

    private func toggleSelection(_ chipId: Int) {
        if allowMultipleSelection {
            if let index = selectedChips.firstIndex(of: chipId) {
                selectedChips.remove(at: index)
            } else {
                selectedChips.append(chipId)
            }
        } else {
            if selectedChips.contains(chipId) {
                selectedChips.removeAll()
            } else {
                selectedChips = [chipId]
            }
        }
    }


    private func calculateTextWidth(text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 17)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}

struct ChipGroupView: View {
    @State private var selectedChips: [Int] = [] // Change to [Int]

    var body: some View {
        VStack{
            
            ChipGroup(selectedChips: $selectedChips, chips: [
                ChipsInputStruct(id: 1, name: "Chip"),
                ChipsInputStruct(id: 2, name: "Chip"),
                ChipsInputStruct(id: 3, name: "Chip"),
            ], allowMultipleSelection: true)
            Text("hello")
            Spacer()
        }
    }
}


struct ChipGroupPreView: PreviewProvider {
    static var previews: some View {
        ChipGroupView()
    }
}
//if dont wanna use grid
//if isSelectMarketView{
//    ScrollView(.horizontal, showsIndicators: false){
//        HStack(spacing: 8){
//            ForEach(Array(chips.enumerated()), id: \.element.id) { index, chip in
//                if index % 3 == 0{
//                    createChipView(chip: chip)
//                }
//            }
//            Spacer()
//        }
//        HStack(spacing: 8){
//            ForEach(Array(chips.enumerated()), id: \.element.id) { index, chip in
//                if index % 3 == 1{
//                    createChipView(chip: chip)
//                }
//            }
//            Spacer()
//        }
//        HStack(spacing: 8){
//            ForEach(Array(chips.enumerated()), id: \.element.id) { index, chip in
//                if index % 3 == 2{
//                    createChipView(chip: chip)
//                }
//            }
//            Spacer()
//        }
//    }
//}
