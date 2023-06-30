//
//  TaskViewModel.swift
//  MyRealApplication
//
//  Created by Daydou on 30/6/2023.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    
    @Published var storedTasks: [Task] = [
    Task(taskTitle: "Meeting", taskDescription: "Discuss team task for the day", taskDate: .init(timeIntervalSince1970: 1641645497)),
    Task(taskTitle: "Icon set", taskDescription: "Edit icons for team task for next week", taskDate: .init(timeIntervalSince1970: 1641649097)),
    Task(taskTitle: "Prototype", taskDescription: "Make and send prototype", taskDate: .init(timeIntervalSince1970: 1641652697)),
    Task(taskTitle: "Check asset", taskDescription: "Start checking the assets", taskDate: .init(timeIntervalSince1970: 1641656297)),
    Task(taskTitle: "Team party", taskDescription: "Make fun with team mates", taskDate: .init(timeIntervalSince1970: 1641661897)),
    Task(taskTitle: "Client meeting", taskDescription: "Explain project to client", taskDate: .init(timeIntervalSince1970: 1641641897)),
    Task(taskTitle: "Next project", taskDescription: "Discuss next project with team", taskDate: .init(timeIntervalSince1970: 1641677897)),
    Task(taskTitle: "App proposal", taskDescription: "Meet client for next app proposal", taskDate: .init(timeIntervalSince1970: 1641681497))
    ]
}