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
    private var searchResults: [GithubUser] = [] {
        didSet {
            baseView.table.reloadData()
        }
    }
    
    private var userDataProvider: GithubUserDataProvider
    private var imageDataProvider: ImageDataProvider
    private var controllerFactory: ViewControllerFactory
    
    // MARK: - View
    private let baseView = UserSearchView()
    
    // MARK: - Life Cycle
    init(userDataProvider: GithubUserDataProvider, imageDataProvider: ImageDataProvider, controllerFactory: ViewControllerFactory) {
        self.userDataProvider = userDataProvider
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
        title = "Search"
        
        baseView.searchBar.delegate = self
        
        baseView.table.dataSource = self
        baseView.table.delegate = self
    }
}

extension UserSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        userDataProvider.getSearchResults(forKeyword: searchText, page: 0) { [weak self] (users, errorMessage) in
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else {
                self?.searchResults = users
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// UIScrollViewDelegate
extension UserSearchViewController {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        baseView.searchBar.resignFirstResponder()
    }
}

extension UserSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let user = searchResults[indexPath.row]
        let profileViewController = controllerFactory.buildUserProfileViewController(user: user)
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension UserSearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! UserSearchTableViewCell
        let user = searchResults[indexPath.row]
        
        cell.usernameLabel.text = user.username
        
        if let url = URL(string: user.avatarURL) {
            imageDataProvider.getImage(for: url) { [weak cell] (image, _) in
                cell?.avatarImageView.image = image
            }
        }
        
        if let repos = user.repos {
            cell.repoLabel.text = "Repos: \(repos.count)"
        } else if indexPath.row == 0 { // limit so I don't blow through the GitHub API rate limit
            cell.startLoadingAnimation()
            userDataProvider.getUserProfile(forUser: user) { (profile, _) in
                let count = profile != nil ? profile!.repoCount : 0
                cell.repoLabel.text = "Repos: \(count)"
                cell.endLoadingAnimation()
            }
        }
        
        return cell
    }
}
