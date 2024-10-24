import SwiftUI
struct pickerInputStruct: Identifiable, Codable, Hashable {
    let id : Int
    let type : String
}

import SwiftUI
struct CustomPicker : View {
    @Binding var selectedID: Int?
    @Binding var selectedName : String
    @Binding var selectedOption: Int
    let options: [pickerInputStruct]
    @State var imageSystemName: String = "chevron.down"
    
    var body: some View {
        
        pickerView(selectedOption: $selectedOption, options: options)
            .onAppear(perform: {
                selectedID = options[selectedOption].id
                selectedName = options[selectedOption].type
            })
            .onChange(of: selectedOption) {oldValue, newValue in
                selectedID = options[selectedOption].id
                selectedName = options[selectedOption].type
            }
        
    }
}
struct pickerView : View {
    @Binding var selectedOption : Int
    let options : [pickerInputStruct]
    var dropdownAppear: (() -> Void)?
    var body: some View {
//        HStack{
            Menu {
                Picker(selection: $selectedOption,
                       label: EmptyView(),
                       content: {
                    ForEach(options.indices) { index in
                        Text(options[index].type).tag(String(index))
                    }
                }).pickerStyle(.inline)
                    .accentColor(.white)
            } label: {
                HStack{
                    Text(options[selectedOption].type)
                    
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                    .frame(maxWidth: .infinity)
                    .padding()

            }
//        }
        
    }
}
struct CotView: View {
    @State private var selectedOption: Int?
    @State private var selectedOptions = 0
    @State var s = ""
    let options:[pickerInputStruct] = [
        pickerInputStruct(id: 1, type: "Option 1"),
        pickerInputStruct(id: 2, type: "Option 2"),
        pickerInputStruct(id: 3, type: "Option 3")
    ]

    var body: some View {
        CustomPicker(selectedID: $selectedOption, selectedName: $s, selectedOption: $selectedOptions, options: options, imageSystemName: "chevron.down")
            .modifier(paddedOverlay(paddingAmount: 0))
    }
}

struct CotView_Previews: PreviewProvider {
    static var previews: some View {
        CotView()
    }
}
