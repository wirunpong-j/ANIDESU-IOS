//
//  AnilistNameResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 23/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnilistNameResponse: BaseResponse {
    var firstName: String?
    var lastName: String?
    var native: String?
    
    private enum DataKeys: String, CodingKey {
        case first, last, native
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.firstName = try? dataContainer.decode(String.self, forKey: .first)
            self.lastName = try? dataContainer.decode(String.self, forKey: .last)
            self.native = try? dataContainer.decode(String.self, forKey: .native)
        }
    }
}
