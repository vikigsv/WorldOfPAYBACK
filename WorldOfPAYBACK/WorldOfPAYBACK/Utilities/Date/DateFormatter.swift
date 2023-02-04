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
    
    func toDate(format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func dateString(of format: DateFormat, toFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        if let date = dateFormatter.date(from: self) {
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
