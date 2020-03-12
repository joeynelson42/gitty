//
//  UserProfileView.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class UserProfileView: UIView {
    
    // MARK: - Subviews
    let profileDetailsContainer = UIView()
    let repositoryListContainer = UIView()
    
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
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            profileDetailsContainer.topAnchor.constraint(equalTo: topAnchor),
            profileDetailsContainer.leftAnchor.constraint(equalTo: leftAnchor),
            profileDetailsContainer.rightAnchor.constraint(equalTo: rightAnchor),
            
            repositoryListContainer.topAnchor.constraint(equalTo: profileDetailsContainer.bottomAnchor),
            repositoryListContainer.leftAnchor.constraint(equalTo: leftAnchor),
            repositoryListContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            repositoryListContainer.rightAnchor.constraint(equalTo: rightAnchor),
            ])
    }
}

