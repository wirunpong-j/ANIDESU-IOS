//
//  AnimeGenresSectionController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/3/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import IGListKit

class AnimeGenresSectionController: ListSectionController {
    var animeDiffable: AnimeResponseDiffable?
    let colors = [AnidesuColor.Amber.color(),
                  AnidesuColor.Black.color(),
                  AnidesuColor.Blue.color(),
                  AnidesuColor.BlueGreen.color(),
                  AnidesuColor.Coral.color(),
                  AnidesuColor.DarkBlue.color(),
                  AnidesuColor.DarkBlueGreen.color(),
                  AnidesuColor.DarkGray.color(),
                  AnidesuColor.Facebook.color()]
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func numberOfItems() -> Int {
        return self.animeDiffable?.anime.genres?.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        var width: CGFloat = 50
        if let text = animeDiffable?.anime.genres?[index] {
            let nsTitle = NSString(string: text)
            width = nsTitle.size(withAttributes: [NSAttributedString.Key.font: AnidesuFontSize.ExtraTinyMed.getFont()]).width
        }
        return CGSize(width: width + 16, height: 20)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: GenreCell.identifier, bundle: nil, for: self, at: index) as! GenreCell
        
        if let genre = animeDiffable?.anime.genres?[index] {
            cell.setUpCell(text: genre, color: colors[index])
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.animeDiffable = object as? AnimeResponseDiffable
    }
    
    override func didSelectItem(at index: Int) {
//        let storyboard = UIStoryboard(name: "AnimeDetail", bundle: Bundle.main)
//        if let viewController = storyboard.instantiateInitialViewController() as? AnimeDetailViewController {
//            if let anime = animePageDiffable?.anime?[index] {
//                viewController.animeID = anime.id
//            }
//            self.viewController?.present(viewController, animated: true, completion: nil)
//        }
    }
}
