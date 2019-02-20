//
//  AnimeAiringResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimeAiringResponse: BaseResponse {
    var episode: Int?
    var timeUntilAiring: Int?
    
    private enum DataKeys: String, CodingKey {
        case episode, timeUntilAiring
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.episode = try? dataContainer.decode(Int.self, forKey: .episode)
            self.timeUntilAiring = try? dataContainer.decode(Int.self, forKey: .timeUntilAiring)
        }
    }
}
