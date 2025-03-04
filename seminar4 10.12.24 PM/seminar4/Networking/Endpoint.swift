//
//  Endpoint.swift
//  seminar4
//
//  Created by Сергей Растворов on 11/5/24.
//

protocol Endpoint {
    var compositePath: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var parameters: [String: String]? {
        return nil
    }
}
