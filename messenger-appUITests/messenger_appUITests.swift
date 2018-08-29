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
        app.buttons["Sign up"].tap()
        
        XCTAssert(app.textFields["Username"].exists)
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.secureTextFields["Password"].exists)
        XCTAssert(app.buttons["Sign up"].exists)
    }
    
    // It checks the login form exists
    func testLoginFormExists() {
        XCTAssert(app.textFields["Email"].exists)
        XCTAssert(app.secureTextFields["Password"].exists)
        XCTAssert(app.buttons["Log in"].exists)
    }
    
    // It checks the list of channels exists
    func testChannelListExists() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Log in"].tap()
        
        waitForElementToAppear(app.buttons["The Living Room"])
        waitForElementToAppear(app.buttons["Tech Talk Zone"])
        waitForElementToAppear(app.buttons["I ❤️ Meshenger"])
        
        XCTAssert(app.buttons["The Living Room"].exists)
        XCTAssert(app.buttons["Tech Talk Zone"].exists)
        XCTAssert(app.buttons["I ❤️ Meshenger"].exists)
    }
    
    // It checks a new user can successfully sign up
    func testSignUpSuccess() {
        app.buttons["Sign up"].tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("test")
        
        // generate a random number to append to email address
        let randomNumber = arc4random()
        let emailAdress = "test\(randomNumber)@test.com"
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(emailAdress)
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Sign up"].tap()
        
        waitForElementToAppear(app.buttons["The Living Room"])
        XCTAssert(app.buttons["The Living Room"].exists)
    }
    
    // It checks a new user cannot sign up if they do not enter an email address
    func testSignUpFailEmailAddressMissing() {
        app.buttons["Sign up"].tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("test")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Sign up"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Failed to sign up")
        XCTAssert(app.alerts.buttons["OK"].exists)
    }
    
    // It checks a new user cannot sign up if they enter an invalid email address
    func testSignUpFailEmailAddressInvalid() {
        app.buttons["Sign up"].tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("test")
        
        let randomNumber = arc4random()
        let emailAdress = "test\(randomNumber)@test"
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(emailAdress)
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Sign up"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Failed to sign up")
        XCTAssert(app.alerts.buttons["OK"].exists)
    }
    
    // It checks a new user cannot sign up if they do not exter a password
    func testSignUpFailPasswordMissing() {
        app.buttons["Sign up"].tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("test")
        
        // generate a random number to append to email address
        let randomNumber = arc4random()
        let emailAdress = "test\(randomNumber)@test.com"
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(emailAdress)
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        
        app.buttons["Sign up"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Failed to sign up")
        XCTAssert(app.alerts.buttons["OK"].exists)
    }
    
    // It checks an existing user can successfully log in
    func testLoginInSuccess() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Log in"].tap()
        
        waitForElementToAppear(app.buttons["The Living Room"])
        XCTAssert(app.buttons["The Living Room"].exists)
    }
    
    // It checks an existing user cannot log in if they enter wrong password
    func testLoginInFailWrongPassword() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("wromngpassword")
        
        app.buttons["Log in"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Failed to log in")
        XCTAssert(app.alerts.buttons["OK"].exists)
    }
    
    // It checks an existing user cannot log in if they do not an enter an email address
    func testLoginInFailEmailAddressMissing() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        app.buttons["Log in"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Failed to log in")
        XCTAssert(app.alerts.buttons["OK"].exists)
    }
    
    // It checks an existing user cannot log in if they do not enter a password
    func testLoginInFailPasswordAddressMissing() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        
        app.buttons["Log in"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Failed to log in")
        XCTAssert(app.alerts.buttons["OK"].exists)
    }
    
    func testNewUserCanPost() {
        app.buttons["Sign up"].tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("test")
        
        // generate a random number to append to email address
        let randomNumber = arc4random()
        let emailAdress = "test\(randomNumber)@test.com"
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(emailAdress)
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Sign up"].tap()
        
        app.buttons["The Living Room"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
    }
    
    func testExistingUserCanPost() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Log in"].tap()
        
        app.buttons["The Living Room"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
    }
    
    // it checks a user can post to multiple channels
    func testUserCanPostToMiultipleChannels() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Log in"].tap()
        
        app.buttons["The Living Room"].tap()
        
        let toolbar = app.toolbars["Toolbar"]
        
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
        
        app.navigationBars["The Living Room"].buttons["Channels"].tap()
        
        app.buttons["Tech Talk Zone"].tap()
        
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
        
        app.navigationBars["Tech Talk Zone"].buttons["Channels"].tap()
        
        app.buttons["I ❤️ Meshenger"].tap()
        
        toolbar.textViews["New Message"].tap()
        toolbar.typeText("Test message")
        toolbar.buttons["Send"].tap()
    }
}
