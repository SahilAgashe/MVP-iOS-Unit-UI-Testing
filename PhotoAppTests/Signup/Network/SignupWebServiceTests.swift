//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by SAHIL AMRUT AGASHE on 29/04/24.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService! // sut: refers to system under test
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstant.signupURLString, urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "123456")
    }
    
    override func tearDown() {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Arrange
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\": \"users\", \"error\": \"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = expectation(description: "An empty request URL string expectation")
        sut = SignupWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        // Arrange
        let expectation = expectation(description: "A failed request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, signupError in
            // Assert
            XCTAssertEqual(signupError, SignupError.failedRequest(description: errorDescription), "The signup() method did not return an expected error for the failed request")
            XCTAssertEqual(signupError?.localizedDescription, errorDescription, "Unexpected error localized description")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
