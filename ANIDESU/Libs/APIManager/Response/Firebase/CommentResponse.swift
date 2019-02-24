//
//  CommentResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class CommentResponse: BaseResponse {
    var date: String?
    var content: String?
    var uid: String?
    var user: UserResponse?
    var key: String?
    
    private enum DataKeys: String, CodingKey {
        case uid, date = "comment_date", content = "comment_message"
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.uid = try? dataContainer.decode(String.self, forKey: .uid)
            self.content = try? dataContainer.decode(String.self, forKey: .content)
            self.date = try? dataContainer.decode(String.self, forKey: .date)
        }
    }
}
