//
//  AnimeResponseDiffable.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/3/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import IGListKit

class AnimeResponseDiffable: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return "AnimeResponseDiffable" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.diffIdentifier().hash == object?.diffIdentifier().hash
    }
    
    var anime: AnimeResponse!
    
    init(anime: AnimeResponse) {
        self.anime = anime
    }
}
