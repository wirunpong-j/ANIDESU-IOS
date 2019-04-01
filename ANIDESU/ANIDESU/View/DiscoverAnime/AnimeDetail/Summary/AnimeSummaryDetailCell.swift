//
//  AnimeSummaryDetailCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 1/4/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AnimeSummaryDetailCell: UITableViewCell {
    static let nibFile = UINib(nibName: "AnimeSummaryDetailCell", bundle: .main)
    static let identifier = "AnimeSummaryDetailCell"
    
    @IBOutlet weak var subjectTitleLabel: AnidesuLabel!
    @IBOutlet weak var descTitleLabel: AnidesuLabel!
    
    func setUpCell(subjectTitle: String, descTtitle: String) {
        subjectTitleLabel.text = subjectTitle
        descTitleLabel.text = descTtitle
    }
    
}
