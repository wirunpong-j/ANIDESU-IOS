//
//  FirestoreRouter.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FirestoreRouter {
    case fetchUserData(uid: String)
    case setUpProfile(uid: String, displayName: String, email: String, imageURL: String)
    case fetchAllPost
    case createPost(message: String)
    case fetchAllComment(postKey: String)
    case addComment(postKey: String, message: String)
    case fetchAllMyAnimeList
    case fetchMyAnimeList(animeID: Int)
    case updateMyAnimeList(animeID: Int, note: String, status: String, progress: Int, score: Int)
    case removeMyAnimeList(animeID: Int)
    case fetchAllReview
    case fetchReviewPage
    case addReviewAnime(animeID: Int, title: String, desc: String, rating: Double, reviewDate: String, uid: String)
    case updateReviewAnime(key: String, animeID: Int, title: String, desc: String, rating: Double, reviewDate: String, uid: String)
}

extension FirestoreRouter {
    
    var path: String {
        switch self {
        case .fetchUserData(let uid):
            return "users/\(uid)"
            
        case .setUpProfile(let params):
            return "users/\(params.uid)"
            
        case .createPost, .fetchAllPost:
            return "posts"
            
        case .fetchAllComment(let postKey):
            return "posts/\(postKey)/comment"
            
        case .addComment(let params):
            return "posts/\(params.postKey)/comment"
            
        case .fetchMyAnimeList(let animeID):
//            return "users/\(MyProfileModel.instance.uid)/list_anime/\(animeID)"
            return ""
            
        case .fetchAllMyAnimeList:
//            return "users/\(MyProfileModel.instance.uid)/list_anime"
            return ""
            
        case .updateMyAnimeList(let params):
//            return "users/\(MyProfileModel.instance.uid)/list_anime/\(params.animeID)"
            return ""
            
        case .removeMyAnimeList(let animeID):
//            return "users/\(MyProfileModel.instance.uid)/list_anime/\(animeID)"
            return ""
            
        case .fetchAllReview, .fetchReviewPage, .addReviewAnime:
            return "reviews"
            
        case .updateReviewAnime(let params):
            return "reviews/\(params.key)"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .setUpProfile(let params):
            return ["uid": params.uid,
                    "display_name": params.displayName,
                    "email": params.email,
                    "image_url_profile": params.imageURL,
                    "about": "Welcome To AniDesu."]
            
        case .createPost(let message):
            return [:]
//            return ["uid": MyProfileModel.instance.uid,
//                    "message": message,
//                    "post_date": AnidesuConverter.getCurrentTime(),
//                    "like_count": 0]
            
        case .addComment(let params):
            return [:]
//            return [ "uid": MyProfileModel.instance.uid,
//                     "comment_message": params.message,
//                     "comment_date": AnidesuConverter.getCurrentTime()]
            
        case .updateMyAnimeList(let params):
            return [:]
//            return ["anime_id": params.animeID,
//                    "note": params.note,
//                    "status": params.status.lowercased(),
//                    "progress": params.progress,
//                    "score": params.score,
//                    "date_time": AnidesuConverter.getCurrentTime()]
            
        case .addReviewAnime(let params):
            return ["anime_id": params.animeID,
                    "title": params.title,
                    "desc": params.desc,
                    "rating": params.rating,
                    "review_date": params.reviewDate,
                    "uid": params.uid]
            
        case .updateReviewAnime(let params):
            return ["anime_id": params.animeID,
                    "title": params.title,
                    "desc": params.desc,
                    "rating": params.rating,
                    "review_date": params.reviewDate,
                    "uid": params.uid]
            
        default:
            return nil
        }
    }
}
