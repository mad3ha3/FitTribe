//
//  WorkoutLogView.swift
//  disso
//
//  Created by Madeha Ahmed on 09/04/2025.
//

import SwiftUI

struct WorkoutLogView: View {
    @State private var showProfile = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Your workout logging content here
                Text("Workout Log Content")
            }
            .navigationTitle("Workout Log")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showProfile.toggle()
                    } label: {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
        .sheet(isPresented: $showProfile) {
            ProfileView()
                .environmentObject(authViewModel)
        }
    }
}



#Preview {
    WorkoutLogView()
}

