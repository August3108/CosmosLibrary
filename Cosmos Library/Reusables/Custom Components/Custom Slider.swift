//
//  Custom Slider.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 06/11/24.
//
import SwiftUI

struct CustomCalendarView: View {
    @State private var selectedDate = Date()
    
    let calendar = Calendar.current
    var body: some View {
        VStack {
            Text(selectedDate, style: .date)
                .font(.headline)
                .padding()
            
            let daysInMonth = calendar.range(of: .day, in: .month, for: selectedDate)!
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(daysInMonth, id: \.self) { day in
                    Text("\(day)")
                        .padding()
                        .background(self.isSelected(day: day) ? Color.blue : Color.clear)
                        .foregroundColor(self.isSelected(day: day) ? .blue : .red)
                        .cornerRadius(8)
                        .onTapGesture {
                            selectDate(day)
                        }
                }
            }
            .padding()
        }
    }
    
    func isSelected(day: Int) -> Bool {
        let selectedDay = calendar.component(.day, from: selectedDate)
        return selectedDay == day
    }
    
    func selectDate(_ day: Int) {
        let components = calendar.dateComponents([.year, .month], from: selectedDate)
        let newDate = calendar.date(bySetting: .day, value: day, of: calendar.date(from: components)!)!
        selectedDate = newDate
    }
}

struct ContentView: View {
    var body: some View {
        CustomCalendarView()
            .frame(width: 300, height: 350)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
            .preferredColorScheme(.light)
        
        ContentView()
            .previewDevice("iPhone 14")
            .preferredColorScheme(.dark)
    }
}
