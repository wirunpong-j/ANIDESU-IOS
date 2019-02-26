//
//  CreatePostCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class CreatePostCell: UITableViewCell {
    static let nibFile = UINib(nibName: "CreatePostCell", bundle: .main)
    static let identifier = "CreatePostCell"

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    private func setUpView() {
//        profileImage.setCircularImage(urlStr: "", borderColor: .Clear)
        profileImage.setCircularImage(image: UIImage(named: "ic_user_default")!, borderWidth: 1, borderColor: .Clear)
        displayNameLabel.text = "Name"
        aboutLabel.text = "About"
        self.setBorderView()
    }
    
    private func setBorderView() {
        bgView.layer.shadowColor = AnidesuColor.Black.color().cgColor
        bgView.layer.shadowOffset = CGSize(width: 0, height: 5)
        bgView.layer.shadowOpacity = 0.1
        bgView.layer.shadowRadius = 5
    }
}
