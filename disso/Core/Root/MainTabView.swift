//
//  MainTabView.swift
//  disso
//
//  Created by Madeha Ahmed on 09/04/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            WorkoutLogView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workout")
                }
            
            LeaderboardView()
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Leaderboard")
                }
        
            
            ChatView()
                .tabItem {
                    Image(systemName: "ellipsis.message.fill")
                    Text("Chat")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    MainTabView()
}
