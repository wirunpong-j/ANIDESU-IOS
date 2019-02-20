//
//  AnimePageDiffable.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import IGListKit

class AnimePageDiffable: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return "AnimePageDiffable" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.diffIdentifier().hash == object?.diffIdentifier().hash
    }
    
    var anime: [AnimeResponse]?
    
    init(anime: [AnimeResponse]?) {
        self.anime = anime ?? []
    }
}
