//
//  Protocols.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//

protocol BussinesLogic {
    func loadStart(_ request: Model.Start.Request)
    func loadOther(_ request: Model.Other.Request)
}

protocol PresentationLogic {
    func presentStart(_ response: Model.Start.Response)
    func presentOther(_ response: Model.Other.Response)
    
    func routeTo()
}
