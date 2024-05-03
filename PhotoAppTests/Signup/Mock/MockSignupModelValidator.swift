//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by SAHIL AMRUT AGASHE on 01/05/24.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated = false
    var isLastNameValidated = false
    var isEmailFormatValidated = false
    var isPasswordValidated = false
    var isPasswordEqualityValidated = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailFormatValidated = true
        return isEmailFormatValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
}
