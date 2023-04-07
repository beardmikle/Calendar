//
//  MonthStruct.swift
//  Calendar
//
//  Created by beardmikle on 06.04.2023.
//

import Foundation

struct MonthStructOne
{
    var monthType: MonthType
    var dayInt: Int
    func day() -> String
    {
        return String(dayInt)
    }
}

enum MonthType
{
    case Previous
    case Current
    case Next
}

