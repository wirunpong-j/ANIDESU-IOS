//
//  SignInViewCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

protocol SignInViewCellDelegate {
    func signIn()
    func signInWithFacebook()
    func forgotPassword()
}

class SignInViewCell: UITableViewCell {
    static let nibFile = UINib(nibName: "SignInViewCell", bundle: .main)
    static let identifier = "SignInViewCell"

    @IBOutlet weak var emailTextField: AnidesuTextField!
    @IBOutlet weak var passwordTextField: AnidesuTextField!
    
    var delegate: SignInViewCellDelegate!
    
    @IBAction func signInTapped(_ sender: Any) {
        self.delegate.signIn()
    }
    
    @IBAction func facebookTapped(_ sender: Any) {
        self.delegate.signInWithFacebook()
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        self.delegate.forgotPassword()
    }
}
