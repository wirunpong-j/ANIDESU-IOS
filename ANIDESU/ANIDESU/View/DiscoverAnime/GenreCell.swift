//
//  GenreCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/3/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {
    static let nibFile = UINib(nibName: "GenreCell", bundle: .main)
    static let identifier = "GenreCell"
    
    @IBOutlet weak var genreButton: UIButton!
    @IBOutlet weak var buttonWidthConstraint: NSLayoutConstraint!
    
    func setUpCell(text: String, color: UIColor) {
        let nsTitle = NSString(string: text)
        let titleSize = nsTitle.size(withAttributes: [NSAttributedString.Key.font: AnidesuFontSize.ExtraTinyMed.getFont()])
        genreButton.setTitle(text, for: .normal)
        genreButton.titleLabel?.font = AnidesuFontSize.ExtraTinyMed.getFont()
        buttonWidthConstraint.constant = titleSize.width + 12
        genreButton.backgroundColor = color
        genreButton.layer.cornerRadius = 10
    }

    @IBAction func genreTapped(_ sender: Any) {
    }
}
