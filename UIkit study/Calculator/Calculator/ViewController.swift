//
//  ViewController.swift
//  Calculator
//
//  Created by Сергей Растворов on 4/3/25.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonPresed(_ sender: UIButton) {
//        print(sender)
        if let buttonText = sender.configuration?.title {
            print(buttonText)
        } else {
            print("currentTitle is nil")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hello world")
    }

}
