//
//  AnimeGenresCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/3/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import IGListKit

class AnimeDetailCollectionViewCell: UITableViewCell {
    static let nibFile = UINib(nibName: "AnimeDetailCollectionViewCell", bundle: .main)
    static let identifier = "AnimeDetailCollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter: ListAdapter!
    var anime: AnimeResponse!
    var isAnimeDetailMenu = false
    
    func setUpCell(adapter: ListAdapter, anime: AnimeResponse, isAnimeDetailMenu: Bool) {
        self.isAnimeDetailMenu = isAnimeDetailMenu
        self.adapter = adapter
        self.anime = anime
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        collectionView.backgroundColor = AnidesuColor.Clear.color()
        if isAnimeDetailMenu {
            collectionView.backgroundColor = AnidesuColor.ExtraLightGray.color()
        }
        
        self.adapter.collectionView = collectionView
        self.adapter.dataSource = self
    }
}

extension AnimeDetailCollectionViewCell: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [AnimeResponseDiffable(anime: anime)]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if isAnimeDetailMenu {
            return AnimeDetailMenuSectionController()
        }
        return AnimeGenresSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
