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
    private let imageDataProvider: ImageDataProvider
    private let controllerFactory: ViewControllerFactory
    
    // Children
    private var detailsController: ProfileDetailsViewController!
    private var listController: RepositoryListViewController!
    
    // MARK: - View
    let baseView = UserProfileView()
    
    // MARK: - Life Cycle
    init(user: GithubUser, dataProvider: GithubUserDataProvider, imageDataProvider: ImageDataProvider, controllerFactory: ViewControllerFactory) {
        self.user = user
        self.dataProvider = dataProvider
        self.imageDataProvider = imageDataProvider
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
        title = user.username
        
        detailsController = ProfileDetailsViewController.init(imageDataProvider: imageDataProvider)
        add(childController: detailsController, toView: baseView.profileDetailsContainer)
        
        listController = RepositoryListViewController()
        listController.delegate = self
        add(childController: listController, toView: baseView.repositoryListContainer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataProvider.getUserProfile(forUser: user) { [weak self] (profile, _) in
            guard let profile = profile else { return }
            self?.detailsController.set(profileDetails: profile)
        }
        
        dataProvider.getRepos(forUser: user) { [weak self] (repos, _) in
            self?.listController.set(repositories: repos)
        }
    }
}

extension UserProfileViewController: RepositoryListViewControllerDelegate {
    func didSelect(repository: GithubRepository, controller: RepositoryListViewController) {
        let detailController = controllerFactory.buildRepositoryDetailViewController(repository: repository)
        present(detailController, animated: true)
    }
}
