//
//  UserSearchViewController.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {
    
    // MARK: - Properties
    var userDataProvider: GithubUserDataProvider
    
    // MARK: - View
    let baseView = UserSearchView()
    
    // MARK: - Life Cycle
    init(userDataProvider: GithubUserDataProvider) {
        self.userDataProvider = userDataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = baseView
        setupViewOnLoad()
    }
    
    /// Setup View upon loading ViewController (e.g. add targets to buttons, update labels with data, etc.)
    func setupViewOnLoad() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDataProvider.getSearchResults(forKeyword: "nelson", page: 0) { (users, errorMessage) in
            
        }
    }
}
