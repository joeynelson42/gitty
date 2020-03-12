//
//  RootViewController.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: - Properties
    var dependencyContainer: DependencyContainer
    
    // MARK: - Life Cycle
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchViewController = dependencyContainer.buildUserSearchViewController()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        add(childController: navigationController, toView: view)
    }
}
