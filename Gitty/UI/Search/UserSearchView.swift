//
//  UserSearchView.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class UserSearchView: UIView {
    
    // MARK: - Properties
    
    // MARK: - Subviews
    
    
    // MARK: - Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    
    
    // MARK: - Initialization
    
    convenience init() {
        self.init(frame: .zero)
        configureSubviews()
        configureTesting()
        configureLayout()
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "UserSearchView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            
            ])
    }
}
