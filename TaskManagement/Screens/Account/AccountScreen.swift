//
//  AccountScreen.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import SwiftUI

struct AccountScreen: View {
    var body: some View {
        NavigationStack{
            List{
                Text("Account Screen")
            }
            .navigationTitle("Account")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AccountScreen()
}
