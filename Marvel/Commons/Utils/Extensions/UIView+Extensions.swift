//
//  UIView+Extensions.swift
//  Marvel
//
//  Created by Marcio Alico on 12/30/21.
//

import UIKit

extension UIView {
    
    public func roundCorners(with radius: CGFloat = 8) {
        self.layer.cornerRadius = radius
    }
    
    public func addShadow(radius: CGFloat = 8,
                          offsetX: CGFloat = 0,
                          offsetY: CGFloat = 8,
                          color: CGColor = UIColor.black.cgColor,
                          opacity: Float = 0.1) {
        self.layer.shadowColor = color
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
    }
    
    public func addBorder(color: CGColor = UIColor.black.cgColor,
                          width: Double = 0.5) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
}
