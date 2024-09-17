//
//  ScheduleScreen.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import SwiftUI

struct ScheduleScreen: View {
    var body: some View {
        NavigationStack{
            List{
                Text("Schedule Screen")
            }
            .navigationTitle("Schedule")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ScheduleScreen()
}
