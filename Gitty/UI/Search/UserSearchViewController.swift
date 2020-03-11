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
    
    // MARK: - View
    private let baseView = UserSearchView()
    
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
        print(user.username)
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
        
        return cell
    }
}
