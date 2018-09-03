//
//  userViewControllerTests.swift
//  messenger-appTests
//
//  Created by Daniel Jones on 23/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import XCTest
import Firebase

@testable import messenger_app

class userViewControllerTests: XCTestCase {
    
    let userViewController = UserViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmailText() {
        result = 1 + 1
        XCTAssertEqual(result, 2)
    }
    
}
