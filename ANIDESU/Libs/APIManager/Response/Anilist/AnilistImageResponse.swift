//
//  AnilistImageResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 23/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnilistImageResponse: BaseResponse {
    var largeSize: String?
    var mediumSize: String?
    
    private enum DataKeys: String, CodingKey {
        case large, medium
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.largeSize = try? dataContainer.decode(String.self, forKey: .large)
            self.mediumSize = try? dataContainer.decode(String.self, forKey: .medium)
        }
    }
}
