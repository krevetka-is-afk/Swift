//
//  Created by Сергей Растворов on 10/16/24.
//

import UIKit

class ViewController: UIViewController {
    private let triangle = TriangleView()
    private let treeTrunk = UIView()
    private var garlandCircles: [UIView] = []
    private var isGarlandOn = false
    private let toggleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupTree()
        setupGarland()
        setupToggleButton()
    }

    // Setup tree (triangle and trunk)
    private func setupTree() {
        // Triangle
        view.addSubview(triangle)
        triangle.pinCenterX(to: view.centerXAnchor)
        triangle.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 100)
        triangle.setWidth(mode: .equal, 260)
        triangle.setHeight(mode: .equal, 300)

        // Trunk
        treeTrunk.backgroundColor = .brown
        view.addSubview(treeTrunk)
        treeTrunk.pinCenterX(to: view.centerXAnchor)
        treeTrunk.pinTop(to: triangle.bottomAnchor)
        treeTrunk.setWidth(mode: .equal, 40)
        treeTrunk.setHeight(mode: .equal, 60)
    }

    // Setup garland circles
    private func setupGarland() {
        for _ in 0..<6 {
            let circle = UIView()
            circle.backgroundColor = .clear
            circle.layer.cornerRadius = 15
            circle.layer.masksToBounds = true
            garlandCircles.append(circle)
            view.addSubview(circle)
        }

        // Positioning circles on the tree
        for (i, circle) in garlandCircles.enumerated() {
            circle.setWidth(mode: .equal, 30)
            circle.setHeight(mode: .equal, 30)
            let offsetX = i < 3 ? Double(i - 1) * 50 : Double(i - 4) * 60
            let offsetY = i < 3 ? 30 : 80
            circle.pinCenterX(to: triangle.centerXAnchor, offsetX)
            circle.pinCenterY(to: triangle.centerYAnchor, Double(offsetY))
        }
    }

    // Setup toggle button
    private func setupToggleButton() {
        toggleButton.setTitle("Turn On", for: .normal)
        toggleButton.backgroundColor = .blue
        toggleButton.layer.cornerRadius = 10
        toggleButton.addTarget(self, action: #selector(toggleGarland), for: .touchUpInside)

        view.addSubview(toggleButton)
        toggleButton.setWidth(mode: .equal, 100)
        toggleButton.setHeight(mode: .equal, 50)
        toggleButton.pinCenterX(to: view.centerXAnchor)
        toggleButton.pinTop(to: treeTrunk.bottomAnchor, 40)
    }

    // Action to toggle garland on/off
    @objc private func toggleGarland() {
        isGarlandOn.toggle()
        toggleButton.setTitle(isGarlandOn ? "Turn Off" : "Turn On", for: .normal)

        if isGarlandOn {
            startGarlandAnimation()
        } else {
            stopGarlandAnimation()
        }
    }

    // Start garland blinking animation
    private func startGarlandAnimation() {
        UIView.animate(withDuration: 0.8, delay: 0.2, options: [.repeat, .autoreverse, .allowUserInteraction]) {
            self.garlandCircles.forEach { $0.backgroundColor = self.randomColor() }
        }
    }

    // Stop garland blinking
    private func stopGarlandAnimation() {
        garlandCircles.forEach { $0.layer.removeAllAnimations() }
        garlandCircles.forEach { $0.backgroundColor = .gray }
    }

    // Generate random color
    private func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}


