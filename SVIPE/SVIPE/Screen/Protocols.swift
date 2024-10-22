//
//  Protocols.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//

protocol BusinessLogoc {
    func loadStart(_ request: Model.Start.Request)
    func loadOther(_ request: Model.Other.Request)
}

protocol PresentationLogoc {
    func presentStart(_ response: Model.Start.Response)
    func presentOther(_ response: Model.Other.Response)
    
    func routeTo()
}
