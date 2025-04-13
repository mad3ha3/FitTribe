//
//  ProfileView.swift
//  disso
//
//  Created by Madeha Ahmed on 07/04/2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List {
                Section{
                    HStack {
                        Text(user.intials)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width:72, height: 72)
                            .background(Color(.systemOrange))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Section("Account") {
                    Button{
                        viewModel.signOut()
                    } label: {
                        HStack(spacing: 12){
                            Image(systemName: "arrow.left.circle.fill")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundColor(.red)
                            Text("Sign Out")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
