//
//  Home.swift
//  MyRealApplication
//
//  Created by Daydou on 1/7/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]){
                Section{
                    
                }
            header: {
                headerView()
            }
            }
        }
    }
    
    func headerView()->some View{
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
