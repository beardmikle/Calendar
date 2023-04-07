//
//  CalendarCell.swift
//  Calendar
//
//  Created by beardmikle on 05.04.2023.
//

import SwiftUI

struct CalendarCell: View
{
    @EnvironmentObject var dateHolder: DateHolder
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let daysInPrevMonth: Int
    
    
    //cell - day
    var body: some View {
        Text(monthStruct().day())
            .foregroundColor(textColor(type: monthStruct().monthType))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(Font.title.weight(.bold))
            .background(Rectangle().fill(Color.gray.opacity(0.15)).shadow(radius: 5))
    }
    
    // text color calendar day
    func textColor(type: MonthType) -> Color
    {
        return type == MonthType.Current ? Color.blue: Color.red
    }
    
    func monthStruct() -> MonthStructOne
    {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if(count <= start)
        {
            let day = daysInPrevMonth + count - start
            return MonthStructOne(monthType: MonthType.Previous, dayInt: day)
        }
        else if (count - start > daysInMonth)
        {
            let day = count - start - daysInMonth
            return MonthStructOne(monthType: MonthType.Next, dayInt: day)
        }
        
        let day = count - start
        return MonthStructOne(monthType: .Current, dayInt: day)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1)
    }
}
