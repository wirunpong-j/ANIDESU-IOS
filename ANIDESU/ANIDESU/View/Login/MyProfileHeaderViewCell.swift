//
//  MyProfileHeaderViewCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 26/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class MyProfileHeaderViewCell: UITableViewCell {
    static let nibFile = UINib(nibName: "MyProfileHeaderViewCell", bundle: .main)
    static let identifier = "MyProfileHeaderViewCell"
    
    @IBOutlet weak var shadowImageView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!

    func setUpCell() {
        if let imageUrl = UserData.sharedInstance.info?.profileImageUrl {
            profileImageView.setCircularImage(urlStr: imageUrl, borderWidth: 2, borderColor: .White)
            shadowImageView.layer.cornerRadius = shadowImageView.frame.height / 2
            shadowImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
            shadowImageView.layer.shadowRadius = 5
            shadowImageView.layer.shadowOpacity = 0.5
            shadowImageView.layer.masksToBounds = false
        }
    }
    
}
