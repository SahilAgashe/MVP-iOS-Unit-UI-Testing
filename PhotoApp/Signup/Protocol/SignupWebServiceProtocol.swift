//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by SAHIL AMRUT AGASHE on 03/05/24.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) 
}
