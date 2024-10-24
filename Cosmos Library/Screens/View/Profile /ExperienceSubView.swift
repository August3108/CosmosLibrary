//
//  ExperienceSubView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 06/06/24.
//

import Foundation
import SwiftUI

struct experienceView : View {
    @State var showDetail = false
    @State var exp : experienceModel
    @State var showExpDescription = false
    @State var openLink = "" // if its not empty open link icon
    @State var showDetailExtention = true
    @State var showExpDescriptionExtention = true
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Image(exp.companyLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .cornerRadius(50)
                    .padding(.horizontal,10)
                VStack{
                    HStack{
                    
                        Text("\n\(exp.companyName)")
                            .foregroundColor(Color.textcolor)
                            .bold()
                            .font(.system(size: 16))
                        Spacer()
                        
                    }
                    HStack{
                    
                        Text("\(exp.position)")
                            .foregroundColor(Color.textcolor)
                            .bold()
                            .font(.system(size: 14))
                        Spacer()
                        
                    }
                    HStack{
                        
                        Text(exp.duration)
                            .foregroundColor(Color.textcolor)
                            .font(.system(size: 10))
                            .bold()
                        Spacer()
                        
                    }
                }
            }
            if showDetail{
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        BalancedChips(myArray: exp.skillkeyword, numberOfStacks: 3)
                    }
                    if exp.skillkeyword.isEmpty{
                        VStack{
                            ForEach(exp.Description, id:\.self){txt in
                                HStack{
                                    Text(txt)
                                    Spacer()
                                }
                            }
                        }
                    }
                    if showExpDescription{
                        VStack{//
                            ForEach(exp.Description, id:\.self){txt in
                                HStack{
                                    Text(txt)
                                    Spacer()
                                }
                            }
                        }
                    }
                    if showExpDescriptionExtention{
                        HStack{
                            Spacer()
                            
                            Button(showExpDescription ? "hide description" : "show description"){
                                withAnimation{
                                    showExpDescription.toggle()
                                }
                            }
                        }
                    }
                }
            }
            if showDetailExtention{
                HStack{
                    Image(systemName: "chevron.down")
                        .renderingMode(.template)
                        .rotationEffect(showDetail ? .degrees(180) : .degrees(0))
                        .foregroundColor(Color.primarycolor)
                        .onTapGesture {
                            withAnimation{
                                showDetail.toggle()
                            }
                        }
                }
            }
        }
    }
}
