//// shows image from url
//// must include package from gitHub
//import SwiftUI
//import SDWebImageSwiftUI
//import SDWebImageSVGCoder
//
//struct CustomImageView: View {
//    let url: URL
//    @State var imgWidth : CGFloat = -1
//    @State var imgHeight : CGFloat = -1
//    @State var contentMode : ContentMode = .fill
//    @State private var isLoading = true
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            if isLoading {
//                ProgressView()
//            } else if imgWidth != -1 , imgHeight != -1 {
//                WebImage(url: url)
//                    .resizable()
//                    .aspectRatio(contentMode: contentMode)
//                    .transition(.fade(duration: 0.5))
//                    .frame(width: imgWidth, height: imgHeight)
//            } else {
//                WebImage(url: url)
//                    .resizable()
//                    .aspectRatio(contentMode: contentMode)
//                    .transition(.fade(duration: 0.5))
//            }
//            Spacer()
//        }
//        .onAppear(perform: loadImage)
//    }
//    
//    private func loadImage() {
//        let svgCoder = SDImageSVGCoder.shared
//        
//        SDImageCodersManager.shared.addCoder(svgCoder)
//        
//        SDWebImageDownloader.shared.downloadImage(with: url) { _, _, _, _ in
//            DispatchQueue.main.async {
//                isLoading = false
//            }
//        }
//    }
//}
//
//struct MyCustomImageView: View {
//    var body: some View {
//        CustomImageView(url: URL(string: "https://cdn.discordapp.com/attachments/1130788484551032905/1160087665727787090/NoData.gif?ex=653362d4&is=6520edd4&hm=3bedfdd3a1d1939901d8a4ab58a2bf6bd20baafa41f239251e7863f32af6e07d&")!)
//    }
//}
//
//struct MyCustomImageView_Preview: PreviewProvider {
//    static var previews: some View {
//        MyCustomImageView()
//    }
//}
//
