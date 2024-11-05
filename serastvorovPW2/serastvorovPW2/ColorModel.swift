//
//  ColorModel.swift
//  serastvorovPW2
//
//  Created by Сергей Растворов on 11/5/24.
//
import UIKit

struct ColorModel {
    var red: Double
    var green: Double
    var blue: Double
    
    func makeColor() -> UIColor {
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    func invertedColor() -> UIColor {
        return UIColor(red: 1 - CGFloat(red), green: 1 - CGFloat(green), blue: 1 - CGFloat(blue), alpha: 1.0)
    }
}

