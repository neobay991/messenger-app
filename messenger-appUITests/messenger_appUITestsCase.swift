//
//  messenger_appUITestsCase1.swift
//  messenger-appUITests
//
//  Created by M Jawad Khan on 22/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import XCTest

class messenger_appUITestsCase: XCTestCase {
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
         app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        app.terminate()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
//    
//    func waitForElementToAppear(_ element: XCUIElement, file: String = #file, line: UInt = #line) {
//        let existsPredicate = NSPredicate(format: "exists == true")
//        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
//        
//        waitForExpectations(timeout: 5) { (error) -> Void in
//            if (error != nil) {
//                let message = "Failed to find \(element) after 5 seconds."
//                self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
//            }
//        }
//    }
    
}
