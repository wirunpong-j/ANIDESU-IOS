//
//  HomeViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 13/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    static let identifier = "HomeViewController"
    
    @IBOutlet weak var feedTableView: UITableView!
    
    private enum HomeSections: Int {
        case createPost, allPost
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setUpViewModel()
        self.setUpView()
    }
    
    private func setUpTableView() {
        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
        self.feedTableView.register(CreatePostCell.nibFile, forCellReuseIdentifier: CreatePostCell.identifier)
    }
    
    private func setUpViewModel() {
        
    }
    
    private func setUpView() {
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch HomeSections(rawValue: section)! {
        case .createPost:
            return 1
        case .allPost:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeSections(rawValue: indexPath.section)! {
        case .createPost:
            let cell = tableView.dequeueReusableCell(withIdentifier: CreatePostCell.identifier) as! CreatePostCell
            return cell
        case .allPost:
            return UITableViewCell()
        }
    }
}
