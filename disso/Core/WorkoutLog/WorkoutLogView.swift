//
//  WorkoutLogView.swift
//  disso
//
//  Created by Madeha Ahmed on 09/04/2025.
//

import SwiftUI

struct WorkoutLogView: View {
    @State private var showAddWorkout = false
    @State private var selectedDay: WeekDay = .today
    @StateObject private var workoutViewModel = WorkoutViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                WeekdaySelector(selectedDay: $selectedDay)
                if workoutViewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    WorkoutListView(workouts: workoutViewModel.workouts, selectedDay: selectedDay)
                }
            }
            .navigationTitle("Workout Log")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddWorkout.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
        .sheet(isPresented: $showAddWorkout) {
            AddWorkoutView(workoutViewModel: workoutViewModel)
        }
        .refreshable {
            await workoutViewModel.refreshWorkouts()
        }
    }
}

#Preview {
    WorkoutLogView()
        .environmentObject(AuthViewModel())
}
