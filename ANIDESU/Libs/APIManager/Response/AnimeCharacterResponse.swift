//
//  AnimeCharacterResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 23/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimeCharacterResponse: BaseResponse {
    var id: Int?
    var name: AnilistNameResponse?
    var image: AnilistImageResponse?
    
    private enum DataKeys: String, CodingKey {
        case id, name, image
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.id = try? dataContainer.decode(Int.self, forKey: .id)
            self.name = try? dataContainer.decode(AnilistNameResponse.self, forKey: .name)
            self.image = try? dataContainer.decode(AnilistImageResponse.self, forKey: .image)
        }
    }
}
