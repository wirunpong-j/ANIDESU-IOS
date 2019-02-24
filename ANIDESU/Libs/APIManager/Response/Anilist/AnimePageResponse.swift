//
//  AnimePageResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimePageResponse: BaseResponse {
    var pageInfo: PageInfoResponse?
    var anime: [AnimeResponse]?
    
    private enum DataKeys: String, CodingKey {
        case data
    }

    private enum PageKeys: String, CodingKey {
        case page = "Page"
    }

    private enum PageAttrKeys: String, CodingKey {
        case pageInfo, media
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            let pageContainer = try! dataContainer.nestedContainer(keyedBy: PageKeys.self, forKey: .data)
            
            if let pageAttrContainer = try? pageContainer.nestedContainer(keyedBy: PageAttrKeys.self, forKey: .page) {
                self.pageInfo = try? pageAttrContainer.decode(PageInfoResponse.self, forKey: .pageInfo)
                self.anime = try? pageAttrContainer.decode([AnimeResponse].self, forKey: .media)
            }
        }
    }
}

class PageInfoResponse: BaseResponse {
    var lastPage: Int?
    var hasNextPage: Bool?
    var currentPage: Int?
    var perPage: Int?
    var total: Int?
    
    private enum PageInfoKeys: String, CodingKey {
        case lastPage, hasNextPage, currentPage, perPage, total
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: PageInfoKeys.self), !dataContainer.allKeys.isEmpty {
            self.lastPage = try? dataContainer.decode(Int.self, forKey: .lastPage)
            self.hasNextPage = try? dataContainer.decode(Bool.self, forKey: .hasNextPage)
            self.currentPage = try? dataContainer.decode(Int.self, forKey: .currentPage)
            self.perPage = try? dataContainer.decode(Int.self, forKey: .perPage)
            self.total = try? dataContainer.decode(Int.self, forKey: .total)
        }
    }
}
