//
//  messenger_appUITests1.swift
//  messenger-appUITests
//
//  Created by M Jawad Khan on 22/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import XCTest

class messenger_appUITests: messenger_appUITestsCase {
    
    func testSignUpFormExists() {
        
        app.buttons["Sign Up"].tap()
        
        XCTAssert(app.buttons["Sign Up"].exists)
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.textFields["Password"].exists)
        XCTAssert(app.buttons["OK"].exists)
    }
    
    func testLoginFormExists() {
        
        XCTAssert(app.buttons["Log In"].exists)
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.textFields["Password"].exists)
        XCTAssert(app.buttons["OK"].exists)
    }
    
    func testSignUpSuccess() {
        
        app.buttons["Sign Up"].tap()
        
        // generate a random number to append to email address
        let randomNumber = arc4random()
        let emailAdress = "test\(randomNumber)@test.com"
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(emailAdress)
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["OK"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        XCTAssert(toolbar.buttons["Send"].exists)
    }
    
    func testSignUpFailVariationOne() {
        
        app.buttons["Sign Up"].tap()
        
        // generate a random number to append to email address
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["OK"].tap()
        
        XCTAssert(app.buttons["OK"].exists)
    }
 
    func testLoginInSuccess() {
        
        app/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".segmentedControls.buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["OK"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        XCTAssert(toolbar.buttons["Send"].exists)
    }
    
    func testLoginInFail() {
        
        app/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".segmentedControls.buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("wromngpassword")
        
        app.buttons["OK"].tap()
        
        XCTAssert(app.buttons["OK"].exists)

    }
    
    func testNewUserCanPost() {
        
        app.buttons["Sign Up"].tap()
        
        // generate a random number to append to email address
        let randomNumber = arc4random()
        let emailAdress = "test\(randomNumber)@test.com"
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(emailAdress)
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["OK"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
    }
    
    func testExistingUserCanPost() {
        
        app/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".segmentedControls.buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["OK"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
    }
}
