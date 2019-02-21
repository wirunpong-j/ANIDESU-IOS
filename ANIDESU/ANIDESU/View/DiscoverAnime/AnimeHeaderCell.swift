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
    
    func setUpCell(anime: AnimeResponse) {
        self.titleLabel.text = anime.title?.romanjiTitle ?? "N/A"
        self.descLabel.text = anime.description ?? "N/A"
    }
    
}
