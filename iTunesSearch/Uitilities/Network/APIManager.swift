//
//  APIManager.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import Foundation

var base_URL = ""

protocol APIManagerProtocol {
    //var networkManager: NetworkManager { get set }
     func fetchArtistList(requestObject:BaseRequest, completionHandler: @escaping ( _ success: Bool, _ list: [ArtistDetails]?, _ error: APIError? ) ->() )
}
/**
 This Class will used for making the API calls and parse the data.
 */
class APIManager: APIManagerProtocol {
    
    var networkManager: NetworkManager?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
        /**
     This Method will be used for creating the URL request.
     */
    func clientURLRequest(path: String, params: Dictionary<String, AnyObject>? = nil) -> NSMutableURLRequest {
        
        let request = NSMutableURLRequest(url: NSURL(string: path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)! as URL)
        if let params = params {
            var paramString = ""
            for (key, value) in params {
                let escapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                let escapedValue = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                paramString += "\(escapedKey)=\(escapedValue)&"
            }
            request.httpBody = paramString.data(using: String.Encoding.utf8)
        }
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    
    func fetchArtistList(requestObject:BaseRequest, completionHandler: @escaping ( _ success: Bool, _ list: [ArtistDetails]?, _ error: APIError? ) ->() ) {
        
        networkManager?.get(request: self.clientURLRequest(path: requestObject.apiURL )) { (success, object) -> () in
            DispatchQueue.main.async { () -> Void in
                if success {
                    let jsonString = object as! String
                    if let decodedObject = try? JSONDecoder().decode(Response.self, from: jsonString.data(using: .utf8)! ) {
                        completionHandler(true, decodedObject.results, nil)
                        print("success -\(jsonString)")
                    } else {
                        print("fail -\(jsonString)")
                    }
                } else {
                    completionHandler(false, nil,APIError.unKnownError)
                }
            }
        }
    }
    
}



 







