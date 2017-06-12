//
//  DatetimeHelper.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation

enum TimeUnit {
    case Weekday
    case Day
    case Month
    case Year
}

func getCurrentDayFormated() -> [TimeUnit: String] {
    let date = Date()
    let calendar = Calendar.current
    let year =  "\(calendar.component(.year, from: date))"
    let month = "\(calendar.component(.month, from: date))"
    let day =  "\(calendar.component(.day, from: date))"
    var weekday = "\(calendar.component(.weekdayOrdinal, from: date))"
    weekday = convertWeekDateToDateName(weekDate:  weekday)
    return [.Weekday : weekday ,.Day : day,  .Month : month, .Year : year]
}

private func convertWeekDateToDateName(weekDate: String) -> String{
    switch Int(weekDate)! {
    case 1:
        return "sunday"
    case 2:
        return "monday"
    case 3:
        return "Tuesday"
    case 4:
        return "Wednesday"
    case 5:
        return "Thursday"
    case 6:
        return "Friday"
    case 7:
        return "Saturday"
    
        
    default:
        return ""
        
    }
}



