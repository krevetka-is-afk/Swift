//
//  Triangle.swift
//  ElochkaGori
//
//  Created by Сергей Растворов on 10/16/24.
//

import UIKit

class TriangleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        createTriangle()
    }

    private func createTriangle() {
        let trianglePath = UIBezierPath()

        // Define triangle points for triangle
        trianglePath.move(to: CGPoint(x: bounds.width / 2, y: 0))
        trianglePath.addLine(to: CGPoint(x: 0, y: bounds.height))
        trianglePath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        trianglePath.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = trianglePath.cgPath
        shapeLayer.fillColor = UIColor.green.cgColor

        // Remove previous sublayers
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        layer.addSublayer(shapeLayer)
    }
}
