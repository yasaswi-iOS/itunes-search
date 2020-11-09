//
//  NetworkManager.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import Foundation

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
    case unKnownError = "Some thing went wrong"
}


protocol NetworkManagerProtocol {
    //var session: URLSession { get set }
    func get(request: NSMutableURLRequest, completion:  @escaping (_ success: Bool, _ object: AnyObject?) -> ())
}

/**
 This Class will used for establishing the network connection and get the response.
 */
class NetworkManager :NetworkManagerProtocol {
    
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func dataTask(request: NSMutableURLRequest, method: String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        request.httpMethod = method
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                if let returnData = String(data: data, encoding: .utf8) {
                    if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                        completion(true, returnData as AnyObject)
                    } else {
                        completion(false, returnData as AnyObject)
                    }
                }
            }
            }.resume()
    }
    
    func post(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }
    
    func put(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }
    
    func get(request: NSMutableURLRequest, completion:  @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
}
