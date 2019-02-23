//
//  AnimeTitle.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimeTitleResponse: BaseResponse {
    var englishTitle: String?
    var romanjiTitle: String?
    var nativeTitle: String?
    var userPreferredTitle: String?
    
    private enum DataKeys: String, CodingKey {
        case english, romaji, native, userPreferred
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.englishTitle = try? dataContainer.decode(String.self, forKey: .english)
            self.romanjiTitle = try? dataContainer.decode(String.self, forKey: .romaji)
            self.nativeTitle = try? dataContainer.decode(String.self, forKey: .native)
            self.userPreferredTitle = try? dataContainer.decode(String.self, forKey: .userPreferred)
        }
    }
}
