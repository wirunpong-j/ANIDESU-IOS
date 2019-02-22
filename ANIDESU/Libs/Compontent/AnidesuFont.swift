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
            return AnidesuFont.NotoSansThai.ExtraExtraExtraTiny(type: .Light)
        case .ExtraExtraExtraTinyMed:
            return AnidesuFont.NotoSansThai.ExtraExtraExtraTiny(type: .Medium)
        case .ExtraExtraExtraTinyBold:
            return AnidesuFont.NotoSansThai.ExtraExtraExtraTiny(type: .Bold)
        case .ExtraExtraTiny:
            return AnidesuFont.NotoSansThai.ExtraExtraTiny(type: .Light)
        case .ExtraExtraTinyMed:
            return AnidesuFont.NotoSansThai.ExtraExtraTiny(type: .Medium)
        case .ExtraExtraTinyBold:
            return AnidesuFont.NotoSansThai.ExtraExtraTiny(type: .Bold)
        case .ExtraTiny:
            return AnidesuFont.NotoSansThai.ExtraTiny(type: .Light)
        case .ExtraTinyMed:
            return AnidesuFont.NotoSansThai.ExtraTiny(type: .Medium)
        case .ExtraTinyBold:
            return AnidesuFont.NotoSansThai.ExtraTiny(type: .Bold)
        case .Tiny:
            return AnidesuFont.NotoSansThai.Tiny(type: .Light)
        case .TinyMed:
            return AnidesuFont.NotoSansThai.Tiny(type: .Medium)
        case .TinyBold:
            return AnidesuFont.NotoSansThai.Tiny(type: .Bold)
        case .ExtraSmall:
            return AnidesuFont.NotoSansThai.ExtraSmall(type: .Light)
        case .ExtraSmallMed:
            return AnidesuFont.NotoSansThai.ExtraSmall(type: .Medium)
        case .ExtraSmallBold:
            return AnidesuFont.NotoSansThai.ExtraSmall(type: .Bold)
        case .Small:
            return AnidesuFont.NotoSansThai.Small(type: .Light)
        case .SmallMed:
            return AnidesuFont.NotoSansThai.Small(type: .Medium)
        case .SmallBold:
            return AnidesuFont.NotoSansThai.Small(type: .Bold)
        case .Medium:
            return AnidesuFont.NotoSansThai.Medium(type: .Light)
        case .MediumMed:
            return AnidesuFont.NotoSansThai.Medium(type: .Medium)
        case .MediumBold:
            return AnidesuFont.NotoSansThai.Medium(type: .Bold)
        case .Large:
            return AnidesuFont.NotoSansThai.Large(type: .Light)
        case .LargeMed:
            return AnidesuFont.NotoSansThai.Large(type: .Medium)
        case .LargeBold:
            return AnidesuFont.NotoSansThai.Large(type: .Bold)
        case .ExtraLarge:
            return AnidesuFont.NotoSansThai.ExtraLarge(type: .Light)
        case .ExtraLargeMed:
            return AnidesuFont.NotoSansThai.ExtraLarge(type: .Medium)
        case .ExtraLargeBold:
            return AnidesuFont.NotoSansThai.ExtraLarge(type: .Bold)
        case .Huge:
            return AnidesuFont.NotoSansThai.Huge(type: .Light)
        case .HugeMed:
            return AnidesuFont.NotoSansThai.Huge(type: .Medium)
        case .HugeBold:
            return AnidesuFont.NotoSansThai.Huge(type: .Bold)
        }
    }
}

public enum AnidesuFont {
    case NotoSansThai
    
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
        return UIFont(name: "NotoSansThai-\(type.rawValue)", size: size)!
    }
}

public enum FontType: String {
    case Regular = "Regular"
    case Black = "Black"
    case ExtraBold = "ExtraBold"
    case Bold = "Bold"
    case Medium = "Medium"
    case SemiBold = "SemiBold"
    case Light = "Light"
    case ExtraLight = "ExtraLight"
    case Thin = "Thin"
}
