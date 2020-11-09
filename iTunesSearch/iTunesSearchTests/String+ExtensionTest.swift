//
//  String+ExtensionTest.swift
//  iTunesSearchTests
//
//  Created by Yasaswi on 11/9/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import XCTest
@testable import iTunesSearch

class StringExtensionTest: XCTestCase {
    func testGetDate() {
        let dateString = "2020-11-05T10:44:00+0000"
        XCTAssertNotNil(dateString.getDate())
    }
}
