//
//  Assembly.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//
import UIKit

enum Assembly {
    static func build() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter)
        let view = ViewController(interactor: interactor)
        presenter.view = view
        return view
    }
}
