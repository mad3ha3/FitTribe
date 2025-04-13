import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            LeaderboardView()
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Leaderboard")
                }
            
            WorkoutLogView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workout")
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
        .environmentObject(AuthViewModel())
} 