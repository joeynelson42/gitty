//
//  SearchBarTableViewHeader.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class SearchBarTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: Properties
    var delegate: UISearchBarDelegate? {
        didSet {
            searchBar.delegate = self.delegate
        }
    }
    
    // MARK: - Subviews
    private let searchBar = UISearchBar()
    
    // MARK: - Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    
    
    // MARK: - Initialization
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureSubviews()
        configureTesting()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "RepositoryListView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(searchBar)
        searchBar.fillSuperview()
    }
}

