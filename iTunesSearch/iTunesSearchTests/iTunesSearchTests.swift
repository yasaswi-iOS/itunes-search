//
//  iTunesSearchTests.swift
//  iTunesSearchTests
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import XCTest
@testable import iTunesSearch


class MockNetworkManager : NetworkManager {
   
    private let data: Bool
    private let response: String
    
    init(data: Bool, response: String) {
        self.data = data
        self.response = response
        super.init(session: URLSession())
        
    }
    
    override func get(request: NSMutableURLRequest, completion:  @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        completion( self.data, self.response as AnyObject)
    }
    
    
    
    
}




class iTunesSearchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchArtistList() {
        var mockNetworkManager =  MockNetworkManager(data: false, response: "")
        
        let apiManager  = APIManager(networkManager: mockNetworkManager)
        
        apiManager.fetchArtistList(requestObject: BaseRequest()) {  [weak self] (success, decodedResponse, error) in
            
           XCTAssertNotNil(decodedResponse)
            
        }
        
        
        
    }

    

}
