//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by SAHIL AMRUT AGASHE on 03/05/24.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled = false
    
    func signup(withForm formModel: PhotoApp.SignupFormRequestModel, completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        isSignupMethodCalled = true
    }
    
}
