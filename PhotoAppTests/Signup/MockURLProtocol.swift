//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by SAHIL AMRUT AGASHE on 29/04/24.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error {
            let stubNSError = NSError(domain: "stubNSError", code: 0, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
            client?.urlProtocol(self, didFailWithError: stubNSError)
        } else {
            client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
