//
//  DateScrollView.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 02/10/24.
//

import Foundation
import SwiftUI

struct DateScrollView: View {
    @State private var selectedDate = Date()
    let dateRange: ClosedRange<Date>
    
    init(dateRange: ClosedRange<Date>){
        self.dateRange = dateRange
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8){
                ForEach(datesInRange(), id: \.self){date in
                    Button(action: {
                        selectedDate = date
                    }){
                        DateView(date: date, isSelected: Calendar.current.isDate(date, inSameDayAs: selectedDate))
                    }
                }
            }
        }
    }
    
    private func datesInRange() -> [Date] {
        var dates: [Date] = []
        var currentDate = dateRange.lowerBound
        
        while currentDate <= dateRange.upperBound {
            dates.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
}

struct DateView: View {
    let date: Date
    let isSelected: Bool
    var body: some View {
        VStack {
            Text(monthString)
                .font(.caption)
                .foregroundStyle(isSelected ? .white : .gray)
            Text(dayString)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(isSelected ? .white : .black)
            Text(weekdayString)
                .font(.caption)
                .foregroundStyle(isSelected ? .white : .gray)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(isSelected ? Color.purple : Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
    
    private var monthString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: date)
    }
    
    private var dayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    private var weekdayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
}

#Preview {
    DateScrollView(dateRange: Date()...Calendar.current.date(byAdding: .day, value: 30, to: Date())!)
}
