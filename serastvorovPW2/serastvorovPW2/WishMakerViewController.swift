//
//  WishMakerViewController.swift
//  serastvorovPW2
//
//  Created by Сергей Растворов on 11/3/24.
//

import UIKit

final class WishMakerViewController: UIViewController {
    enum Constants {
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
        
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        
        static let stackRadius: CGFloat = 20
        static let stackBottom: CGFloat = -40
        static let stackLeading: CGFloat = 20
        
//        static let constraintTop: CGFloat = 30
        static let constraintLeading: CGFloat = 20
        static let constraintTop: CGFloat = 10
        
        static let titleFontSize: CGFloat = 32
        static let descriptionFontSize: CGFloat = 16
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemPink
        
        configureTitle()
        configureDescription()
        configureSliders()
    }
    
    private func configureTitle() {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "WishMaker"
//        title.font = UIFont.systemFont(ofSize: 32)
        title.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
//        title.textColor = UIColor.systemBlue
        
        view.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3 * Constants.constraintTop)
            ])
    }
    
    private func configureDescription() {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "This app will bring you joy and will fulfill your wishes! \nThe first wish is to change the background color"
        description.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
        description.numberOfLines = 0 // Позволяет метке занимать несколько строк
        description.textAlignment = .left // (опционально)

            view.addSubview(description)
            NSLayoutConstraint.activate([
                description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.constraintLeading),
                description.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2 * Constants.constraintTop + 2 * Constants.titleFontSize),
                description.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constants.constraintLeading)
            ])
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
//        let sliderTest = CustomSlider(title: "Test", min: 0, max: 1)
        for slider in [sliderRed, sliderGreen, sliderBlue, /*sliderTest*/] {
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom)
        ])
        
//        sliderRed.valueChanged = {
//            [weak self] value in self?.view.backgroundColor = ...
//        }
    }
    
    final class CustomSlider: UIView {
        var valueChanged: ((Double) -> Void)?
        
        var slider = UISlider()
        var titleView = UILabel()
        
        init(title: String, min: Double, max: Double) {
            super.init(frame: .zero)
            titleView.text = title
            slider.minimumValue = Float(min)
            slider.maximumValue = Float(max)
            slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
            configureUI()
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configureUI() {
            backgroundColor = .white
            for view in [slider, titleView] {
                addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            NSLayoutConstraint.activate([
                titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
                titleView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.constraintTop),
                titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.constraintLeading),
                
                slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
                slider.centerXAnchor.constraint(equalTo: centerXAnchor),
                slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.constraintLeading),
                slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1 * Constants.constraintTop)
            ])
        }
        
        @objc
        private func sliderValueChanged() {
            valueChanged?(Double(slider.value))
        }
    }
}


