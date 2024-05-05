//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by SAHIL AMRUT AGASHE on 04/05/24.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
