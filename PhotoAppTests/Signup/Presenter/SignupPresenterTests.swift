//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by SAHIL AMRUT AGASHE on 01/05/24.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter! // sut: refers to System Under Test
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Sahil",
                                              lastName: "Agashe",
                                              email: "abc@abc.com",
                                              password: "123456789",
                                              repeatPassword: "123456789")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
    }
    
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailFormatValidated, "Email format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validated if passwords match")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
}
