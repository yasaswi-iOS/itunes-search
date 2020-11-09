//
//  ActivityIndicatorTest.swift
//  iTunesSearchTests
//
//  Created by Yasaswi on 11/9/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import XCTest
@testable import iTunesSearch

class ActivityIndicatorTest:XCTestCase {
    let viewActivityIndicator = UIView()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    func testHide() {
        LoadingIndicatorView.viewForActivityIndicator  = viewActivityIndicator
        LoadingIndicatorView.activityIndicatorView = activityIndicator
        LoadingIndicatorView.hide()
        
        XCTAssertNotNil(viewActivityIndicator.removeFromSuperview())
        XCTAssertNotNil(activityIndicator.stopAnimating())
    }
}
