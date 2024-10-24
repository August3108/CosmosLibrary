//RadioButton
import Foundation
import SwiftUI
struct RadioInputStruct : Codable, Identifiable{
    let id : Int
    let name : String
}
struct radioButtonSample: View {
    @State private var selectedOption: Int = 3
    
    let options: [RadioInputStruct] = [
        RadioInputStruct(id: 1, name: "Option 1"),
        RadioInputStruct(id: 2, name: "Option 2"),
        RadioInputStruct(id: 3, name: "Option 3")
    ]
    
    var body: some View {
        VStack {
            RadioGroup(selectedOption: $selectedOption, options: options)
            
            Text("Selected Option: \(selectedOption)")
        }
        .padding()
    }
}

struct raiopreview: PreviewProvider{
    static var previews: some View{
        radioButtonSample()
    }
}
struct RadioGroup: View {
    @Binding var selectedOption: Int
    let options: [RadioInputStruct]
    
    var body: some View {
        HStack(spacing:3) {
            ForEach(options, id: \.id) { option in
                
                RadioButton(selectedOption: $selectedOption, option: option)
                Spacer()
            }
        }
    }
}

struct RadioButton: View {
    @Binding var selectedOption: Int
    let option: RadioInputStruct
    var onClick: (() -> Void)?
    
    var body: some View {
        Button(action: {
            withAnimation{
                selectedOption = option.id
                onClick?()

            }
        }) {
            HStack {
                Image(systemName: selectedOption == option.id ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(selectedOption == option.id ? .blue : .gray)
                Text(option.name)
                    .foregroundColor(.black)
            }
        }
        .padding(.vertical, 5)
    }
}

