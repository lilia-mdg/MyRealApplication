//
//  Task.swift
//  MyRealApplication
//
//  Created by Daydou on 30/6/2023.
//

import Foundation

struct Task: Identifiable{
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
