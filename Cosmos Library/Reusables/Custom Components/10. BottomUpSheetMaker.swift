// Generate a bottom sheet with animation 
import Foundation
import SwiftUI

struct BottomUpSheetMaker<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showBottomUpSheet: Bool
    @ViewBuilder let content: Content
    @State var HeadTitle: String
    @State var CloseIcon: String
    
    var body: some View {
        ZStack {
            
            if showBottomUpSheet {
                ZStack (alignment: .bottom){
                    Color.black
                        .opacity(0.5)
                        .ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 5) {
                        
                        HStack{
                            Text(HeadTitle)
                                .font(.system(size: 24))
                                .bold()
                            if CloseIcon != "" {
                                Spacer()
                                Image(systemName: CloseIcon)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.5)){
                                            showBottomUpSheet = false
                                        }
                                    }
                            }
                        }.padding(.horizontal,10)
                        // content
                        content
                        
                    }.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                    
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 15)
                    )
                    .offset(y: showBottomUpSheet ? 0 : UIScreen.main.bounds.height)
                    .animation(.easeInOut, value: 1)
                }.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func textRowView(_ text: String) -> some View {
        HStack(alignment: .top) {
            Text(text)
        }
        .opacity(0.8)
        .frame(alignment: .topLeading)
        .padding(.horizontal)
    }
}


struct sampleBottomSheetMaker : View {
    @State var showBottomSheet = false
    var body: some View {
        ZStack{
            VStack{
                Button("trigger")
                {
                    showBottomSheet.toggle()
                }
            }
            
            BottomUpSheetMaker(showBottomUpSheet: $showBottomSheet, content: {
                Text("Hello I am Bottom sheet 2.0")
            }, HeadTitle: "The Bottom Sheet", CloseIcon: "xmark")
        }
    }
}
#Preview{ 
    sampleBottomSheetMaker()
}
