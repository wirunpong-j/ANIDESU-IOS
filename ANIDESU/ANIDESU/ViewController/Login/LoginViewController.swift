//
//  LoginViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: BaseViewController {
    static let identifier = "LoginViewController"
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var authTableView: UITableView!
    
    private enum Sections: Int {
        case option, field
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setUpView()
    }
    
    private func setUpTableView() {
        authTableView.delegate = self
        authTableView.dataSource = self
        authTableView.register(AuthOptionCell.nibFile, forCellReuseIdentifier: AuthOptionCell.identifier)
        authTableView.register(SignInViewCell.nibFile, forCellReuseIdentifier: SignInViewCell.identifier)
    }
    
    private func setUpView() {
        self.setUpBackButton()
    }
    
    private func setUpBackButton() {
        backButton.setImage(UIImage(named: "ic_back"), for: .normal)
        backButton.tintColor = AnidesuColor.White.color()
        backButton.layer.shadowColor = AnidesuColor.Black.color().cgColor
        backButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        backButton.layer.shadowOpacity = 0.5
        backButton.layer.shadowRadius = 1
        backButton.layer.masksToBounds = false
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .option:
            return 1
        case .field:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .option:
            let cell = tableView.dequeueReusableCell(withIdentifier: AuthOptionCell.identifier) as! AuthOptionCell
            return cell
        case .field:
            let cell = tableView.dequeueReusableCell(withIdentifier: SignInViewCell.identifier) as! SignInViewCell
            return cell
        }
    }
}
