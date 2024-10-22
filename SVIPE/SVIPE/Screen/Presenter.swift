//
//  Presenter.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//

final class Presenter: PresentationLogic {
    private weak var view: ViewController?
    
    
    
    func presentStart(_ response: Model.Start.Response) {
        <#code#>
    }
    
    func presentOther(_ response: Model.Other.Response) {
        <#code#>
    }
    
    func routeTo() {
        view?.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    
}
