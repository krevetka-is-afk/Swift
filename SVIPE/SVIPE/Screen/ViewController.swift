//
//  ViewController.swift
//  SVIPE
//
//  Created by Сергей Растворов on 10/22/24.
//

import UIKit

class ViewController: UIViewController {
    private let button = UIButton(type: .system)
    
    private let interactor: BusinessLogic
    init(interactor: BusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.loadStart(Model.Start.Request())
        view.backgroundColor = .green
    }
    
    func setupUI() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        button.center = view.center
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .black
    }
    
    func displayStart() {
        button.backgroundColor = .white
    }

    func displayOther() {
        
    }

}

