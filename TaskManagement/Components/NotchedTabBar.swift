//
//  NotchedTabBar.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import Foundation
import SwiftUI

struct NotchedTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack{
            HStack {
                TabBarButton(imageName: "house", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                TabBarButton(imageName: "calendar", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                
                Rectangle()
                    .fill(Color(.clear))
                    .zIndex(0)
                
                TabBarButton(imageName: "doc", isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                TabBarButton(imageName: "person.2", isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
            }
            .frame(height: 60)
            .background(Color(.systemPurple.withAlphaComponent(0.1)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            // Center button
            ZStack {
                Circle()
                    .stroke(.clear, lineWidth: 15)
                    .fill(.purple)
                    .shadow(color: .gray.opacity(0.2), radius: 15, x: 0, y:10)
                    .frame(width: 60, height: 60)
                    
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
            }
            .offset(y: -20)
            .onTapGesture {
                // Handle center button action
            }
        }
    }
}

struct TabBarButton: View {
    let imageName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundColor(isSelected ? .purple : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview{
    NotchedTabBar(selectedTab: .constant(1))
}
