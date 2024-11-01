//
//  OTPBox.swift
//  Cosmo Library
//
//  Created by Rahul jha on 09/06/24.
//

import Foundation
import SwiftUI

struct OTPBoxView : View {

    @Binding var otpText : String
    let numberOfDigit = 4

    var autoCompleteFunc: (() -> Void)?
    @FocusState private var iskeyboardShowing : Bool
    var body: some View {
        VStack{
            HStack(spacing: 0){
                ForEach(0..<numberOfDigit, id: \.self){digit in
                    OTPTextBox(digit)
                }
            }.background(content:{
                TextField("", text: $otpText.limit(numberOfDigit))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .focused($iskeyboardShowing)
                    .frame(width: 0.1, height: 0.1)
                    .opacity(0.0001)


            })

            .onTapGesture {
                iskeyboardShowing = true
            }
            .onChange(of: otpText) {oldValue, newValue in

                    // MARK: making otp as num only
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.otpText = filtered
                    }
                    if newValue.count == numberOfDigit {
                        autoCompleteFunc?()
                    }
                }

        }.onAppear(perform: {
            iskeyboardShowing = true
        })
        .toolbar {
            ToolbarItem(placement: .keyboard){
                Button("Done"){
                    iskeyboardShowing.toggle()
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            }
        }
    }

    // OTP Box Design
    @ViewBuilder
    func OTPTextBox(_ index:Int)->some View{
        ZStack{
            if otpText.count > index{
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }.frame(width: 45, height: 45, alignment: .center)
            // add bottom line here
//            .background(.gray.opacity(0.2))
            .frame(maxWidth: .infinity)
            .overlay(
                        Rectangle()
                            .frame(width: 45, height: 2)
                            .foregroundColor(iskeyboardShowing && otpText.count == index ? .black:.gray) // Change the color as desired
                            .padding(.top, 56) // Adjust the padding to position the underline
                    )
    }

}

extension Binding where Value == String{
    func limit(_ length: Int)->Self{
        if self.wrappedValue.count > length{
            DispatchQueue.main.async{
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }

        }
        return self
    }
}

struct OTPBoxPreview : View {
    @State private var otp = ""
    var body: some View {
        OTPBoxView(otpText: $otp, autoCompleteFunc: {
            print("ehllo")
        })
    }
}
