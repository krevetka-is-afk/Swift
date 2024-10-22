//
//  Presenter.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//

import UIKit

final class Presenter: PresentationLogic {
    weak var view: ViewController?
    
    

    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart()
    }
    
    func presentOther(_ response: Model.Other.Response) {
        view?.displayOther()
    }
    
    func routeTo() {
        view?.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    
}
