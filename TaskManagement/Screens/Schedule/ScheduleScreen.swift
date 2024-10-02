//
//  ScheduleScreen.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import SwiftUI

struct ScheduleScreen: View {
    
    @State private var currentDate = Date()
    @State private var daysInMonth: Int = 0
    
    var body: some View {
        NavigationStack{
            ScrollView{
                DateScrollView(dateRange: getFirstDateOfMonth()...Calendar.current.date(byAdding: .day, value: 31, to: Date())!)
                
                
            }
            .padding(10)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {}){
                        Image(systemName: "chevron.left")
                    }
                }
                
                ToolbarItem(placement: .principal){
                    Text("Today's Tasks")
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {}){
                        Image(systemName: "bell.fill")
                    }
                }
            }
            .toolbarTitleDisplayMode(.inline)
            .navigationTitle("Today's Tasks")
        }
        .background(Color(.white))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func getFirstDateOfMonth() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: Date())
        return calendar.date(from: components) ?? Date()
    }
}

#Preview {
    ScheduleScreen()
}
