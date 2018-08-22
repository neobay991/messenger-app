//
//  messenger_appUITests1.swift
//  messenger-appUITests
//
//  Created by M Jawad Khan on 22/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import XCTest

class UITests: messenger_appUITestsCase {
    
    func testSignUp() {
        
        app.buttons["Sign Up"].tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("jay7@test.com")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["OK"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        toolbar.buttons["Send"].tap()
        
    }
    
    func testLoginIn() {
        
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
    
    func testLoginFormExists() {
        
        XCTAssert(app.buttons["Log In"].exists)
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.textFields["Password"].exists)
        XCTAssert(app.buttons["OK"].exists)
    }

}
