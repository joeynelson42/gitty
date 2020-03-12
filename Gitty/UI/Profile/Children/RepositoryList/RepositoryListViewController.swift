//
//  RepositoryListViewController.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {
    
    // MARK: - Properties
    private var repositories: [GithubRepository] = [] {
        didSet {
            filtered = self.repositories
        }
    }
    
    private var filtered: [GithubRepository] = [] {
        didSet {
            baseView.table.reloadData()
        }
    }
    
    // MARK: - View
    let baseView = RepositoryListView()
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        view = baseView
        setupViewOnLoad()
    }
    
    /// Setup View upon loading ViewController (e.g. add targets to buttons, update labels with data, etc.)
    func setupViewOnLoad() {
        baseView.table.delegate = self
        baseView.table.dataSource = self
    }
    
    public func set(repositories: [GithubRepository]) {
        self.repositories = repositories
    }
}

extension RepositoryListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = repositories.filter { $0.name.contains(searchText) }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text == "" {
            filtered = repositories
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

// UIScrollViewDelegate
extension RepositoryListViewController {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        baseView.endEditing(true)
    }
}

extension RepositoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension RepositoryListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepositoryListTableViewCell
        let repo = filtered[indexPath.row]
        cell.nameLabel.text = repo.name
        cell.starCountLabel.text = "🌟: \(repo.stargazersCount)"
        cell.forkCountLabel.text = "🍴: \(repo.forksCount)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "searchHeader") as! SearchBarTableViewHeader
        header.delegate = self
        return header
    }
}
