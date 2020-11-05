//
//  BaseRequest.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import Foundation

class BaseRequest: NSObject {
    var baseHeader = [String:String]()
    var params = [String:Any]()
    var apiURL:String = ""
    
    override init() {
        super.init()
        baseHeader["Content-Type"] = "application/x-www-form-urlencoded"
        baseHeader["Accept"] = "application/json"
        baseHeader["X-App-Token"] = "WDhN6TuvElT3LoyCgnW9ShpgI"
    }
}
