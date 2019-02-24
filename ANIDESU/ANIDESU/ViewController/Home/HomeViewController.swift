//
//  HomeViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 13/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: BaseViewController {
    static let identifier = "HomeViewController"
    
    @IBOutlet weak var feedTableView: UITableView!
    
    let viewModel = HomeViewModel()
    let disposedBag = DisposeBag()
    
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
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(CreatePostCell.nibFile, forCellReuseIdentifier: CreatePostCell.identifier)
        feedTableView.register(PostCell.nibFile, forCellReuseIdentifier: PostCell.identifier)
    }
    
    private func setUpViewModel() {
        viewModel.error.subscribe(onNext: { (errorMessage) in
            self.showAlert(title: "Errro", message: errorMessage, completion: nil)
        }).disposed(by: disposedBag)
        
        viewModel.isLoading.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoading()
            } else {
                self.hideLoading()
            }
        }).disposed(by: disposedBag)
        
        viewModel.fetchAllPostCompleted.subscribe(onNext: { (isCompleted) in
            self.setUpView()
        }).disposed(by: disposedBag)
        
        viewModel.fetchAllPost()
    }
    
    private func setUpView() {
        feedTableView.reloadData()
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
            return viewModel.posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeSections(rawValue: indexPath.section)! {
        case .createPost:
            let cell = tableView.dequeueReusableCell(withIdentifier: CreatePostCell.identifier) as! CreatePostCell
            return cell
        case .allPost:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier) as! PostCell
            cell.setUpCell(post: viewModel.posts[indexPath.row], useFrame: true)
            return cell
        }
    }
}
