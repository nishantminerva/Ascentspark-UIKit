//
//  JsonManager.swift
//  Ascentpark UIKit
//
//  Created by Nishant Kumar on 08/10/21.
//

//import Foundation
//
//struct JsonManager {
//
//    let apiUrl = URL(string: "https://smileelive.webappfactory.co/api/demo-data")!
//    // 2.
//
//    func fetchUser() {
//        performRequest(urlString: "\(apiUrl)")
//    }
//
//    func performRequest(urlString : String) {
//        if let url = URL(string: urlString) {
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
//
//        task.resume()
//    }
//
//    }
//
//    func handle(data : Data? , response : URLResponse? , error : Error? ) {
//        if error != nil {
//            print(error!)
//            return
//        }
//
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }
//    URLSession.shared.dataTask(with: url) {(data, response, error) in
//        do {
//            if let userData = data {
//                // 3.
//                let decodedData = try JSONDecoder().decode(Users.self, from: userData)
//                DispatchQueue.main.async { [self] in
//                    users = decodedData.data
//                }
//            } else {
//                print("No data")
//            }
//        } catch {
//            print("Error")
//        }
//    }.resume()
//}
