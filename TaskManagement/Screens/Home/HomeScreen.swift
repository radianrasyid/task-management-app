//
//  HomeScreen.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HomeScreenHeaderView()
                    
                    DashboardCardView()
                        .padding(.bottom)
                    
                    InProgressSection()
                        .padding(.bottom)
                    
                    TaskGroupsView()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeScreen()
}

struct HomeScreenHeaderView: View {
    var body: some View {
        HStack(alignment: .center){
            Circle()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text("Hello!")
                    .font(.subheadline)
                
                Text("Radian Rasyid")
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Button(action: {}){
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 15, height: 17)
                    .foregroundStyle(Color(.systemPurple))
            }
        }
    }
}

struct DashboardCardView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [Color(.systemPurple), .purple], startPoint: .leading, endPoint: .trailing))
                .frame(maxWidth: .infinity, minHeight: 170)
                .clipShape(.rect(cornerRadius: 20))
            
            HStack{
                VStack(alignment: .leading){
                    
                    Spacer()
                    
                    Text("Your today's task\nalmost done!")
                        .foregroundStyle(Color(.white))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Text("View Task")
                            .padding(.all, 10)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.systemPurple))
                            .background(Color(.white))
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                //MARK: -circular
                CircularProgressView(font: .headline)
                
                Spacer()
                
                VStack{
                    Button(action: {}){
                        Image(systemName: "ellipsis")
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 2)
                            .foregroundStyle(Color(.white))
                            .background(Color(.systemGray6.withAlphaComponent(0.5)))
                            .clipShape(.rect(cornerRadius: 5))
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct InProgressCardView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(.blue.withAlphaComponent(0.1)))
                .frame(width: 220, height: 120)
                .clipShape(.rect(cornerRadius: 20))
            
            
            VStack(alignment: .leading){
                HStack{
                    Text("Office Project")
                        .font(.footnote)
                        .foregroundStyle(Color(.gray))
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "doc.fill")
                        .padding(.all, 5)
                        .foregroundStyle(Color(.systemPink))
                        .background(Color(.systemPink.withAlphaComponent(0.1)))
                        .clipShape(.rect(cornerRadius: 10))
                    
                }
                
                Text("Grocery shopping app design")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                ZStack(alignment: .leading){
                    Rectangle()
                        .frame(width: 200, height: 8)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(.white)
                    
                    Rectangle()
                        .frame(width: 150, height: 8)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(.blue)
                }
            }
            .frame(width: 200, height: 100)
        }
    }
}

struct InProgressSection: View {
    var body: some View {
        HStack(alignment: .center){
            Text("In Progress")
                .font(.title2)
                .fontWeight(.bold)
            ZStack(alignment: .center){
                Circle()
                    .fill(Color(.purple.withAlphaComponent(0.1)))
                    .frame(width: 20, height: 20)
                
                Text("6")
                    .font(.footnote)
            }
            
            Spacer()
        }
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<4){item in
                    InProgressCardView()
                }
            }
        }
    }
}

struct CircularProgressView: View {
    let lineWidth:CGFloat
    let size: CGFloat
    let color: Color
    let innerTextColor: Color
    let font: Font
    
    init(size: CGFloat = 80, color: Color = .white, innerTextColor: Color = .white, font: Font = .footnote, lineWidth: CGFloat = 10) {
        self.size = size
        self.color = color
        self.innerTextColor = innerTextColor
        self.font = font
        self.lineWidth = lineWidth
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: lineWidth
                )
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(
                    color,
                    // 1
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
            
            Text("85%")
                .font(font)
                .fontWeight(.bold)
                .foregroundStyle(Color(innerTextColor))
        }
        .frame(width: size, height: size)
    }
}

struct TaskGroupCardView: View {
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 15)
                .padding(.horizontal)
                .frame(width: .infinity, height: 75)
                .foregroundColor(Color(.white))
                .shadow(color: .gray.opacity(0.15), radius: 3, x: 0, y: 0)
            
            HStack{
                Image(systemName: "suitcase.fill")
                    .padding(.all, 9)
                    .foregroundStyle(Color.pink.opacity(0.7))
                    .background(Color.pink.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 10))
                
                VStack(alignment: .leading){
                    Text("Office Project")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    Text("23 Tasks")
                        .font(.caption2)
                        .foregroundStyle(Color(.systemGray))
                }
                
                Spacer()
                
                CircularProgressView(size: 45, color: .blue, innerTextColor: .black, font: .caption2, lineWidth: 4)
            }
            .padding(.horizontal, 40)
            
        }
        .padding(.all, -10)
        .frame(width: .infinity, height: 78)
    }
}

struct TaskGroupsView: View {
    var body: some View {
        HStack(alignment: .center){
            Text("Task Groups")
                .font(.title2)
                .fontWeight(.bold)
            ZStack(alignment: .center){
                Circle()
                    .fill(Color(.purple.withAlphaComponent(0.1)))
                    .frame(width: 20, height: 20)
                
                Text("6")
                    .font(.footnote)
            }
            
            Spacer()
        }
        
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                //MARK: -Task Group Cards
                ForEach(0..<10){item in
                    TaskGroupCardView()
                }
            }
        }
    }
}
