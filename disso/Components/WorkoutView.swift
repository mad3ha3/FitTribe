//
//  WorkoutView.swift
//  disso
//
//  Created by Madeha Ahmed on 14/04/2025.
//

import SwiftUI


// MARK: - Weekday Selector Component
// Weekday Selector scroll view for filtering workout by day
struct WeekdaySelector: View {
    @Binding var selectedDay: WeekDay
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(WeekDay.allCases, id: \.self) { day in
                    WeekdayButton(
                        day: day,
                        isSelected: day == selectedDay,
                        action: { selectedDay = day }
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        .background(Color(.systemBackground))
    }
}

// MARK: - Day Button Component
//button representing an individual day of the week
struct WeekdayButton: View {
    let day: WeekDay
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(day.rawValue)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(isSelected ? .white : .primary)
                .frame(width: 44, height: 44) // Minimum touch target size
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.blue : Color(.systemGray6))
                )
        }
    }
}

// MARK: - Workout List Component
//displays a filtered list of workouts for a selected day
struct WorkoutList: View {
    let workouts: [Workout]
    let selectedDay: WeekDay
    
    var filteredWorkouts: [Workout] {
        workouts.filter { workout in
            Calendar.current.isDate(workout.date, inSameDayAs: dateForSelectedDay)
        }
    }
    
    //computes date based on selected weekday
    private var dateForSelectedDay: Date {
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let selectedWeekday = WeekDay.allCases.firstIndex(of: selectedDay)! + 2
        let difference = selectedWeekday - weekday
        
        return calendar.date(byAdding: .day, value: difference, to: today) ?? today
    }
    
    var body: some View {
        List {
            if filteredWorkouts.isEmpty {
                Text("No workouts for \(selectedDay.rawValue)")
                    .foregroundColor(.secondary)
            } else {
                ForEach(filteredWorkouts) { workout in
                    WorkoutRow(workout: workout)
                }
            }
        }
        .listStyle(.plain)
        .padding()
    }
}

// MARK: - Workout Row Component
//shows a single workout row in the list
struct WorkoutRow: View {
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(workout.name)
                    .font(.headline)
                
                Spacer()
                
                Text("\(workout.duration) min")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Text(workout.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("\(workout.caloriesBurned) cal")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            if !workout.notes.isEmpty {
                Text(workout.notes)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Supporting Types
//used for filtering workouts
enum WeekDay: String, CaseIterable {
    case monday = "Mon"
    case tuesday = "Tue"
    case wednesday = "Wed"
    case thursday = "Thu"
    case friday = "Fri"
    case saturday = "Sat"
    case sunday = "Sun"
    
    //used to create the date for a given weekday - used in filters
    var date: Date {
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let daysToAdd = (self.rawValue == "Mon" ? 2 : 
                        self.rawValue == "Tue" ? 3 :
                        self.rawValue == "Wed" ? 4 :
                        self.rawValue == "Thu" ? 5 :
                        self.rawValue == "Fri" ? 6 :
                        self.rawValue == "Sat" ? 7 : 1) - weekday
        return calendar.date(byAdding: .day, value: daysToAdd, to: today) ?? today
    }
    
    //returns todays weekday as weekday enum
    static var today: WeekDay {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: Date())
        return WeekDay.allCases[weekday - 1]
    }
}
