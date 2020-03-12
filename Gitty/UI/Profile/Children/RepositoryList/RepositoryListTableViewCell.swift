//
//  RepositoryListTableViewCell.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class RepositoryListTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    let nameLabel = UILabel()
    let starCountLabel = UILabel()
    let forkCountLabel = UILabel()
    
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
        backgroundColor = .white
        
        nameLabel.font = UIFont(name: "Avenir", size: 20)
        nameLabel.textColor = .darkText
        
        starCountLabel.font = UIFont(name: "Avenir", size: 13)
        starCountLabel.textColor = .darkText
        
        forkCountLabel.font = UIFont(name: "Avenir", size: 13)
        forkCountLabel.textColor = .darkText
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "RepositoryListTableViewCell"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        
        addAutoLayoutSubview(nameLabel)
        addAutoLayoutSubview(starCountLabel)
        addAutoLayoutSubview(forkCountLabel)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor),
            
            starCountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            starCountLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            
            forkCountLabel.centerYAnchor.constraint(equalTo: starCountLabel.centerYAnchor),
            forkCountLabel.leftAnchor.constraint(equalTo: starCountLabel.rightAnchor, constant: 12)
            ])
    }
}

