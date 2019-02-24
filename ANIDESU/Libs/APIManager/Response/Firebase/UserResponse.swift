//
//  UserResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class UserResponse: BaseResponse {
    var uid: String?
    var about: String?
    var displayName: String?
    var profileImageUrl: String?
    var email: String?
    
    private enum DataKeys: String, CodingKey {
        case uid, about, displayName = "display_name", profileImageUrl = "image_url_profile", email
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.uid = try? dataContainer.decode(String.self, forKey: .uid)
            self.about = try? dataContainer.decode(String.self, forKey: .about)
            self.displayName = try? dataContainer.decode(String.self, forKey: .displayName)
            self.profileImageUrl = try? dataContainer.decode(String.self, forKey: .profileImageUrl)
            self.email = try? dataContainer.decode(String.self, forKey: .email)
        }
    }
}
