//
//  AnimeTagResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimeTagResponse: BaseResponse {
    var name: String?
    
    private enum DataKeys: String, CodingKey {
        case name
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.name = try? dataContainer.decode(String.self, forKey: .name)
        }
    }
}
