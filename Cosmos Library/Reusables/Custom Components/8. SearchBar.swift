// TextField with automatic search after user doesnt type for delaySecond amount of seconds
import Foundation
import SwiftUI

struct SearchBar: View {
    @State var searchHint : String
    @State var delaySecond : TimeInterval
    @Binding var searchBar : String
    @State private var timer: Timer? = nil
    var searchAction: (() -> Void)
    
    var body: some View {
        VStack {
            TextField(searchHint, text: $searchBar)
                .font(.system(size: 16))
                .onChange(of: searchBar) {oldValue, newValue in
                    timer?.invalidate() // Invalidate previous timer
                    timer = Timer.scheduledTimer(withTimeInterval: delaySecond, repeats: false) { _ in
                        searchAction()
                    }
                }
        }
    }
}

struct SearchBar_Preview: View {
    @State var searchText: String = ""
    
    var body: some View {
        VStack{
            SearchBar(searchHint: "Search", delaySecond: 0.4, searchBar: $searchText) {
                Text("searching for \(searchText)")
            }
            .padding()
        }
    }
}

#Preview{SearchBar_Preview()}
