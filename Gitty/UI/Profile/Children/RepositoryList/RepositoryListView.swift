//
//  RepositoryListView.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class RepositoryListView: UIView {
    
    // MARK: - Subviews
    let table = UITableView()
    
    // MARK: - Initialization
    convenience init() {
        self.init(frame: .zero)
        configureSubviews()
        configureTesting()
        configureLayout()
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        backgroundColor = .clear
        
        table.register(SearchBarTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "searchHeader")
        table.register(RepositoryListTableViewCell.self, forCellReuseIdentifier: "repoCell")
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "RepositoryListView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(table)
        table.fillSuperview()
    }
}

