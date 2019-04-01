//
//  AnimeDetailSectionHeaderCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 1/4/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AnimeDetailSectionHeaderView: UIView {
    
    @IBOutlet weak var titleLabel: AnidesuLabel!
    
    
    static func loadViewFromNib() -> AnimeDetailSectionHeaderView {
        return Bundle.main.loadNibNamed("AnimeDetailSectionHeaderView", owner: self, options: nil)!.first as! AnimeDetailSectionHeaderView
    }
    
    static func loadViewFormNib(title: String) -> AnimeDetailSectionHeaderView {
        let view = AnimeDetailSectionHeaderView.loadViewFromNib()
        view.titleLabel.text = title
        return view
    }

}
