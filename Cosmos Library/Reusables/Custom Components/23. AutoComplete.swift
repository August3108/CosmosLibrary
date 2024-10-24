// shows a list of available items to complete from 


import SwiftUI

struct autoComplete: View {
    @Binding var searchText : String
    @State var suggestions: [String]
    @State var showLists = true
    @State var clickedListItem = false
    var body: some View {
        VStack {
            TextField("Type something", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: searchText){ _,_ in
                    if clickedListItem{
                        showLists = false
                        clickedListItem = false
                        
                    } else {
                        showLists = true
                    }
                }
            if showLists {
                List {
                    ForEach(suggestions.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }, id: \.self) { suggestion in
                        Text(suggestion)
                            .onTapGesture {
                                searchText = suggestion
                                clickedListItem = true
                            }
                    }   
                }.frame(maxHeight: 100)
                    .listStyle(.plain)
            }
        }
        .padding()
    }
}

struct autoCompletePreview: View {
    @State var SearchText = ""
    @State var SampleList = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grape"]
    var body : some View {
        autoComplete(searchText: $SearchText, suggestions: SampleList)
    }
}

#Preview{
    autoCompletePreview()
}
