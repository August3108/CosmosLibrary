//
//  FileDownload.swift
//  Cosmo Library
//
//  Created by Rahul jha on 06/06/24.
//

import Foundation
func downloadFileCompletionHandler(urlstring: String, completion: @escaping (URL?, Error?) -> Void) {
    
    let url = URL(string: urlstring)!
    let documentsUrl =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)
    print(destinationUrl)
    
    if FileManager().fileExists(atPath: destinationUrl.path) {
        print("File already exists [\(destinationUrl.path)]")
        try! FileManager().removeItem(at: destinationUrl)
        completion(destinationUrl, nil)
        return
    }
    
    let request = URLRequest(url: url)
    
    
    let task = URLSession.shared.downloadTask(with: request) { tempFileUrl, response, error in
        //            print(tempFileUrl, response, error)
        if error != nil {
            completion(nil, error)
            return
        }
        
        if let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                if let tempFileUrl = tempFileUrl {
                    print("download finished")
                    try! FileManager.default.moveItem(at: tempFileUrl, to: destinationUrl)
                    completion(destinationUrl, error)
                } else {
                    completion(nil, error)
                }
                
            }
        }
        
    }
    task.resume()
}
