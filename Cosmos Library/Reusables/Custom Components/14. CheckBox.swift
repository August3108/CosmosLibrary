//
//  CheckBox.swift
//  RJStarterKit
//
//  Created by Rahul jha on 25/09/23.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .frame(width: 18, height: 18)
                .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
}
struct MultiCheckbox: View {
    @Binding var selectedIDs: [Int]
    var items: [RadioInputStruct]
    // id and name
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum: 100)),
            GridItem(.flexible(minimum: 100))
        ], alignment: .leading) {
            ForEach(items) { item in
                Toggle(item.name, isOn: Binding(
                    get: { self.selectedIDs.contains(item.id) },
                    set: { isOn in
                        if isOn {
                            if !self.selectedIDs.contains(item.id) {
                                self.selectedIDs.append(item.id)
                            }
                        } else {
                            if let index = self.selectedIDs.firstIndex(of: item.id) {
                                self.selectedIDs.remove(at: index)
                            }
                        }
                    }
                )).toggleStyle(CheckboxToggleStyle())
            }
        }

    }
}
struct CpontentView: View {
    @State private var isChecked = true

    var body: some View {
        VStack{
            Toggle("Checkbox Label", isOn: $isChecked)
                .toggleStyle(CheckboxToggleStyle())
                .padding()
            Button{
                print(isChecked)
            }
            label:{Text("hd")}}
    }
}

struct CpontentView_Previews: PreviewProvider {
    static var previews: some View {
        CpontentView()
    }
}
