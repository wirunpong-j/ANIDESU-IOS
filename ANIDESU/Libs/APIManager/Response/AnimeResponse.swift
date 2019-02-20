//
//  AnimeResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimeResponse: BaseResponse {
    var id: Int?
    var title: AnimeTitleResponse?
    var bannerImage: String?
    var coverImage: AnimeCoverImageResponse?
    var status: String?
    var format: String?
    var isAdult: Bool?
    var episodes: Int?
    var genres: [String]?
    var tags: [AnimeTagResponse]?
    var nextAiringEpisode: AnimeAiringResponse?
    
    private enum DataKeys: String, CodingKey {
        case id, title, bannerImage, coverImage, status,
        format, isAdult, episodes, genres, tags, nextAiringEpisode
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.id = try? dataContainer.decode(Int.self, forKey: .id)
            self.title = try? dataContainer.decode(AnimeTitleResponse.self, forKey: .title)
            self.bannerImage = try? dataContainer.decode(String.self, forKey: .bannerImage)
            self.coverImage = try? dataContainer.decode(AnimeCoverImageResponse.self, forKey: .coverImage)
            self.status = try? dataContainer.decode(String.self, forKey: .status)
            self.format = try? dataContainer.decode(String.self, forKey: .format)
            self.isAdult = try? dataContainer.decode(Bool.self, forKey: .isAdult)
            self.episodes = try? dataContainer.decode(Int.self, forKey: .episodes)
            self.genres = try? dataContainer.decode([String].self, forKey: .genres)
            self.tags = try? dataContainer.decode([AnimeTagResponse].self, forKey: .tags)
            self.nextAiringEpisode = try? dataContainer.decode(AnimeAiringResponse.self, forKey: .nextAiringEpisode)
        }
    }
}
