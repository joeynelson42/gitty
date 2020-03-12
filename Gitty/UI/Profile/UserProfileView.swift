//
//  UserProfileView.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class UserProfileView: UIView {
    
    // MARK: - Properties
    
    // MARK: - Subviews
    let profileDetailsContainer = UIView()
    let repositoryListContainer = UIView()
    
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
        backgroundColor = .white
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "UserProfileView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        
        addAutoLayoutSubview(profileDetailsContainer)
        addAutoLayoutSubview(repositoryListContainer)
        
        repositoryListContainer.fillSuperview()
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            profileDetailsContainer.topAnchor.constraint(equalTo: topAnchor),
            profileDetailsContainer.leftAnchor.constraint(equalTo: leftAnchor),
            profileDetailsContainer.rightAnchor.constraint(equalTo: rightAnchor),
            profileDetailsContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            ])
    }
}

