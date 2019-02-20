//
//  AnimeCoverCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AnimeCoverCell: UICollectionViewCell {
    static let nibFile = UINib(nibName: "AnimeCoverCell", bundle: .main)
    static let identifier = "AnimeCoverCell"

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var animeTitleLabel: UILabel!
    
    func setUpCell(imageUrl: String?, title: String?) {
        self.coverImage.setImage(urlStr: imageUrl!)
        self.animeTitleLabel.text = title ?? "N/A"
    }

}
