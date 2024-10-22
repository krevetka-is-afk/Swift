//
//  Protocols.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//

protocol BusinessLogoc {
    func loadStart()
    func loadOther()
}

protocol PresentationLogoc {
    func presentStart()
    func presentOther()
    
    func routeTo()
}
