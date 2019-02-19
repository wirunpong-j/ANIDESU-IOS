//
//  ImageView+KF+RoundView.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(urlStr: String) {
        let url = URL(string: urlStr)
        self.kf.setImage(with: url)
    }
    
    func setCircularImage(urlStr: String, borderColor: AnidesuColor) {
        let url = URL(string: urlStr)
        self.kf.setImage(with: url)
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.color().cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
    func setCircularImage(image: UIImage, borderColor: AnidesuColor) {
        self.image = image
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.color().cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}
