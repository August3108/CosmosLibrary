//
//  MyResumeView.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import Foundation
import SwiftUI

struct MyResumeView : View {
    @State private var angle: Double = 0.0
    @State private var angle1: Double = 0.0
    @State private var angle2: Double = 0.0
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            Color(Color.bg)
            VStack{
                VStack{
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.primarycolor)
                            .modifier(ViewTapGesture(){
                                dismiss()
                            })
                            Spacer()
                    }.padding(.horizontal)
                    
                    ZStack{
                        ZStack{
                            Color.primarycolor.opacity(0.1)
                        }.frame(width: 160, height: 165)
                            .cornerRadius(90)
                            .rotationEffect(Angle(radians: angle + 30.0))
                        ZStack{
                            Color.primarycolor.opacity(0.12)
                        }.frame(width: 155, height: 145)
                            .cornerRadius(90)
                            .rotationEffect(Angle(radians: angle1 + 130.0))
                        ZStack{
                            Color.primarycolor.opacity(0.1)
                        }.frame(width: 165, height: 165)
                            .cornerRadius(90)
                            .rotationEffect(Angle(radians: angle2 + 10.0))
                            .onAppear(perform: {
                                changeAngle()
                            })
                        
                        Image("MyImage")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .cornerRadius(100)
                    }
                    Text("Rahul Jha")
                        .bold()
                        .foregroundColor(Color.primarycolor)
                        .font(.system(size: 24))
                    HStack(spacing : 30){
                        contactIcon(imgString: "leetcode", openAppOrWebURL: "https://leetcode.com/rahuljha31082000/")
                        
                        contactIcon(imgString: "github", openAppOrWebURL: "https://github.com/August3108")
                        
                        contactIcon(imgString: "linkedin", openAppOrWebURL: "https://www.linkedin.com/in/rahul-jha-682974230/")
                        contactIcon(imgString: "whatsapp", openAppOrWebURL: "whatsapp://send?phone=+918640050409")
                        contactIcon(imgString: "mail", openAppOrWebURL:"mailto:rahuljha31082000@gmail.com")
                        contactIcon(imgString: "phone", openAppOrWebURL:"tel://8640050409")
                        
                    }// for profiles
                    
                    // leetcode , linkedin and github
                    
                    Text("")
                    Divider()
                        .frame(height: 2)
                        .background(Color.primarycolor)
                    Text("")
                    TabGenerator(tabsData: [
                        TabInputStruct(name: "About me", tabContent: AnyView(
                            VStack{
                                ScrollView(showsIndicators: false){
                                    AnimatedChangingTextView(fixedPart: "I love", variableArray: ["to code", "creating apps", "designing interfaces", "learning new things", "solving problems", "innovating", "working with technology"])
                                        .bold()
                                        .padding(.vertical)
                                        .font(.system(size: 18))
                                    Text("I'm iOS developer with keen interest in creating user applications. I am proficient in both SwiftUI and UIKit to build user interfaces and implement data management solutions.\n\nMy experience includes creating reusable UI components, using secure storage methods like UserDefaults and Keychain Services. I've also worked in API integrations and implemented Firebase for analytics and notifications.\n\nBeyond core functionalities, I've implemented features such as in-app purchases, managing various notification types, and ensuring user privacy through permission management. I have worked with CocoaPods for third-party library integration and have successfully managed the App Store Connect platform for updates and independent app launches.")
                                        .font(.system(size: 14))
                                }

                            }
                        )),
                        TabInputStruct(name: "Experiences & Project", tabContent:AnyView(
                            ScrollView(showsIndicators: false){
                                VStack{
                                    HStack{
                                        Text("Experience")
                                            .foregroundColor(Color.textcolor)
                                            .bold()
                                            .font(.system(size: 20))
                                        Spacer()
                                    }.padding()
                                    ForEach(myExperience, id: \.companyName){ exp in
                                        experienceView(exp: exp)
                                            .modifier(paddedOverlay())
                                    }
                                    HStack{
                                        Text("Projects")
                                            .foregroundColor(Color.textcolor)
                                            .bold()
                                            .font(.system(size: 20))
                                        Spacer()
                                    }.padding()
                                    ForEach(myCompanyProjects, id: \.companyName){ exp in
                                        experienceView(exp: exp, showDetailExtention: true, showExpDescriptionExtention: false)
                                            .modifier(paddedOverlay())
                                    }

                                    VStack{
                                        HStack{
                                            Text("Education ")
                                                .foregroundColor(Color.textcolor)
                                                .bold()
                                                .font(.system(size: 20))
                                            Spacer()
                                        }.padding()
                                        ForEach(myEducation, id: \.companyName){ exp in
                                            experienceView(exp: exp, showDetailExtention: false)
                                                .modifier(paddedOverlay())
                                        }
                                    }

                                }

                            }
                            )
                        )
                    ]).padding(.horizontal)

                    
                    
                }
            }
        }
        
    }
    func changeAngle(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            changeAngle()
        }
        withAnimation{
            
            angle1 = angle1 + 1.0 + (Double(getRandomNumber(lowest: 1, highest: 5))/10)
            angle2 = angle2 + 1.0 + (Double(getRandomNumber(lowest: 1, highest: 5))/10)
            angle = angle + 1.0
            if angle > 360{
                angle = 0
            }
            if angle1 > 360{
                angle1 = 0
            }
            if angle2 > 360{
                angle2 = 0
            }
        }
        
            
    }
}

#Preview {
    MyResumeView()
}



