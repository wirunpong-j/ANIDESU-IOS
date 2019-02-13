//
//  AnidesuColor.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 13/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

enum AnidesuColor {
    case White
    case DarkBlue
    case MiddleDarkBlue
    case Blue
    case LightDarkBlue
    case Orange
    case Green
    case Black
    case Gray
    case LightGray
    case DarkGray
    case Clear
    
    func color() -> UIColor {
        switch self {
        case .White:
            return #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
        case .Blue:
            return #colorLiteral(red: 0.150834024, green: 0.652556181, blue: 0.9999204278, alpha: 1)
        case .DarkBlue:
            return #colorLiteral(red: 0.09803921569, green: 0.1294117647, blue: 0.1764705882, alpha: 1)
        case .MiddleDarkBlue:
            return #colorLiteral(red: 0.12415535, green: 0.1860362291, blue: 0.2528194189, alpha: 1)
        case .LightDarkBlue:
            return #colorLiteral(red: 0.2340961099, green: 0.4203311205, blue: 0.5948654413, alpha: 1)
        case .Orange:
            return #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        case .Green:
            return #colorLiteral(red: 0.2666666667, green: 0.8784313725, blue: 0.07843137255, alpha: 1)
        case .Black:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .Gray:
            return #colorLiteral(red: 0.7999204993, green: 0.8000556827, blue: 0.7999026775, alpha: 1)
        case .LightGray:
            return #colorLiteral(red: 0.9410838485, green: 0.9412414432, blue: 0.9410631061, alpha: 1)
        case .DarkGray:
            return #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
        case .Clear:
            return UIColor.clear
        }
    }
}
