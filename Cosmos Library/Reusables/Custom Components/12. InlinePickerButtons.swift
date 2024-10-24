import SwiftUI

struct InlinePickerButtons: View {
    @Binding var selection: Int
    let options: [String]
    
    var body: some View {
        Picker(selection: $selection, label: Text("")) {
            ForEach(0..<options.count) { index in
                Text(options[index])
                    .tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 3)
        )
    }
}

// Usage example
struct PickerTest: View {
    @State private var selectedOption = 0
    let options = ["Mobile", "Email"]
    
    var body: some View {
        VStack {
            InlinePickerButtons(selection: $selectedOption, options: options)
            
            if selectedOption == 0 {
                Text("Mobile")
            } else {
                Text("Email")
            }
        }
    }
}

struct InlinePickerPreview: PreviewProvider {
    static var previews: some View {
        PickerTest()
    }
}
