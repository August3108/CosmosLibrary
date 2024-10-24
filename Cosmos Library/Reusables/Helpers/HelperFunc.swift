//
//  HelperFunc.swift
//  Cosmo Library
//
//  Created by Rahul jha on 05/06/24.
//

import Foundation
import SwiftUI


func getCurrentHour() -> Int {
    let currentHour = Calendar.current.component(.hour, from: Date())
    return currentHour
}

func openAppOrWeb(_ url: String) {
    if let appURL = URL(string: url), UIApplication.shared.canOpenURL(appURL) {
        UIApplication.shared.open(appURL)
    } else if let webURL = URL(string: url) {
        UIApplication.shared.open(webURL)
    }
}
// gives a random number
func getRandomNumber(lowest: Int, highest: Int) -> Int {
        guard lowest < highest else {
            fatalError("Invalid range: lowest value must be less than the highest value")
        }
        
        return Int.random(in: lowest...highest)
    }

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    //MARK: need Struct RoundedCorner , for corner radius to one or more sides
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    //MARK: adds red str for mandatory field
    func redStarAdd(text: String) -> some View {
        HStack {
            Text(text)
            +
            Text("*")
                .foregroundColor(.red)
        }
    }
    //MARK: adds color base on + or - in the string
    func priceMoifier(text: String) -> some View {
        HStack{
            if text != "" {
                Text("(\(text))")
                    .foregroundColor(text.contains("+") ? .green:.red)
            }
        }
    }
    func onBackSwipe(perform action: @escaping () -> Void) -> some View {
        gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80 {
                        action()
                    }
                })
        )
    }
}

extension String {
    func capitalizedFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }


    func capitalizeFirstLetterInAllWords() -> String {
        let words = self.split(separator: " ")
        let capitalizedWords = words.map { word -> String in
            return word.prefix(1).uppercased() + word.dropFirst()
        }
        return capitalizedWords.joined(separator: " ")
    }

}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


class NumberViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        print("0 - init") // Called first
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func loadView() {
        super.loadView()
        print("1 - loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2 - viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("3 - viewWillAppear")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("5 - viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("6 - viewDidLayoutSubviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("4 - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("7 - viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("8 - viewDidDisappear")
    }
    deinit {
        print("9 - deinit") // Called when the view controller is deallocated
    }
}
