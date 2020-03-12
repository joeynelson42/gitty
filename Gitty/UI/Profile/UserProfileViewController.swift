//
//  UserProfileViewController.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    // MARK: - Properties
    private let user: GithubUser
    private let dataProvider: GithubUserDataProvider
    private let controllerFactory: ViewControllerFactory
    
    // Children
    private var detailsController: ProfileDetailsViewController!
    private var listController: RepositoryListViewController!
    
    // MARK: - View
    let baseView = UserProfileView()
    
    // MARK: - Life Cycle
    init(user: GithubUser, dataProvider: GithubUserDataProvider, controllerFactory: ViewControllerFactory) {
        self.user = user
        self.dataProvider = dataProvider
        self.controllerFactory = controllerFactory
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
        detailsController = ProfileDetailsViewController.init(dataProvider: dataProvider)
        listController = RepositoryListViewController()
        
        add(childController: detailsController, toView: baseView.profileDetailsContainer)
        add(childController: listController, toView: baseView.repositoryListContainer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
