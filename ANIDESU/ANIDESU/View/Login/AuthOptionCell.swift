//
//  AuthOptionCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AuthOptionCell: UITableViewCell {
    static let nibFile = UINib(nibName: "AuthOptionCell", bundle: .main)
    static let identifier = "AuthOptionCell"
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func authButtonTapped(_ sender: UIButton) {
        
    }
    
}
