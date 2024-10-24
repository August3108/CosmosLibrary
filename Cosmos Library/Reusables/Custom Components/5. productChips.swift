// make a list of selectable chips

import Foundation
import SwiftUI

struct productChips : View {
    @Binding var selectedChips: [Int]
    @State var allChips : [ChipsInputStruct]
    var onClick: (() -> Void)
    var body: some View {
        VStack{
            
                
                let rows = divideIntoRowsProduct(selectedIndex: selectedChips, chips: allChips, availableWidth: AppConstants.AppScreenWidth)
                ForEach(rows, id: \.self) { rowChips in
                    HStack(spacing: 8) {
                        
                        ForEach(rowChips, id: \.id) { chip in
                            HStack {
                                Text(chip.name)
                                Text("X")
                                    .bold()
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        removeChip(at: chip.id)
                                    }
                            }.modifier(paddedOverlay(paddingAmount: 10, cornerRadius: 30))
                        }.multilineTextAlignment(.center)
                        Spacer()
                        
                    }
                }
            HStack{
                Button{
                    onClick()
                } label: {
                    Text("+ Add")
                        .padding(10)
                        .padding(.horizontal,2)
                        .background(.blue.opacity(0.1))
                        .cornerRadius(30)
                        .foregroundColor(.blue)
                        .modifier(paddedOverlay(strokeColor: .blue, paddingAmount: 0, cornerRadius: 30))
                }
                Spacer()
            }
//            ChipGroup(selectedChips: $selectedChips, chips: allChips, allowMultipleSelection: true)
        }
    }
    
    func removeChip(at id: Int) {
        if let index = selectedChips.firstIndex(where: { $0 == id }) {
            selectedChips.remove(at: index)
        }
    }

    
    private func calculateTextWidth(text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 17)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
    
    private func divideIntoRowsProduct(selectedIndex : [Int], chips: [ChipsInputStruct], availableWidth: CGFloat) -> [[ChipsInputStruct]] {
        var rows: [[ChipsInputStruct]] = []
        var currentRowChips: [ChipsInputStruct] = []
        var currentRowWidth: CGFloat = 0

        for index in selectedIndex {
            if let chip = allChips.first(where: { $0.id == index }){
                let chipWidth = calculateTextWidth(text: chip.name) + 50
                if currentRowWidth + chipWidth <= availableWidth {
                    currentRowChips.append(chip)
                    currentRowWidth += chipWidth
                } else {
                    rows.append(currentRowChips)
                    currentRowChips = [chip]
                    currentRowWidth = chipWidth
                }
            }
        }

        if !currentRowChips.isEmpty {
            rows.append(currentRowChips)
        }

        return rows
    }
}
