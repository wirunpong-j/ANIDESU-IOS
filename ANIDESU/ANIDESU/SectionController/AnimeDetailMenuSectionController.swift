//
//  AnimeDetailMenuSectionController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 23/3/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import IGListKit

enum AnimeDetailMenuType: Int {
    case summary
    case episodes
    case reactions
    case franchise
    
    func getTitle() -> String {
        switch self {
        case .summary:
            return "Summary"
        case .episodes:
            return "Episodes"
        case .reactions:
            return "Reactions"
        case .franchise:
            return "Franchise"
        }
    }
}

class AnimeDetailMenuSectionController: ListSectionController {
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func numberOfItems() -> Int {
        return 4
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: AnimeDetailMenuCell.width, height: AnimeDetailMenuCell.height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: AnimeDetailMenuCell.identifier, bundle: nil, for: self, at: index) as! AnimeDetailMenuCell
        
        cell.setUpCell(menu: AnimeDetailMenuType(rawValue: index)!)
        cell.index = index
        cell.delegate = self
        
        if index == 0 {
            collectionContext?.selectItem(at: 0, sectionController: self, animated: false, scrollPosition: .centeredHorizontally)
            cell.isSelected = true
        }
        
        return cell
    }
}

extension AnimeDetailMenuSectionController: AnimeDetailMenuCellDelegate {
    func menuButtonTapped(index: Int) {
        collectionContext?.selectItem(at: index, sectionController: self, animated: true, scrollPosition: .centeredHorizontally)
        
        //        let storyboard = UIStoryboard(name: "AnimeDetail", bundle: Bundle.main)
        //        if let viewController = storyboard.instantiateInitialViewController() as? AnimeDetailViewController {
        //            if let anime = animePageDiffable?.anime?[index] {
        //                viewController.animeID = anime.id
        //            }
        //            self.viewController?.present(viewController, animated: true, completion: nil)
        //        }
    }
}
