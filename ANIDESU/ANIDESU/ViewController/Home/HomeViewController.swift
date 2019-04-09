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
import Firebase

class HomeViewController: BaseViewController {
    static let identifier = "HomeViewController"
    
    @IBOutlet weak var feedTableView: UITableView!
    
    let homeViewModel = HomeViewModel()
    let loginViewModel = LoginViewModel()
    let disposedBag = DisposeBag()
    
    private enum HomeSections: Int {
        case createPost, allPost
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        try! Auth.auth().signOut()
//        UserData.sharedInstance.logout()
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
        loginViewModel.error.subscribe(onNext: { (errorMessage) in
            self.showAlert(title: "Error", message: errorMessage, completion: nil)
        }).disposed(by: disposedBag)
        
        homeViewModel.error.subscribe(onNext: { (errorMessage) in
            self.showAlert(title: "Error", message: errorMessage, completion: nil)
        }).disposed(by: disposedBag)
        
        loginViewModel.isLoading.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoading()
            } else {
                self.hideLoading()
            }
        }).disposed(by: disposedBag)
        
        homeViewModel.isLoading.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoading()
            } else {
                self.hideLoading()
            }
        }).disposed(by: disposedBag)
        
        loginViewModel.loginIsCompleted.subscribe(onNext: { (isCompleted) in
            NotificationCenter.default.post(name: NSNotification.Name(BaseNavbarViewController.NOTI_PROFILE_IMAGE_CHANGE), object: nil)
        }).disposed(by: disposedBag)
        
        homeViewModel.fetchAllPostCompleted.subscribe(onNext: { (isCompleted) in
            self.setUpView()
        }).disposed(by: disposedBag)
        
        if UserData.sharedInstance.isLogin {
            loginViewModel.loginWithUID()
        }
        homeViewModel.fetchAllPost()
    }
    
    private func setUpView() {
        feedTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.setBackButton()
        switch segue.identifier {
        case PostDetailViewController.identifier:
            if let vc = segue.destination as? PostDetailViewController {
                vc.postID = sender as? String
            }
        default:
            break
        }
    }
    
    private func setBackButton() {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        backItem.tintColor = AnidesuColor.Blue.color()
        navigationItem.backBarButtonItem = backItem
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch HomeSections(rawValue: indexPath.section)! {
        case .createPost:
            break
        case .allPost:
            self.performSegue(withIdentifier: PostDetailViewController.identifier, sender: homeViewModel.posts[indexPath.row].key)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch HomeSections(rawValue: section)! {
        case .createPost:
            return 1
        case .allPost:
            return homeViewModel.posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeSections(rawValue: indexPath.section)! {
        case .createPost:
            let cell = tableView.dequeueReusableCell(withIdentifier: CreatePostCell.identifier) as! CreatePostCell
            return cell
        case .allPost:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier) as! PostCell
            cell.setUpCell(post: homeViewModel.posts[indexPath.row], useFrame: true)
            return cell
        }
    }
}
