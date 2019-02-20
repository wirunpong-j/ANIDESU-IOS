//
//  AnimeListSectionController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import IGListKit

class AnimeListSectionController: ListSectionController {
    var animePageDiffable: AnimePageDiffable?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 2, bottom: 4, right: 4)
    }
    
    override func numberOfItems() -> Int {
        return self.animePageDiffable?.anime?.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: (collectionContext!.containerSize.width / 2) - 4, height: 300)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: AnimeCoverCell.identifier, bundle: nil, for: self, at: index) as! AnimeCoverCell
        
        if let anime = animePageDiffable?.anime?[index] {
            cell.setUpCell(imageUrl: anime.coverImage?.sizeXLarge, title: anime.title?.romanjiTitle)
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.animePageDiffable = object as? AnimePageDiffable
    }
    
    override func didSelectItem(at index: Int) {
        
    }
}
