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
    let weekday = "\(calendar.component(.weekday, from: date))"
    return [.Weekday : weekday ,.Day : day,  .Month : month, .Year : year]
}



