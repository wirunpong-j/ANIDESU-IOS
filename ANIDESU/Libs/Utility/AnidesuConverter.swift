//
//  AnidesuConverter.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 9/4/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//
import Foundation

enum AnidesuDateFormatter: String {
    case databaseComment = "yyyy-MM-dd-HH-mm-ss"
    case displayComment = "dd MMM yyyy - HH:mm"
}

enum AnidesuLocal: String {
    case th, en
}

class AnidesuConverter {
    static func getCurrentDateTime(format: AnidesuDateFormatter) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: Date())
    }
    
    static func stringToDate(dateString: String, toFormat: AnidesuDateFormatter, locale: AnidesuLocal) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: locale.rawValue)
        dateFormatter.dateFormat = toFormat.rawValue
        return dateFormatter.date(from: dateString)
    }
    
    static func dateToString(date: Date, toFormat: AnidesuDateFormatter, locale: AnidesuLocal) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = toFormat.rawValue
        dateFormatter.locale = Locale(identifier: locale.rawValue)
        return dateFormatter.string(from: date)
    }
    
//    static func convertDateDefault(dateString: String, toFormat: AnidesuDateFormatter, formFormat: AnidesuDateFormatter) -> String {
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = formFormat.rawValue
//        let date = dateFormatterGet.date(from: dateString)
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = toFormat.rawValue
//        return dateFormatterPrint.string(from: date!)
//    }
    
    static func convertDate(dateString: String, toFormat: AnidesuDateFormatter, formFormat: AnidesuDateFormatter) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = formFormat.rawValue
        dateFormatterGet.locale = Locale(identifier: "en")
        let date = dateFormatterGet.date(from: dateString)
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = toFormat.rawValue
        dateFormatterPrint.locale = Locale(identifier: "en")
        
        if let _date = date {
            return dateFormatterPrint.string(from: _date)
        } else {
            return dateString
        }
    }
    
}

