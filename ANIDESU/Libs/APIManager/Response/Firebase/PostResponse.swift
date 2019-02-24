//
//  PostResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class PostResponse: BaseResponse {
    var uid: String?
    var content: String?
    var date: String?
    var likeCount: Int?
    var user: UserResponse?
    var key: String?
    var comments: [CommentResponse]?
    
    private enum DataKeys: String, CodingKey {
        case uid, content = "message", date = "post_date", likeCount = "like_count"
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.uid = try? dataContainer.decode(String.self, forKey: .uid)
            self.content = try? dataContainer.decode(String.self, forKey: .content)
            self.date = try? dataContainer.decode(String.self, forKey: .date)
            self.likeCount = try? dataContainer.decode(Int.self, forKey: .likeCount)
        }
    }
}
