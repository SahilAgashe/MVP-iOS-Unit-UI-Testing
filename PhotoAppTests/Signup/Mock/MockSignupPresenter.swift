//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by SAHIL AMRUT AGASHE on 04/05/24.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled = false
    
    required init(formModelValidator: any PhotoApp.SignupModelValidatorProtocol, webService: any PhotoApp.SignupWebServiceProtocol, delegate: any PhotoApp.SignupViewDelegateProtocol) {
        // TODO: 
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
    
}
