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

extension AnimeDetailViewModel {
    enum SummaryDetailRows: Int {
        case studios, ep, status, premiered, ageRating, eng, rmj, jp, synonyms
        
        func getTitle() -> String {
            switch self {
            case .studios:
                return Localize.main(key: "anime_summary_detail_studios")
            case .ep:
                return Localize.main(key: "anime_summary_detail_ep")
            case .status:
                return Localize.main(key: "anime_summary_detail_status")
            case .premiered:
                return Localize.main(key: "anime_summary_detail_premiered")
            case .ageRating:
                return Localize.main(key: "anime_summary_detail_age")
            case .eng:
                return Localize.main(key: "anime_summary_detail_english_title")
            case .rmj:
                return Localize.main(key: "anime_summary_detail_romanized_title")
            case .jp:
                return Localize.main(key: "anime_summary_detail_japanese_title")
            case .synonyms:
                return Localize.main(key: "anime_summary_detail_synonyms_title")
            }
        }
    }
}
