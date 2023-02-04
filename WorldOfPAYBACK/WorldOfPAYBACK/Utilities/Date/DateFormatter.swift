//
//  DateFormatter.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

enum DateFormat: String {
    case displayDate = "EEEE, MMM d, yyyy"
    case displayTime = "HH:mm a"
    case displayDateTime = "EEEE, MMM d, yyyy HH:mm a"
    case networkDate = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension String {
    
    func toNetworkDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.networkDate.rawValue
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func dateString(toFormat: DateFormat, locale: Locale? = nil) -> String {
        if let date = toNetworkDate() {
            let dateFormatter = DateFormatter()
            if let locale = locale {
                dateFormatter.locale = locale
            }   
            dateFormatter.dateFormat = toFormat.rawValue
            let dateString = dateFormatter.string(from: date)
            return dateString
        } else {
            return self
        }
        
    }
    
}

extension Date {
    
    func dateString(format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        let dateString = formatter.string(from: self)
        return dateString
    }
    
}
