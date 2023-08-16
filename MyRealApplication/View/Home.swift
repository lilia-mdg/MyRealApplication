//
//  Home.swift
//  MyRealApplication
//
//  Created by Daydou on 1/7/2023.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]){
                Section{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing:  10){
                            ForEach(taskModel.currentWeek, id: \.self){day in
                                VStack(spacing: 10) {
                                    Text(taskModel.extractDay(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    Text(taskModel.extractDay(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(taskModel.isToday(date: day) ? 1 : 0)
                                }
                                .foregroundStyle(taskModel.isToday(date: day) ? .primary : .secondary)
                                .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack{
                                        if (taskModel.isToday(date: day)){
                                            Capsule()
                                                .fill(.black)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                    withAnimation {
                                        taskModel.currentDay = day
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    TasksView()
                }
            header: {
                HeaderView()
            }
            }
        }.ignoresSafeArea(.container, edges: .top)
    }
    
    func TasksView()->some View{
        LazyVStack(spacing: 18){
            if let tasks = taskModel.filteredTasks{
                if tasks.isEmpty{
                    Text("No tasks found")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .offset(y: 100)
                }else{
                    ForEach(tasks){ task in
                        TaskCardView(task: task)
                    }
                }
            }else{
                ProgressView().offset(y: 100)
            }
        }
        .padding()
        .padding(.top)
        .onChange(of: taskModel.currentDay) { newValue in
            taskModel.filterTodayTasks()
        }
    }
    
    func TaskCardView(task: Task)->some View{
        HStack(alignment: .top, spacing: 30){
            VStack(spacing:10){
                Circle()
                    .fill(.black)
                    .frame(width: 15, height: 15)
                    .background(
                        Circle()
                            .stroke(.black, lineWidth: 1)
                            .padding(-3)
                    )
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
            }
            
            VStack{
                HStack(alignment: .top, spacing: 10){
                    VStack(alignment: .leading, spacing: 12) {
                        Text(task.taskTitle)
                            .font(.title2.bold())
                        Text(task.taskDescription)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }.hLeading()
                    Text(task.taskDate.formatted(date: .omitted, time: .shortened))
                }
            }.foregroundColor(.white)
                .padding()
                .hLeading()
                .background(.black)
                .cornerRadius(25)
        }.hLeading()
    }
    
    func HeaderView()->some View{
        HStack(spacing: 10){
            VStack(alignment: .leading,spacing: 10) {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                Text("Today")
                    .font(.largeTitle.bold())
            }
            .hLeading()
            
            Button{
                
            } label: {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
        }
        .padding()
        .padding(.top , getSafeArea().top )
        .background(.white)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View{
    func hLeading()->some View{
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTrailing()->some View{
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter()->some View{
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }
}
