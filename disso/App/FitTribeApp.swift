//
//  FitTribeApp.swift
//  disso
//
//  Created by Madeha Ahmed on 06/04/2025.
//

import SwiftUI
import Firebase

@main
struct FitTribeApp: App {
    @StateObject var viewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView() // Replace with LoginView() or MainView() if needed
                .environmentObject(viewModel)
        }
    }
}

