//
//  Request.swift
//  seminar4
//
//  Created by Сергей Растворов on 11/5/24.
//
import Foundation

struct Request {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
    }
    
    var endpoint: Endpoint
    var method: Method
    var parameters: [String: String]?
    var timeInterval: TimeInterval
    let body: Data?
    
    init(
        endpoint: Endpoint,
        method: Method = .get,
        parameters: [String : String]? = nil,
        timeInterval: TimeInterval = 60,
        body: Data? = nil
    ) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.timeInterval = timeInterval
        self.body = body
        
        if var endpointParameters = endpoint.parameters {
            for (key, value) in parameters ?? [:] {
                endpointParameters[key] = value
            }
            
            self.parameters = endpointParameters
        }
    }
}
