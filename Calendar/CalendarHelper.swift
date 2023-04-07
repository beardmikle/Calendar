//
//  CalenderHelper.swift
//  Calendar
//
//  Created by beardmikle on 04.04.2023.
//

import Foundation

class CalendarHelper
{
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    func monthYearString(_ date:Date) -> String
    {
        dateFormatter.dateFormat = "LLL yyyy"
        return dateFormatter.string(from: date)
    }
    
    func plusMonth(_ date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(_ date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func dayInMonth(_ date: Date) -> Int
    {
        let range = calendar.range(of:.day, in: .month, for: date)
        return range!.count
    }

    func dayOfMonth(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func firstOfMonth(_ date: Date) -> Date
    {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func weekDay(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 2 // if you need to shift the day of the week by 1 day

    }
    
}
