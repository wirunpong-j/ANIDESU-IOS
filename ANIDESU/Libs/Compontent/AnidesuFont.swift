//
//  AnidesuFont.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 21/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

enum AnidesuFontSize: String {
    case ExtraExtraExtraTiny = "xxxtiny"
    case ExtraExtraExtraTinyMed = "xxxtinymed"
    case ExtraExtraExtraTinyBold = "xxxtinybold"
    case ExtraExtraTiny = "xxtiny"
    case ExtraExtraTinyMed = "xxtinymed"
    case ExtraExtraTinyBold = "xxtinybold"
    case ExtraTiny = "extratiny"
    case ExtraTinyMed = "extratinymed"
    case ExtraTinyBold = "extratinybold"
    case Tiny = "tiny"
    case TinyMed = "tinymed"
    case TinyBold = "tinybold"
    case ExtraSmall = "extrasmall"
    case ExtraSmallMed = "extrasmallmed"
    case ExtraSmallBold = "extrasmallbold"
    case Small = "small"
    case SmallMed = "smallmed"
    case SmallBold = "smallbold"
    case Medium = "medium"
    case MediumMed = "mediummed"
    case MediumBold = "mediumbold"
    case Large = "large"
    case LargeMed = "largemed"
    case LargeBold = "largebold"
    case ExtraLarge = "extralarge"
    case ExtraLargeMed = "extralargemed"
    case ExtraLargeBold = "extralargebold"
    case Huge = "huge"
    case HugeMed = "hugemed"
    case HugeBold = "hugebold"
    
    func getFont() -> UIFont {
        switch self {
        case .ExtraExtraExtraTiny:
            return AnidesuFont.Mitr.ExtraExtraExtraTiny(type: .ExtraLight)
        case .ExtraExtraExtraTinyMed:
            return AnidesuFont.Mitr.ExtraExtraExtraTiny(type: .Light)
        case .ExtraExtraExtraTinyBold:
            return AnidesuFont.Mitr.ExtraExtraExtraTiny(type: .Regular)
        case .ExtraExtraTiny:
            return AnidesuFont.Mitr.ExtraExtraTiny(type: .ExtraLight)
        case .ExtraExtraTinyMed:
            return AnidesuFont.Mitr.ExtraExtraTiny(type: .Light)
        case .ExtraExtraTinyBold:
            return AnidesuFont.Mitr.ExtraExtraTiny(type: .Regular)
        case .ExtraTiny:
            return AnidesuFont.Mitr.ExtraTiny(type: .ExtraLight)
        case .ExtraTinyMed:
            return AnidesuFont.Mitr.ExtraTiny(type: .Light)
        case .ExtraTinyBold:
            return AnidesuFont.Mitr.ExtraTiny(type: .Regular)
        case .Tiny:
            return AnidesuFont.Mitr.Tiny(type: .ExtraLight)
        case .TinyMed:
            return AnidesuFont.Mitr.Tiny(type: .Light)
        case .TinyBold:
            return AnidesuFont.Mitr.Tiny(type: .Regular)
        case .ExtraSmall:
            return AnidesuFont.Mitr.ExtraSmall(type: .ExtraLight)
        case .ExtraSmallMed:
            return AnidesuFont.Mitr.ExtraSmall(type: .Light)
        case .ExtraSmallBold:
            return AnidesuFont.Mitr.ExtraSmall(type: .Regular)
        case .Small:
            return AnidesuFont.Mitr.Small(type: .ExtraLight)
        case .SmallMed:
            return AnidesuFont.Mitr.Small(type: .Light)
        case .SmallBold:
            return AnidesuFont.Mitr.Small(type: .Regular)
        case .Medium:
            return AnidesuFont.Mitr.Medium(type: .ExtraLight)
        case .MediumMed:
            return AnidesuFont.Mitr.Medium(type: .Light)
        case .MediumBold:
            return AnidesuFont.Mitr.Medium(type: .Regular)
        case .Large:
            return AnidesuFont.Mitr.Large(type: .ExtraLight)
        case .LargeMed:
            return AnidesuFont.Mitr.Large(type: .Light)
        case .LargeBold:
            return AnidesuFont.Mitr.Large(type: .Regular)
        case .ExtraLarge:
            return AnidesuFont.Mitr.ExtraLarge(type: .ExtraLight)
        case .ExtraLargeMed:
            return AnidesuFont.Mitr.ExtraLarge(type: .Light)
        case .ExtraLargeBold:
            return AnidesuFont.Mitr.ExtraLarge(type: .Regular)
        case .Huge:
            return AnidesuFont.Mitr.Huge(type: .ExtraLight)
        case .HugeMed:
            return AnidesuFont.Mitr.Huge(type: .Light)
        case .HugeBold:
            return AnidesuFont.Mitr.Huge(type: .Regular)
        }
    }
}

enum AnidesuFont {
    case Mitr
    
    static let ExtraExtraExtraTiny: CGFloat = 8
    static let ExtraExtraTiny:      CGFloat = 10
    static let ExtraTiny:           CGFloat = 12
    static let Tiny:                CGFloat = 14
    static let ExtraSmall:          CGFloat = 16
    static let Small:               CGFloat = 18
    static let Medium:              CGFloat = 20
    static let Large:               CGFloat = 24
    static let ExtraLarge:          CGFloat = 28
    static let Huge:                CGFloat = 32
    
    public func ExtraExtraExtraTiny(type: FontType) -> UIFont {
        let size = AnidesuFont.ExtraExtraExtraTiny
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func ExtraExtraTiny(type: FontType) -> UIFont {
        let size = AnidesuFont.ExtraExtraTiny
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func ExtraTiny(type: FontType) -> UIFont {
        let size = AnidesuFont.ExtraTiny
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func Tiny(type: FontType) -> UIFont {
        let size = AnidesuFont.Tiny
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func ExtraSmall(type: FontType) -> UIFont {
        let size = AnidesuFont.ExtraSmall
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func Small(type: FontType) -> UIFont {
        let size = AnidesuFont.Small
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func Medium(type: FontType) -> UIFont {
        let size = AnidesuFont.Medium
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func Large(type: FontType) -> UIFont {
        let size = AnidesuFont.Large
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func ExtraLarge(type: FontType) -> UIFont {
        let size = AnidesuFont.ExtraLarge
        return self.getFontWithSize(type: type, size: size)
    }
    
    public func Huge(type: FontType) -> UIFont {
        let size = AnidesuFont.Huge
        return self.getFontWithSize(type: type, size: size)
    }
    
    private func getFontWithSize(type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: "Mitr-\(type.rawValue)", size: size)!
    }
}

public enum FontType: String {
    case Regular = "Regular"
    case ExtraLight = "ExtraLight"
    case Light = "Light"
    case Medium = "Medium"
    case SemiBold = "SemiBold"
    case Bold = "Bold"
}
