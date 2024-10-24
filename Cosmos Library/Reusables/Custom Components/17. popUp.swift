// creates a popup
import Foundation
import SwiftUI
struct PopUpWindow<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showPopUpWindow: Bool
    @ViewBuilder let content: Content
    @State var showAnimateContent = false
    @State var HeadTitle: String = ""
    @State var CloseIcon: String = ""
    
    var body: some View {
        ZStack {
            if showPopUpWindow {
                ZStack {
                    Color.black
                        .opacity(0.5)
                        .ignoresSafeArea()
                    if showAnimateContent{
                        VStack(alignment: .leading, spacing: 5) {
                            // title and closing button
                            if HeadTitle != "" || CloseIcon != ""{
                                HStack{
                                    Text(HeadTitle)
                                        .font(.system(size: 14))
                                        .bold()
                                    Spacer()
                                    Image(systemName: CloseIcon)
                                    
                                        .onTapGesture {
                                            print("gee")
                                            withAnimation{
                                                showAnimateContent = false
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                showPopUpWindow = false
                                            }
                                        }
                                }.padding()
                            }
                            // content
                            content
                            
                        }.transition(.scale)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 15)
                            )
                            .padding(.horizontal, 30)
                    }
                }.onAppear(perform: {
                    withAnimation{
                        showAnimateContent = true
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
