//
//  UIViewController+Children.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func add(childController: UIViewController, toView containerView: UIView? = nil) {
        childController.willMove(toParent: self)
        addChild(childController)
        childController.didMove(toParent: self)
        
        if let containerView = containerView {
          containerView.addAutoLayoutSubview(childController.view)
          childController.view.fillSuperview()
        }
    }
}
