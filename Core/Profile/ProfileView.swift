import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @State private var showingSignOutAlert = false
    @State private var showingDeleteAccountAlert = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            List {
                // User Info Section
                Section("Personal Information") {
                    if let user = authViewModel.currentUser {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(user.fullname)
                                .font(.headline)
                            
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                // Actions Section
                Section {
                    // Sign Out Button
                    Button(role: .destructive) {
                        showingSignOutAlert = true
                    } label: {
                        HStack {
                            Text("Sign Out")
                            Spacer()
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                    
                    // Delete Account Button
                    Button(role: .destructive) {
                        showingDeleteAccountAlert = true
                    } label: {
                        HStack {
                            Text("Delete Account")
                            Spacer()
                            Image(systemName: "person.crop.circle.badge.minus")
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .alert("Sign Out", isPresented: $showingSignOutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Sign Out", role: .destructive) {
                    signOut()
                }
            } message: {
                Text("Are you sure you want to sign out?")
            }
            .alert("Delete Account", isPresented: $showingDeleteAccountAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    deleteAccount()
                }
            } message: {
                Text("Are you sure you want to delete your account? This action cannot be undone.")
            }
        }
    }
    
    private func signOut() {
        authViewModel.signOut()
        dismiss()
    }
    
    private func deleteAccount() {
        authViewModel.deleteAccount { success in
            if success {
                dismiss()
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
} 