//
//  WorkoutListView.swift
//  disso
//
//  Created by Madeha Ahmed on 14/04/2025.
//

import SwiftUI

struct WorkoutListView: View {
    let workouts: [Workout]
    let selectedDay: WeekDay
    
    private var filteredWorkouts: [Workout] {
        workouts.filter { workout in
            Calendar.current.isDate(workout.date, inSameDayAs: selectedDay.date)
        }
    }
    
    var body: some View {
        if filteredWorkouts.isEmpty {
            VStack {
                Spacer()
                Text("No workouts for this day")
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
        } else {
            List {
                ForEach(filteredWorkouts) { workout in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(workout.name)
                                .font(.headline)
                            Spacer()
                            Text(workout.type)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Label("\(workout.duration) min", systemImage: "clock")
                            Spacer()
                            Label("\(workout.caloriesBurned) cal", systemImage: "flame")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        if !workout.notes.isEmpty {
                            Text(workout.notes)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    WorkoutListView(
        workouts: [
            Workout(
                name: "Morning Run",
                type: "Cardio",
                duration: 30,
                caloriesBurned: 300,
                notes: "Felt great!",
                date: Date(),
                userId: "preview"
            )
        ],
        selectedDay: .today
    )
}
