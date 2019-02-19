//
//  AnilistRouter.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import Alamofire

enum AnilistRouter: BaseRouter {
    case getAnimeListBySeason(page: Int, season: String)
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: apiUrl)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = Data()
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getAnimeListBySeason:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getAnimeListBySeason(let params):
            let query =
            """
query {
  Page (page: \(params.page)) {
    pageInfo {
      total
      currentPage
      lastPage
      hasNextPage
      perPage
    }
    media (season: \(params.season)) {
      id
      format
      title {
        english
        romaji
      }
      episodes
      status
      isAdult
      genres
      tags {
        name
      }
      nextAiringEpisode {
        episode
        timeUntilAiring
      }
    }
  }
}
"""
            return ["query": query]
        }
    }
    
    var path: String {
        return ""
    }
    
    
    var apiUrl: String {
        return "https://graphql.anilist.co"
    }
}
