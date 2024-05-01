//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by SAHIL AMRUT AGASHE on 30/04/24.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator! // sut: refers to System Under Test
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sahil")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned true for a valid first name but returned false")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned false for first name that is shorter than \(SignupConstant.firstNameMinLength) characters but it has returned true")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "SahilSahilSahil")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned false for first name that is longer than \(SignupConstant.firstNameMaxLength) characters but it has returned true")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Act
        let isPasswordValid = sut.doPasswordsMatch(password: "123456789", repeatPassword: "123456789")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The doPasswordsMatch() should have returned true for matching passwords but it has returned false")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.doPasswordsMatch(password: "123456789", repeatPassword: "12345678911")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The doPasswordsMatch() should have returned false for passwords that do not match but it has returned true")
    }

    // Now similarly, You can write more test cases for lastName, email.
    
}
