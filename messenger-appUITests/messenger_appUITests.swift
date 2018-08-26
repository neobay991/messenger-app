//
//  messenger_appUITests.swift
//  messenger-appUITests
//
//  Created by Jay Khan on 22/08/2018.
//  Copyright © 2018 Jay Khan. All rights reserved.
//

import XCTest

class messengerAppUITests: messengerAppUITestsCase {

    // It checks the sign up form exists
    func testSignUpFormExists() {

        app.buttons["Sign Up"].tap()

        XCTAssert(app.buttons["Sign Up"].exists)
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.textFields["Password"].exists)
        XCTAssert(app.buttons["OK"].exists)
    }

    // It checks the login form exists
    func testLoginFormExists() {

        XCTAssert(app.buttons["Log In"].exists)
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.textFields["Password"].exists)
        XCTAssert(app.buttons["OK"].exists)
    }
    
    // It checks the list of channels exists
    func testChannelListExists() {
        
        app.buttons["Log In"].tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["OK"].tap()
        
        waitForElementToAppear(app.buttons["Channel 1"])
        waitForElementToAppear(app.buttons["Channel 2"])
        waitForElementToAppear(app.buttons["Channel 3"])
        
        XCTAssert(app.buttons["Channel 1"].exists)
        XCTAssert(app.buttons["Channel 2"].exists)
        XCTAssert(app.buttons["Channel 3"].exists)
    }

    // It checks a new user can successfully sign up
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
    
        waitForElementToAppear(app.buttons["Channel 1"])
        XCTAssert(app.buttons["Channel 1"].exists)
    }

    // It checks a new user cannot sign up if they do not enter an email address
    func testSignUpFailEmailAddressMissing() {

        app.buttons["Sign Up"].tap()

        let emailTextField = app.textFields["Email"]
        emailTextField.tap()

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")

        app.buttons["OK"].tap()

        XCTAssert(app.buttons["OK"].exists)
    }

    // It checks a new user cannot sign up if they do not exter a password
    func testSignUpFailPasswordMissing() {

        app.buttons["Sign Up"].tap()

        // generate a random number to append to email address
        let randomNumber = arc4random()
        let emailAdress = "test\(randomNumber)@test.com"
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(emailAdress)

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()

        app.buttons["OK"].tap()

        XCTAssert(app.buttons["OK"].exists)
    }

    // It checks an existing user can successfully log in
    func testLoginInSuccess() {

        app/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".segmentedControls.buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")

        app.buttons["OK"].tap()
        
        waitForElementToAppear(app.buttons["Channel 1"])
        XCTAssert(app.buttons["Channel 1"].exists)
    }

    // It checks an existing user cannot log in if they enter wrong password
    func testLoginInFailWrongPassword() {

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

    // It checks an existing user cannot log in if they do not an enter an email address
    func testLoginInFailEmailAddressMissing() {

        app/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".segmentedControls.buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let emailTextField = app.textFields["Email"]
        emailTextField.tap()

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("wromngpassword")

        app.buttons["OK"].tap()

        XCTAssert(app.buttons["OK"].exists)
    }

    // It checks an existing user cannot log in if they do not e password
    func testLoginInFailPasswordAddressMissing() {

        app/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".segmentedControls.buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()

        app.buttons["OK"].tap()

        XCTAssert(app.buttons["OK"].exists)
    }
    
    // it checks a new user can post
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
        
        app.buttons["Channel 1"].tap()

        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
    }
    
    // it checks an existing user can post
    func testExistingUserCanPost() {

        app/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".segmentedControls.buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")

        app.buttons["OK"].tap()
        
        app.buttons["Channel 1"].tap()

        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
    }
}
