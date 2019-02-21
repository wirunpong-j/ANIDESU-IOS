//
//  AnidesuGradientView.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 21/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AnidesuGradientView: UIView {
    @IBInspectable var startColor:   UIColor = .black
    @IBInspectable var endColor:     UIColor = .white
    @IBInspectable var startLocation: Double =   0.05
    @IBInspectable var endLocation:   Double =   0.95
    @IBInspectable var horizontalMode:  Bool =  false
    @IBInspectable var diagonalMode:    Bool =  false
    @IBInspectable var addRoundView:    Bool =  false
    @IBInspectable var cornerRadius:    Double =  0
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updatePoints()
        self.updateLocations()
        self.updateColors()
        self.setRoundCornersWithRadius()
    }
    
    private func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 1)
        }
    }
    
    private func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    
    private func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    private func setRoundCornersWithRadius() {
        if self.addRoundView {
            let bounds = self.bounds
            let maskLayer = CAShapeLayer()
            maskLayer.frame = bounds
            let maskPath = UIBezierPath(roundedRect: bounds,
                                        byRoundingCorners: [.allCorners],
                                        cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius))
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    func setUpColor(startColor: UIColor, endColor: UIColor) {
        self.startColor = startColor
        self.endColor = endColor
        self.layoutSubviews()
    }
}
