//
//  ViewController.swift
//  serastvorovSW1
//
//  Created by Сергей Растворов on 10/15/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        testButton.center = view.center
        view.addSubview(testButton)
    }


}

