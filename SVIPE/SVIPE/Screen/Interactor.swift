//
//  Interactor.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//

final class Interactor : BussinesLogic {
    private let presenter: PresentationLogic
    init (presenter: PresentationLogic) {
        self.presenter = presenter
    }
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
    
    func loadOther(_ request: Model.Other.Request) {
        presenter.presentOther(Model.Other.Response())
    }
    
}
