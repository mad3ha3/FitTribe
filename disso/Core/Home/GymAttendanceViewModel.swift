//
//  GymAttendanceViewModel.swift
//  disso
//
//  Created by Madeha Ahmed on 15/04/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

@MainActor
class GymAttendanceViewModel: ObservableObject {
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var hasCheckedInToday = false
    
    private let db = Firestore.firestore()
    
    init() {
        Task {
            await checkIfUserHasCheckedInToday()
        }
    }
    
    func checkIfUserHasCheckedInToday() async {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("DEBUG: No user ID found")
            return
        }
        
        let today = Calendar.current.startOfDay(for: Date())
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        
        do {
            let snapshot = try await db.collection("gymAttendance")
                .whereField("userId", isEqualTo: userId)
                .whereField("timestamp", isGreaterThanOrEqualTo: today)
                .whereField("timestamp", isLessThan: tomorrow)
                .getDocuments()
            
            hasCheckedInToday = !snapshot.documents.isEmpty
        } catch {
            print("DEBUG: Error checking attendance: \(error.localizedDescription)")
            errorMessage = "Failed to check attendance status"
        }
    }
    
    func checkIn() async -> Bool {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("DEBUG: No user ID found when checking in")
            return false
        }
        guard !hasCheckedInToday else { return false }
        
        isLoading = true
        
        do {
            let attendance = GymAttendance(
                userId: userId,
                timestamp: Date()
            )
            
            try db.collection("gymAttendance").addDocument(from: attendance)
            hasCheckedInToday = true
            isLoading = false
            return true
        } catch {
            print("DEBUG: Error checking in: \(error.localizedDescription)")
            errorMessage = "Failed to check in"
            isLoading = false
            return false
        }
    }
    
    func getAttendanceCount(for userId: String) async -> Int {
        do {
            let snapshot = try await db.collection("gymAttendance")
                .whereField("userId", isEqualTo: userId)
                .getDocuments()
            
            return snapshot.documents.count
        } catch {
            print("DEBUG: Error getting attendance count: \(error.localizedDescription)")
            return 0
        }
    }
}
