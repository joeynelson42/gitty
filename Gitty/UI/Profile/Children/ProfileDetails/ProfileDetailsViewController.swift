//
//  ProfileDetailsViewController.swift
//  Gitty
//
//  Created by Joey Nelson on 3/11/20.
//  Copyright © 2020 nelsonje. All rights reserved.
//

import UIKit

class ProfileDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private var imageDataProvider: ImageDataProvider
    
    private var profileDetails: GithubUserProfileDetails? {
        didSet {
            bindDetailsToView()
        }
    }
    
    // MARK: - View
    let baseView = ProfileDetailsView()
    
    // MARK: - Life Cycle
    init(imageDataProvider: ImageDataProvider) {
        self.imageDataProvider = imageDataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = baseView
    }
    
    func set(profileDetails: GithubUserProfileDetails) {
        self.profileDetails = profileDetails
    }
    
    private func bindDetailsToView() {
        guard let profile = profileDetails else { return }
        if let urlStr = profile.avatarURL, let url = URL(string: urlStr) {
            imageDataProvider.getImage(for: url) { [weak self] (image, _) in
                self?.baseView.avatarImageView.image = image
            }
        }
        
        baseView.nameLabel.text = profile.name ?? "No name!"
        baseView.bioLabel.text = profile.bio ?? "No bio"
        baseView.emailLabel.text = profile.email ?? "No email"
        baseView.locationLabel.text = profile.location ?? "No location"
        baseView.followingLabel.text = "Following: \(profile.following)"
        baseView.followersLabel.text = "Followers: \(profile.followers)"
        
        if let joined = profile.joinDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            baseView.joinedLabel.text = "Joined on \(dateFormatter.string(from: joined))"
        }
    }
}
