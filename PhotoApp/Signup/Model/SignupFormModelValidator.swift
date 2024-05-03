//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by SAHIL AMRUT AGASHE on 30/04/24.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstant.firstNameMinLength || firstName.count > SignupConstant.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstant.lastNameMinLength || lastName.count > SignupConstant.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
       return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupConstant.passwordMinLength ||
        password.count > SignupConstant.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
    
}
