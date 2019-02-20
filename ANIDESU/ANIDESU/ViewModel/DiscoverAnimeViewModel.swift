//
//  DiscoverAnimeViewModel.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import RxCocoa
import RxSwift

class DiscoverAnimeViewModel {
    var anilistManager = AnilistManager()
    
    var animePage = [AnimePageResponse]()
    
    let isLoading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    let isCompleted = PublishSubject<Bool>()
    
    func getAnimeListBySeason(season: AnimeSeason) {
        anilistManager.getAnimeListBySeason(page: 1, season: season.rawValue.uppercased(), completion: { (response) in
            self.animePage.append(response)
            self.isCompleted.onNext(true)
        }) { (errorObj) in
            self.error.onNext(errorObj.errorMessage)
        }
    }
}
