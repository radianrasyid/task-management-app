//
//  ContentView.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import SwiftUI
import UIKit

struct TaskManagement: View {
    @State private var selectedTab = 0
    @State private var selectedTabViewValue: ScheduleTabList = .all
    @State private var taskManagementViewModel = TaskManagementViewModel()
    init() {
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        ZStack {
            Image("main-bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeScreen()
                        .tag(0)
                    ScheduleScreen()
                        .tag(1)
                    DocumentScreen()
                        .tag(2)
                    AccountScreen()
                        .tag(3)
                }
                
                if(taskManagementViewModel.tabBarShowed){
                    FloatingTabBar(selectedTab: $selectedTab)
                        .padding(.bottom, 30)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .environment(taskManagementViewModel)
    }
}

#Preview {
    TaskManagement()
}
