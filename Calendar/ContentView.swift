//
//  ContentView.swift
//  Calendar
//
//  Created by beardmikle on 31.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View
    {
        VStack(spacing: 1)
        {
            DateScrollerView()
                .environmentObject(dateHolder)
            dayOfWeekStack
            calendarGrid
            currentDay //    current day of the week
        }
        .background(Color.gray.opacity(0.4))
    }
    
    
    var dayOfWeekStack: some View
    {
        HStack(spacing:1)
        {
            Text("Mon").dayOfWeek() // first day of the week. look CalendarHelper line 52. beardmikle
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
            Text("Sun").dayOfWeek()
        }
        .font(.system(size: 23, weight: .heavy, design: .rounded))
        .foregroundColor(.indigo)
        .padding(.bottom, 10)
        .padding(.top, 10)
        .background(Rectangle().fill(Color.blue.opacity(0.15)).shadow(radius: 5)) // string with days of the week

    }
    
    var calendarGrid: some View
    {

        VStack(spacing: 1)
        {
            let daysInMonth = CalendarHelper().dayInMonth(dateHolder.date)
            let firstDayOnMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOnMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().dayInMonth(prevMonth)
            
            ForEach(0..<6)
            {
                row in
                HStack(spacing: 1)
                {
                    ForEach(1..<8)
                    {
                        column in
                        let count = column + (row * 7)
                        CalendarCell(count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth)
                            .environmentObject(dateHolder)
                    }
                }
            }
        
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 10)
    }
    
//    current day of the week
    var myDate = Date()
    var currentDay: some View
    {
        VStack
        {
            Text("Current day:")
                .padding(.bottom, 5)
            Text(myDate, format: Date.FormatStyle(date: .complete))
                .padding(.bottom, 5)
                .background(Rectangle().fill(Color.blue.opacity(0.15)).shadow(radius: 20))
            Text("Current time:")
                .padding(.bottom, 5)
            Text(myDate, format: Date.FormatStyle().hour().minute())
                .background(Rectangle().fill(Color.blue.opacity(0.15)).shadow(radius: 20))
   
        }
        .font(.system(size: 20, weight: .heavy, design: .rounded))
        .padding(.bottom, 290)
//        .background(Color.gray.opacity(0.2))
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Text
{
    func dayOfWeek() -> some View
    {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
            .fontWeight(.bold)
    }
}
