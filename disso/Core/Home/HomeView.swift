//
//  HomeView.swift
//  disso
//
//  Created by Madeha Ahmed on 09/04/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var showProfile = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20){
                Text("Welcome back to FitTribe!")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    VStack{
                        Image(systemName: "flame.fill")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                        Text("Badge: Bronze")
                    }
                }
                
                Button(action: {
                        Task {
                          //  await gymViewModel.markAttendance()
                        }
                    }) {
                        Label("Check In to Gym", systemImage: "checkmark.circle.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showProfile.toggle()
                    } label: {
                        Image(systemName: "person.circle.fill")
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
    HomeView()
        .environmentObject(AuthViewModel())
}
