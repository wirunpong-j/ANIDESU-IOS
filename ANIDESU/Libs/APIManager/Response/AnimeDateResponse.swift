//
//  AnimeDateResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 22/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimeDateResponse: BaseResponse {
    var year: Int?
    var month: Int?
    var day: Int?
    
    private enum DataKeys: String, CodingKey {
        case year, month, day
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.year = try? dataContainer.decode(Int.self, forKey: .year)
            self.month = try? dataContainer.decode(Int.self, forKey: .month)
            self.day = try? dataContainer.decode(Int.self, forKey: .day)
        }
    }
}
