//
//  ProfileDetailsView.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class ProfileDetailsView: UIView {
    
    // MARK: - Subviews
    let avatarImageView = UIImageView()
    let bioLabel = UILabel()
    
    let labelStack = UIStackView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let locationLabel = UILabel()
    let joinedLabel = UILabel()
    let followersLabel = UILabel()
    let followingLabel = UILabel()
    
    // MARK: - Initialization
    convenience init() {
        self.init(frame: .zero)
        configureSubviews()
        configureTesting()
        configureLayout()
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.clipsToBounds = true
        
        bioLabel.textColor = .darkText
        bioLabel.numberOfLines = 0
        bioLabel.lineBreakMode = .byWordWrapping
        
        for label in [nameLabel, emailLabel, locationLabel, joinedLabel, followersLabel, followingLabel] {
            label.font = UIFont.init(name: "Avenir", size: 12)
            label.textColor = .darkText
            labelStack.addArrangedSubview(label)
        }
        
        labelStack.axis = .vertical
        labelStack.alignment = .leading
        labelStack.distribution = .fillEqually
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "ProfileDetailsView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        
        addAutoLayoutSubview(avatarImageView)
        addAutoLayoutSubview(labelStack)
        addAutoLayoutSubview(bioLabel)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: safeTopAnchor, constant: 24),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            
            labelStack.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            labelStack.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 12),
            labelStack.rightAnchor.constraint(equalTo: rightAnchor),
            
            bioLabel.topAnchor.constraint(equalTo: labelStack.bottomAnchor, constant: 12),
            bioLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            bioLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            bioLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
            ])
    }
}

