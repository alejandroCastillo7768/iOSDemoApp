//
//  ViewCodable.swift
//  iOSDemoApp
//
//  Created by Alejandro Castillo on 28/03/2022.
//

import Foundation

protocol ViewCodable {
    /// Method to add the views to the view hierarchy
    func buildViewHierarchy()
    
    /// Add all the constraints to the views
    func setupConstraints()
    
    /// Make all the visual configurations on the view
    func configureView()
    
    /// Adds the touch events to the view
//    func setupTouchEvents()
}

extension ViewCodable {
    
    /// Method to be called after UIView init. All views should call this method.
    func setupView() {
        self.buildViewHierarchy()
        self.setupConstraints()
        self.configureView()
//        self.setupTouchEvents()
    }
}
