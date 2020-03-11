//
//  UserSearchTableViewCell.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class UserSearchTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    let avatarImageView = UIImageView()
    let usernameLabel = UILabel()
    let repoLabel = UILabel()
    let loadingSpinner = UIActivityIndicatorView()
    
    // MARK: - Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        configureTesting()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.clipsToBounds = true
        avatarImageView.backgroundColor = .lightGray
        
        usernameLabel.textColor = .darkText
        usernameLabel.font = UIFont(name: "Avenir", size: 16)
        
        repoLabel.textColor = .darkText
        repoLabel.font = UIFont(name: "Avenir", size: 14)
        repoLabel.textAlignment = .right
        repoLabel.text = "Repo: "
        
        loadingSpinner.tintColor = .blue
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "UserSearchTableViewCell"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        
        addAutoLayoutSubview(avatarImageView)
        addAutoLayoutSubview(usernameLabel)
        addAutoLayoutSubview(repoLabel)
        addAutoLayoutSubview(loadingSpinner)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 12),
            
            repoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            repoLabel.leftAnchor.constraint(equalTo: usernameLabel.rightAnchor),
            repoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            loadingSpinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingSpinner.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            ])
    }
}

