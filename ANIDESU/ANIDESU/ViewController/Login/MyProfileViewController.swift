//
//  MyProfileViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 26/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MyProfileViewController: BaseViewController {
    static let identifier = "MyProfileViewController"
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var grandientView: AnidesuGradientView!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var settingButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var navbar: UINavigationBar!
    
    let viewModel = MyProfileViewModel()
    let disposedBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavbar()
        self.setUpTableView()
        self.setUpViewModel()
    }
    
    private func setUpTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(MyProfileHeaderViewCell.nibFile, forCellReuseIdentifier: MyProfileHeaderViewCell.identifier)
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
        
        viewModel.getUserDataCompleted.subscribe(onNext: { (isCompleted) in
            self.profileTableView.reloadData()
        }).disposed(by: disposedBag)
        
        viewModel.logoutIsCompleted.subscribe(onNext: { (isCompleted) in
            NotificationCenter.default.post(name: NSNotification.Name(BaseNavbarViewController.NOTI_PROFILE_IMAGE_CHANGE), object: nil)
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposedBag)
        
        viewModel.getUserData()
    }
    
    private func setUpNavbar() {
        navbar.setBackgroundImage(UIImage(), for: .default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        navbar.backgroundColor = .clear
        self.setUpBarButtonView()
    }
    
    private func setUpBarButtonView() {
        backButton.customView = self.getButtonView(imageName: "ic_back", action: #selector(self.backButtonTapped))
        settingButton.customView = self.getButtonView(imageName: "ic_dots", action: #selector(self.settingButtonTapped))
    }
    
    private func getButtonView(imageName: String, action: Selector) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: imageName), for: .normal)
        button.tintColor = AnidesuColor.White.color()
        button.layer.shadowColor = AnidesuColor.Black.color().cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1
        button.layer.masksToBounds = false
        button.addTarget(self, action: action, for: .touchUpInside)
        
        return button
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func settingButtonTapped() {
        let alert = UIAlertController(title: "Setting", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { (_) in
            self.viewModel.logout()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileHeaderViewCell.identifier) as! MyProfileHeaderViewCell
        cell.setUpCell()
        return cell
    }
}
