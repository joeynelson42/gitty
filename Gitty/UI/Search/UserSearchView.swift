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
    let searchBar = UISearchBar()
    let table = UITableView()
    
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
        
        searchBar.autocorrectionType = .no
        searchBar.autocapitalizationType = .none
        
        table.register(UserSearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "UserSearchView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        
        addAutoLayoutSubview(searchBar)
        addAutoLayoutSubview(table)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeTopAnchor),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            table.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            table.leftAnchor.constraint(equalTo: leftAnchor),
            table.bottomAnchor.constraint(equalTo: bottomAnchor),
            table.rightAnchor.constraint(equalTo: rightAnchor),
            ])
    }
}

