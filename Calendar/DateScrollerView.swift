import SwiftUI

struct DateScrollerView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View
    {
        HStack
        {
            Spacer()
            Button(action: previousMonth)
            {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
                    .symbolVariant(.square)
                    .foregroundColor(.blue)
            }
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
                .foregroundColor(.blue)
            Button(action: nextMonth)
            {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
                    .symbolVariant(.square)
                    .foregroundColor(.blue)
            }
            Spacer()

        }
        .background(Color.gray.opacity(0.05))

    }
    func previousMonth()
    {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    func nextMonth()
    {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)

    }
    
}



struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
    }
}

