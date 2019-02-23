//
//  AnimeDetailViewModel.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 23/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class AnimeDetailViewModel {
    var anilistManager = AnilistManager()
    
    var anime: AnimeResponse?
    
    let isLoading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    let isCompleted = PublishSubject<Bool>()
    
    func getAnimeByID(id: Int) {
        self.isLoading.onNext(true)
        anilistManager.getAnimeByID(id: id, completion: { (response) in
            self.anime = response
            self.isLoading.onNext(false)
            self.isCompleted.onNext(true)
        }) { (error) in
            self.isLoading.onNext(false)
            self.error.onNext(error.errorMessage)
        }
    }
}
