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
        }
    }
    
    func TasksView()->some View{
        LazyVStack(spacing: 18){
            
        }
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
}
