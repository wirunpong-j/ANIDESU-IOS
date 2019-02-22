//
//  AnimeHeaderCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 21/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AnimeHeaderCell: UITableViewCell {
    static let nibFile = UINib(nibName: "AnimeHeaderCell", bundle: .main)
    static let identifier = "AnimeHeaderCell"

    @IBOutlet weak var titleLabel: AnidesuLabel!
    @IBOutlet weak var studioTitleLabel: AnidesuLabel!
    @IBOutlet weak var descLabel: AnidesuLabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var shadowCoverView: UIView!
    
    func setUpCell(anime: AnimeResponse) {
        titleLabel.text = anime.title?.romanjiTitle ?? "N/A"
        descLabel.text = anime.description ?? "N/A"
        if let imageUrl = anime.coverImage?.sizeXLarge {
            coverImageView.setRoundImageView(urlStr: imageUrl, borderColor: .White, borderWidth: 2, radius: 5)
            shadowCoverView.layer.cornerRadius = 5
            shadowCoverView.layer.shadowOffset = CGSize(width: 5, height: 5)
            shadowCoverView.layer.shadowRadius = 5
            shadowCoverView.layer.shadowOpacity = 0.5
            shadowCoverView.layer.masksToBounds = false
        }
    }
    
}
