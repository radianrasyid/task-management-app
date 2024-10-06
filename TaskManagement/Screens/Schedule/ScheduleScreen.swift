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
    @State private var selectedTab: ScheduleTabList = .all
    @State private var tasks: [Task] = [
        Task(title: "Market Research", time: "10:00 AM", status: .done, project: "Grocery shopping app design"),
        Task(title: "Competitive Analysis", time: "12:00 PM", status: .inProgress, project: "Grocery shopping app design"),
        Task(title: "Create Low-fidelity Wireframe", time: "07:00 PM", status: .todo, project: "Uber Eats redesign challenge"),
        Task(title: "How to pitch a Design Sprint", time: "09:00 PM", status: .todo, project: "About design sprint")
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                DateScrollView(dateRange: getFirstDateOfMonth()...Calendar.current.date(byAdding: .day, value: 31, to: Date())!)
                
                TabViewNew(selection: $selectedTab)
                
                TaskListView(tasks: filteredTasks)
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
    
    var filteredTasks: [Task] {
        switch selectedTab {
        case .all:
            return tasks
        case .todo:
            return tasks.filter{$0.status == .todo}
        case .inProgress:
            return tasks.filter{$0.status == .inProgress}
        }
    }
}

struct TabViewNew: View {
    @Binding var selection: ScheduleTabList
    var body: some View {
        HStack{
            ForEach(ScheduleTabList.allCases, id: \.self) { tab in
                Button(action: {
                    selection = tab
                }){
                    Text(tab.rawValue)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(selection == tab ? Color.purple : Color.clear)
                        .foregroundStyle(selection == tab ? .white : .black)
                        .clipShape(.rect(cornerRadius: 20))
                }
            }
        }
    }
}

struct TaskListView: View {
    let tasks: [Task]
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                ForEach(tasks){ task in
                    TaskView(task: task)
                }
            }
        }
    }
}

struct TaskView: View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(task.project)
                .font(.caption)
                .foregroundStyle(Color(.gray))
            
            Text(task.title)
                .font(.headline)
            
            HStack{
                Text(task.time)
                Spacer()
                Text(task.status.rawValue)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(task.status.color.opacity(0.2))
                    .foregroundStyle(task.status.color)
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let status: TaskStatus
    let project: String
}

enum TaskStatus: String {
    case todo = "To-do"
    case inProgress = "In Progress"
    case done = "Done"
    
    var color: Color {
        switch self {
        case .todo: return .blue
        case .inProgress: return .orange
        case .done: return .green
        }
    }
}

enum ScheduleTabList: String, CaseIterable {
    case all = "All"
    case todo = "To do"
    case inProgress = "In progress"
}

#Preview {
    ScheduleScreen()
}
