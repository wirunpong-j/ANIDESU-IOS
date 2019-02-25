//
//  AuthOptionCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

protocol AuthOptionCellDelegate {
    func signInTapped()
    func signUpTapped()
}

class AuthOptionCell: UITableViewCell {
    static let nibFile = UINib(nibName: "AuthOptionCell", bundle: .main)
    static let identifier = "AuthOptionCell"
    
    @IBOutlet weak var signInButton: AnidesuButton!
    @IBOutlet weak var signUpButton: AnidesuButton!
    
    var delegate: AuthOptionCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.changeButtonStyle(isSignIn: true, isSignUp: false)
    }

    @IBAction func authButtonTapped(_ sender: UIButton) {
        let button = sender as! AnidesuButton
        switch button {
        case signInButton:
            self.changeButtonStyle(isSignIn: true, isSignUp: false)
            delegate.signInTapped()
        case signUpButton:
            self.changeButtonStyle(isSignIn: false, isSignUp: true)
            delegate.signUpTapped()
        default:
            break
        }
    }
    
    private func changeButtonStyle(isSignIn: Bool, isSignUp: Bool) {
        signInButton.setTitleColor(isSignIn ? AnidesuColor.Green.color() : AnidesuColor.Gray.color(), for: .normal)
        signUpButton.setTitleColor(isSignUp ? AnidesuColor.Green.color() : AnidesuColor.Gray.color(), for: .normal)
    }
    
}
