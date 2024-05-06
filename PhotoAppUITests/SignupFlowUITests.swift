//
//  SignupFlowUITests.swift
//  PhotoAppUITests
//
//  Created by SAHIL AMRUT AGASHE on 05/05/24.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
        // getting UI elements using accessibility identifier, added in storyboard file.
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() {
        // Assert
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup Button is not enabled for user interactions")
    }
    
    func testSignupViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("A")
        
        email.tap()
        email.typeText("abc@gmail.com")
        
        /// MARK: Remember while UITesting for secure textfield, typeText() is not working. So Disable Hardware Keyboard for Simulator. Then It will work.
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123456")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 3), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }
    
    func testSignupViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("Sahil12")
        
        lastName.tap()
        lastName.typeText("Agashe12")
        
        email.tap()
        email.typeText("abc123@gmail.com")
        
        /// MARK: Remember while UITesting for secure textfield, typeText() is not working. So Disable Hardware Keyboard for Simulator. Then It will work.
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 3), "An Success Alert dialog was not presented when valid signup form was submitted")
    }

}
