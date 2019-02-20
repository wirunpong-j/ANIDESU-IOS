//
//  AnilistManager.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnilistManager {
    func getAnimeListBySeason(page: Int, season: String, completion: @escaping (AnimePageResponse) -> (), onFailure: @escaping (BaseError) -> ()) {
        
        let router = AnilistRouter.getAnimeListBySeason(page: page, season: season)
        
        APIManager.request(withRouter: router, responseType: AnimePageResponse.self, completion: { (response) in
            completion(response)
        }) { (error) in
            onFailure(error)
        }
    }
}
