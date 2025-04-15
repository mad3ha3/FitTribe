//
//  AddWorkoutView.swift
//  disso
//
//  Created by Madeha Ahmed on 14/04/2025.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var workoutViewModel: WorkoutViewModel
    
    @State private var workoutName = ""
    @State private var workoutType = "Cardio"
    @State private var duration = 30
    @State private var caloriesBurned = 0
    @State private var notes = ""
    
    let workoutTypes = ["Cardio", "Strength", "Flexibility", "HIIT", "Yoga"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Workout Details")) {
                    TextField("Workout Name", text: $workoutName)
                        .textInputAutocapitalization(.never)
                    
                    Picker("Workout Type", selection: $workoutType) {
                        ForEach(workoutTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    
                    Stepper("Duration: \(duration) minutes", value: $duration, in: 1...180)
                    
                    Stepper("Calories Burned: \(caloriesBurned)", value: $caloriesBurned, in: 0...2000, step: 50)
                }
                
                Section(header: Text("Notes")) {
                    TextEditor(text: $notes)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Add Workout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveWorkout()
                    }
                    .disabled(workoutName.isEmpty)
                }
            }
        }
    }
    
    private func saveWorkout() {
        let workout = Workout(
            name: workoutName,
            type: workoutType,
            duration: duration,
            caloriesBurned: caloriesBurned,
            notes: notes,
            date: Date(),
            userId: "" // Will be set in the ViewModel
        )
        
        Task {
            await workoutViewModel.addWorkout(workout)
            dismiss() // Only dismiss after the workout is added
        }
    }
}

#Preview {
    AddWorkoutView(workoutViewModel: WorkoutViewModel())
}
