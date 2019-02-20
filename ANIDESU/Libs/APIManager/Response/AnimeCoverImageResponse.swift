//
//  AnimeCoverImageResponse.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class AnimeCoverImageResponse: BaseResponse {
    var sizeXLarge: String?
    var sizeLarge: String?
    var sizeMedium: String?
    var color: String?
    
    private enum DataKeys: String, CodingKey {
        case extraLarge, large, medium, color
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let dataContainer = try? decoder.container(keyedBy: DataKeys.self), !dataContainer.allKeys.isEmpty {
            self.sizeXLarge = try? dataContainer.decode(String.self, forKey: .extraLarge)
            self.sizeLarge = try? dataContainer.decode(String.self, forKey: .large)
            self.sizeMedium = try? dataContainer.decode(String.self, forKey: .medium)
            self.color = try? dataContainer.decode(String.self, forKey: .color)
        }
    }
}
