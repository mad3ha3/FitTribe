//
//  ProfileView.swift
//  disso
//
//  Created by Madeha Ahmed on 07/04/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section{
                HStack {
                    Text("UN")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width:72, height: 72)
                        .background(Color(.systemOrange))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("User Name")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .padding(.top, 4)
                        
                        Text("test@gmail.com")
                            .font(.footnote)
                            .accentColor(.black)
                    }
                }
            }
            Section("Account") {
                Button{
                    print("Sign out..")
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
                Button{
                    print("Delete account..")
                } label: {
                    HStack(spacing: 12){
                        Image(systemName: "xmark.circle.fill")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundColor(.red)
                        Text("Delete Account")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
