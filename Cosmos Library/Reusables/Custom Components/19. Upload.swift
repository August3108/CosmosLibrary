// note permisions are optimised image only
import Foundation
import SwiftUI
import MobileCoreServices
import UniformTypeIdentifiers
import UIKit
import QuickLook
import Photos

struct FilePickerView: View {
    @State private var isImporting = false
    @Binding var selectedFileURLs: [URL]
    @State var imgName: String = "UpLoad"
    @State var imgHeight: CGFloat = 60
    @State var imgWidth: CGFloat = 60
    @State var showPreview: Bool = true
    @State var maxSelectableItem : Int = 5
    @State var excdeedLimit : Bool = false
    @State var allowedContentTypes : [UTType] = [UTType.image, UTType.text, UTType.pdf]
    let status = PHPhotoLibrary.authorizationStatus()
    var body: some View {
        HStack {
            Button {
                PhotoLibraryPermissionManager.checkPermission { status in
                                switch status {
                                case .authorized, .limited:
                                    print("permission granted")
                                    isImporting = true
                                case .denied, .restricted:
                                    print("Permission denied")
                                default:
                                    print("Permission status not determined")
                                }
                            }
            }  label: {
                Image(imgName)
                    .resizable()
                    .frame(height: imgHeight)
                    .frame(width: imgWidth)
            }

            if !selectedFileURLs.isEmpty, showPreview {
                ForEach(selectedFileURLs, id: \.self) { url in
                    VStack {
                        FilePreviewView(fileURL: url)
                            .frame(height: imgHeight)
                            .frame(width: imgWidth)
                        ScrollView(.horizontal,showsIndicators: false){
                            Text(url.lastPathComponent)
                        }.frame(width: imgWidth)
                    }
                }
            }
            if imgName != "camera" {
                Spacer()
            }
        }
        .sheet(isPresented: $isImporting) {
            DocumentPickerViewController(isImporting: $isImporting, selectedFileURLs: $selectedFileURLs, excdeedLimit: $excdeedLimit, allowedContentTypes: allowedContentTypes, maxSelectableItems: maxSelectableItem)
        }
    }
}
func openSettings() {
    guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
        return
    }
    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
}

struct DocumentPickerViewController: UIViewControllerRepresentable {
    @Binding var isImporting: Bool
    @Binding var selectedFileURLs: [URL]
    @Binding var excdeedLimit : Bool
    let allowedContentTypes: [UTType]
    let maxSelectableItems: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self, maxSelectableItems: maxSelectableItems)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: allowedContentTypes)
        documentPicker.delegate = context.coordinator
        documentPicker.allowsMultipleSelection = maxSelectableItems > 1 ? true : false
        return documentPicker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPickerViewController
        let maxSizeInBytes: Int64 = 1024 * 1024 * 6
        let maxSelectableItems: Int

        init(_ parent: DocumentPickerViewController, maxSelectableItems: Int) {
            self.parent = parent
            self.maxSelectableItems = maxSelectableItems
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            let fileManager = FileManager.default
            let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let filteredUrls = urls.compactMap { url -> URL? in
                do {
                    // Start accessing security-scoped resource
                    guard url.startAccessingSecurityScopedResource() else {
                        // Handle failure to gain access
                        return nil
                    }

                    let resources = try url.resourceValues(forKeys: [.fileSizeKey])
                    if let fileSize = resources.fileSize, Int64(fileSize) <= maxSizeInBytes {
                        // Copy the file to the app's sandbox
                        let newURL = documentDirectory.appendingPathComponent(url.lastPathComponent)
                        if fileManager.fileExists(atPath: newURL.path) {
                            try fileManager.removeItem(at: newURL)
                        }
                        try fileManager.copyItem(at: url, to: newURL)

                        // Stop accessing security-scoped resource
                        url.stopAccessingSecurityScopedResource()

                        return newURL
                    } else {
                        // Stop accessing security-scoped resource
                        url.stopAccessingSecurityScopedResource()
                        return nil
                    }
                } catch {
                    print("Error handling selected file: \(error)")
                    // Stop accessing security-scoped resource
                    url.stopAccessingSecurityScopedResource()
                    return nil
                }
            }
            
            parent.selectedFileURLs = Array(filteredUrls.prefix(maxSelectableItems))
            parent.isImporting = false
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.isImporting = false
        }
    }

}

// MARK: -

struct FilePreviewView: UIViewControllerRepresentable {
    let fileURL: URL

    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: QLPreviewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(fileURL: fileURL)
    }

    class Coordinator: NSObject, QLPreviewControllerDataSource {
        let fileURL: URL

        init(fileURL: URL) {
            self.fileURL = fileURL
        }

        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }

        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return fileURL as QLPreviewItem
        }
    }
}





class PhotoLibraryPermissionManager {
    static func checkPermission(completion: @escaping (PHAuthorizationStatus) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .notDetermined:
            // Request permission
            PHPhotoLibrary.requestAuthorization { newStatus in
                completion(newStatus)
            }
        case .restricted, .denied, .authorized, .limited:
            completion(status)
        @unknown default:
            fatalError("Unknown status of PHPhotoLibrary authorization")
        }
    }
}

struct SampleFilePickerPreview: View {
    @State private var selectedFileURLs: [URL] = []

    var body: some View {
        AnyView(
            FilePickerView(selectedFileURLs: $selectedFileURLs)
        )
    }
}

#Preview{
    SampleFilePickerPreview()
}
