//
//  TaskViewModel.swift
//  MyRealApplication
//
//  Created by Daydou on 30/6/2023.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    
    @Published var storedTasks: [Task] = [
    Task(taskTitle: "Meeting", taskDescription: "Discuss team task for the day", taskDate: .init(timeIntervalSince1970: 1692176574)),
    Task(taskTitle: "Icon set", taskDescription: "Edit icons for team task for next week", taskDate: .init(timeIntervalSince1970: 1692176574)),
    Task(taskTitle: "Prototype", taskDescription: "Make and send prototype", taskDate: .init(timeIntervalSince1970: 1692176574)),
    Task(taskTitle: "Check asset", taskDescription: "Start checking the assets", taskDate: .init(timeIntervalSince1970: 1692176574)),
    Task(taskTitle: "Team party", taskDescription: "Make fun with team mates", taskDate: .init(timeIntervalSince1970: 1692090174)),
    Task(taskTitle: "Client meeting", taskDescription: "Explain project to client", taskDate: .init(timeIntervalSince1970: 1692176574)),
    Task(taskTitle: "Next project", taskDescription: "Discuss next project with team", taskDate: .init(timeIntervalSince1970: 1692090174)),
    Task(taskTitle: "App proposal", taskDescription: "Meet client for next app proposal", taskDate: .init(timeIntervalSince1970: 1692090174))
    ]
    
    
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
    @Published var filteredTasks: [Task]?
    
    init(){
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    func filterTodayTasks(){
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filtered = self.storedTasks.filter { task in
                return  calendar.isDate(task.taskDate, inSameDayAs: self.currentDay)
            }
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredTasks = filtered
                }
            }

        }
            }
    
    func fetchCurrentWeek(){
        let today = Date()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{
            return
        }
        
        (1...7).forEach{day in
            if let weekday = calendar.date(byAdding: .day,value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
    }
    
    func extractDay(date: Date, format: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func isToday(date: Date) -> Bool{
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
}
