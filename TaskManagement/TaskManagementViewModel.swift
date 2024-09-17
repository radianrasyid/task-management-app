//
//  TaskManagementViewModel.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import Foundation

@Observable
class TaskManagementViewModel {
    var tabBarShowed = true
    
    func hideTabBar() -> Void {
        tabBarShowed = false
    }
    func showTabBar() -> Void {
        tabBarShowed = true
    }
}
