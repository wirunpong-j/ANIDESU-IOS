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
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private enum Sections: Int {
        case option, field
    }
    
    private enum Rows: Int {
        case signIn, signUp
    }
    
    private enum AuthOptions {
        case signIn, signUp
    }
    
    private var option = AuthOptions.signIn
    
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
        authTableView.register(SignUpViewCell.nibFile, forCellReuseIdentifier: SignUpViewCell.identifier)

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

extension LoginViewController: AuthOptionCellDelegate {
    func signInTapped() {
        if option == .signUp {
            option = .signIn
            authTableView.reloadSections([Sections.field.rawValue], with: .automatic)
            self.animateTableViewContract()
        }
    }
    
    func signUpTapped() {
        if option == .signIn {
            option = .signUp
            authTableView.reloadSections([Sections.field.rawValue], with: .automatic)
            self.animateTableViewExtend()
        }
    }
    
    private func animateTableViewExtend() {
        self.tableViewHeight.constant = 500
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateTableViewContract() {
        self.tableViewHeight.constant = 320
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
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
            cell.delegate = self
            return cell
        case .field:
            switch option {
            case .signIn:
                let cell = tableView.dequeueReusableCell(withIdentifier: SignInViewCell.identifier) as! SignInViewCell
                return cell
            case .signUp:
                let cell = tableView.dequeueReusableCell(withIdentifier: SignUpViewCell.identifier) as! SignUpViewCell
                return cell
            }
        }
    }
}
