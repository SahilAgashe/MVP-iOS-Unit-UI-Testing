//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by SAHIL AMRUT AGASHE on 03/05/24.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
