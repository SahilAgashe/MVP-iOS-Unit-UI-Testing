//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by SAHIL AMRUT AGASHE on 03/05/24.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isValidEmailFormat(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
