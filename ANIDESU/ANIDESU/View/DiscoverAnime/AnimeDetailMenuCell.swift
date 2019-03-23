//
//  AnimeDetailMenuCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 23/3/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

protocol AnimeDetailMenuCellDelegate {
    func menuButtonTapped(index: Int)
}

class AnimeDetailMenuCell: UICollectionViewCell {
    static let nibFile = UINib(nibName: "AnimeDetailMenuCell", bundle: .main)
    static let identifier = "AnimeDetailMenuCell"
    static let width = CGFloat(80)
    static let height = CGFloat(20)

    @IBOutlet weak var menuButton: AnidesuButton!
    
    var index: Int!
    var delegate: AnimeDetailMenuCellDelegate!
    
    override var isSelected: Bool {
        didSet {
            self.setButtonStyle()
        }
    }
    
    func setUpCell(menu: AnimeDetailMenuType) {
        menuButton.setTitle(menu.getTitle(), for: .normal)
        menuButton.titleLabel?.font = AnidesuFontSize.TinyBold.getFont()
    }
    
    private func setButtonStyle() {
        let color = isSelected ? AnidesuColor.DarkBlue.color() : AnidesuColor.Gray.color()
        menuButton.setTitleColor(color, for: .normal)
    }
    
    @IBAction func menuButtonTapped(_ sender: AnidesuButton) {
        delegate.menuButtonTapped(index: index)
    }
}
