//
//  AnidesuColor.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 13/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

enum AnidesuColor {
    case Blue
    case LightBlue
    case DarkBlue
    case MiddleDarkBlue
    case LightDarkBlue
    case Facebook
    case DarkFacebook
    case Navy
    case Black
    case ExtraDarkGray
    case DarkGray
    case Gray
    case LightGray
    case ExtraLightGray
    case White
    case BlueGreen
    case DarkBlueGreen
    case LightBlueGreen
    case Coral
    case LightCoral
    case DarkCoral
    case Amber
    case LightAmber
    case Orange
    case Green
    case Clear
    
    func color() -> UIColor {
        switch self {
        case .Blue:
            return #colorLiteral(red: 0.150834024, green: 0.652556181, blue: 0.9999204278, alpha: 1)
        case .LightBlue:
            return #colorLiteral(red: 0.6666666667, green: 0.8588235294, blue: 0.8549019608, alpha: 1) // AADBDA
        case .DarkBlue:
            return #colorLiteral(red: 0.09803921569, green: 0.1294117647, blue: 0.1764705882, alpha: 1)
        case .MiddleDarkBlue:
            return #colorLiteral(red: 0.12415535, green: 0.1860362291, blue: 0.2528194189, alpha: 1)
        case .LightDarkBlue:
            return #colorLiteral(red: 0.2340961099, green: 0.4203311205, blue: 0.5948654413, alpha: 1)
        case .Facebook:
            return #colorLiteral(red: 0.231372549, green: 0.3607843137, blue: 0.5882352941, alpha: 1) // 3B5C96
        case .DarkFacebook:
            return #colorLiteral(red: 0.1607843137, green: 0.2745098039, blue: 0.4666666667, alpha: 1) // 294677
        case .Navy:
            return #colorLiteral(red: 0.1215686275, green: 0.1921568627, blue: 0.2941176471, alpha: 1) // 1F314B
        case .Black:
            return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1) // 333333
        case .ExtraDarkGray:
            return #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1) // 464646
        case .DarkGray:
            return #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1) // 858585
        case .Gray:
            return #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1) // C3C3C3
        case .LightGray:
            return #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1) // E6E6E6
        case .ExtraLightGray:
            return #colorLiteral(red: 0.9607843137, green: 0.9490196078, blue: 0.9490196078, alpha: 1) // F5F2F2
        case .White:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // FFFFFF
        case .BlueGreen:
            return #colorLiteral(red: 0.2745098039, green: 0.7960784314, blue: 0.6941176471, alpha: 1) // 46CBB1
        case .LightBlueGreen:
            return #colorLiteral(red: 0.3568627451, green: 0.8862745098, blue: 0.7803921569, alpha: 1) // 5BE2C7
        case .DarkBlueGreen:
            return #colorLiteral(red: 0.1568627451, green: 0.7058823529, blue: 0.6, alpha: 1) // 28B499
        case .Coral:
            return #colorLiteral(red: 0.9882352941, green: 0.3960784314, blue: 0.4078431373, alpha: 1) // FC6568
        case .LightCoral:
            return #colorLiteral(red: 1, green: 0.5843137255, blue: 0.5921568627, alpha: 1) // FF9597
        case .DarkCoral:
            return #colorLiteral(red: 0.8862745098, green: 0.3058823529, blue: 0.3176470588, alpha: 1) // E24E51
        case .Amber:
            return #colorLiteral(red: 1, green: 0.8117647059, blue: 0.3960784314, alpha: 1) // FFCF65
        case .LightAmber:
            return #colorLiteral(red: 1, green: 0.8705882353, blue: 0.5843137255, alpha: 1) // FFDE95
        case .Orange:
            return #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        case .Green:
            return #colorLiteral(red: 0.2666666667, green: 0.8784313725, blue: 0.07843137255, alpha: 1)
        case .Clear:
            return UIColor.clear
        }
    }
}
