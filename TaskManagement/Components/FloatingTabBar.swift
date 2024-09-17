//
//  FloatingTabBar.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import SwiftUI

struct FloatingTabBar: View {
    @Binding var selectedTab: Int
    @State private var showAddProjectSheet = false
    var body: some View {
        ZStack{
            HStack(spacing: 10) {
                
                TabBarButton(imageName: "house", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                
                TabBarButton(imageName: "calendar", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                
                Rectangle()
                    .zIndex(0)
                    .opacity(0)
                    .frame(height: 2)
                
                TabBarButton(imageName: "doc", isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                
                TabBarButton(imageName: "person", isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .padding(.horizontal)
            
            Button(action: {
                showAddProjectSheet.toggle()
            }){
                ZStack {
                    Circle()
                        .foregroundColor(.purple)
                        .frame(width: 50, height: 50)
                        .shadow(radius: 4)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                }
                .offset(y: -20)
            }
        }
        .sheet(isPresented: $showAddProjectSheet){
            Text("New")
        }
    }
}

//struct TabBarButton: View {
//    let imageName: String
//    let isSelected: Bool
//    let action: () -> Void
//    
//    var body: some View {
//        Button(action: action) {
//            Image(systemName: imageName)
//                .font(.system(size: 24, weight: .bold))
//                .foregroundColor(isSelected ? .blue : .gray)
//        }
//    }
//}

struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
    }
}

#Preview {
    FloatingTabBar(selectedTab: .constant(1))
}
