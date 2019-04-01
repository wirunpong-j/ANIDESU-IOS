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
    @IBOutlet weak var descLabel: AnidesuLabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var shadowCoverView: UIView!
    @IBOutlet weak var formatLabel: AnidesuLabel!
    @IBOutlet weak var addToListButton: AnidesuButton!
    @IBOutlet weak var optionButton: UIButton!
    
    func setUpCell(anime: AnimeResponse) {
        titleLabel.text = anime.title?.romanjiTitle ?? "N/A"
        descLabel.text = anime.description ?? ""
        formatLabel.text = self.getAnimeType(anime: anime)
        
        if let imageUrl = anime.coverImage?.sizeXLarge {
            coverImageView.setRoundImageView(urlStr: imageUrl, borderColor: .White, borderWidth: 2, radius: 5)
            shadowCoverView.layer.cornerRadius = 5
            shadowCoverView.layer.shadowOffset = CGSize(width: 5, height: 5)
            shadowCoverView.layer.shadowRadius = 5
            shadowCoverView.layer.shadowOpacity = 0.5
            shadowCoverView.layer.masksToBounds = false
            if let color = anime.coverImage?.color {
                addToListButton.changeBackgroundColor(color: UIColor().hexStringToUIColor(hex: (color)))
                optionButton.tintColor = UIColor().hexStringToUIColor(hex: (color))
            }
        }
    }
    
    private func getAnimeType(anime: AnimeResponse) -> String {
        var type = [String]()
        if let format = anime.format {
            type.append(format)
        }
        if let season = anime.season {
            type.append(season)
        }
        if let year = anime.startDate?.year {
            type.append("\(year)")
        }
        
        return type.joined(separator: " ・ ")
    }
    
    @IBAction func addToListTapped(_ sender: Any) {
    }
    
    @IBAction func optionButtonTapped(_ sender: Any) {
    }
}
