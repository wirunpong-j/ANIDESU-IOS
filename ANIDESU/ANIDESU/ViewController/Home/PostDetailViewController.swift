//
//  PostDetailViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 9/4/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PostDetailViewController: BaseViewController {
    static let identifier = "PostDetailViewController"

    @IBOutlet weak var postTableView: UITableView!
    
    let viewModel = PostViewModel()
    let disposedBag = DisposeBag()
    var postID: String!
    
    private enum Sections: Int {
        case post, comment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setUpViewModel()
        self.setUpView()
    }
    
    private func setUpTableView() {
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(PostCell.nibFile, forCellReuseIdentifier: PostCell.identifier)
        postTableView.register(CommentCell.nibFile, forCellReuseIdentifier: CommentCell.identifier)
    }
    
    private func setUpViewModel() {
        viewModel.error.subscribe(onNext: { (errorMessage) in
            self.showAlert(title: "Error", message: errorMessage, completion: nil)
        }).disposed(by: disposedBag)
        
        viewModel.isLoading.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoading()
            } else {
                self.hideLoading()
            }
        }).disposed(by: disposedBag)
        
        viewModel.fetchPostCompleted.subscribe(onNext: { (isCompleted) in
            self.setUpView()
        }).disposed(by: disposedBag)
        
        viewModel.fetchPost(id: postID)
    }
    
    private func setUpView() {
        postTableView.reloadData()
    }
}

extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .post:
            return (viewModel.post == nil) ? 0 : 1
        case .comment:
            return viewModel.post?.comments?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .post:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier) as! PostCell
            if let post = viewModel.post {
                cell.setUpCell(post: post, useFrame: false)
            }
            return cell
        case .comment:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier) as! CommentCell
            if let comment = viewModel.post?.comments?[indexPath.row] {
                cell.setUpCell(comment: comment)
            }
            return cell
        }
    }
}
