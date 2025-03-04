//
//  CustomButton.swift
//  serastvorovSW1
//
//  Created by Сергей Растворов on 10/15/24.
//

import UIKit

class CustomButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = .cyan
        self.layer.cornerRadius = self.frame.size.width / 2
        self.addTarget(self, action: #selector(animateButton), for: .touchUpInside)
        self.setTitle("Press to start", for: .normal)
    }
    
    @objc private func animateButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = .systemPink
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: {
            _ in UIView.animate(withDuration: 0.5, animations: {self.transform = .identity; self.backgroundColor = .cyan})
        })
    }
}
