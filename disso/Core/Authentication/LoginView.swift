//
//  LoginView.swift
//  disso
//
//  Created by Madeha Ahmed on 06/04/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack {
                //image
                Image("AppIcon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 250)
                    .padding(.vertical, 32)
                
                //form fields
                VStack(spacing: 25) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@eample.com")
                    .autocapitalization(.none) //avoids capitalising email field accidentally
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter Password",
                              isSecureField: true)//preset this field as false
                
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sign in button
                
                Button {
                    print("Log user in..")
                } label: {
                    HStack {
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right.circle")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemOrange))
                .cornerRadius(20)
                .padding(.top, 20)
            
                
                Spacer()
                
                //sign up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size:20))
                }
                
            }
        }
    }
}

#Preview {
    LoginView()
}
