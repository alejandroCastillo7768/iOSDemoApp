//
//  UIView+Extension.swift
//  iOSDemoApp
//
//  Created by Alejandro Castillo on 28/03/2022.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView,
             top:        CGFloat = 0.0,
             leading:    CGFloat = 0.0,
             trailing:   CGFloat = 0.0,
             bottom:     CGFloat = 0.0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo:     superView.topAnchor,     constant: top).isActive       = true
        bottomAnchor.constraint(equalTo:  superView.bottomAnchor,  constant: bottom).isActive    = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading).isActive   = true
        rightAnchor.constraint(equalTo:   superView.rightAnchor,   constant: trailing).isActive  = true
    }
    
    func borderConfiguration(borderWidth: CGFloat? = nil,
                             borderColor: UIColor? = nil,
                             cornerRadius: CGFloat? = nil,
                             masksToBounds: Bool? = nil) {
        
        if let _borderWith = borderWidth {
            layer.borderWidth = _borderWith
        }
        
        if let _borderColor = borderColor {
            layer.borderColor = _borderColor.cgColor
        }
        
        if let _cornerRadius = cornerRadius {
            layer.cornerRadius = _cornerRadius
        }
        
        if let masksToBounds_ = masksToBounds {
            layer.masksToBounds = masksToBounds_
        }
    }
}
