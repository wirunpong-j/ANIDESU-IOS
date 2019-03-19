//
//  AnimeGenresCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/3/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import IGListKit

class AnimeGenresCell: UITableViewCell {
    static let nibFile = UINib(nibName: "AnimeGenresCell", bundle: .main)
    static let identifier = "AnimeGenresCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter: ListAdapter!
    var anime: AnimeResponse!
    
    func setUpCell(adapter: ListAdapter, anime: AnimeResponse) {
        self.adapter = adapter
        self.anime = anime
        self.adapter.collectionView = collectionView
        self.adapter.dataSource = self
    }
}

extension AnimeGenresCell: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [AnimeResponseDiffable(anime: anime)]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return AnimeGenresSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
