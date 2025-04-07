//
//  RegistrationView.swift
//  disso
//
//  Created by Madeha Ahmed on 07/04/2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            
            //image
            Image("AppIcon")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 250)
                .padding(.vertical, 6)
            
            //form fields
            VStack(spacing: 25) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@eample.com")
                .autocapitalization(.none) //avoids capitalising email field accidentally
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Your Name")
              
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter Password",
                          isSecureField: true)//preset this field as false
                .autocapitalization(.none)

                InputView(text: $confirmPassword,
                                    title: "Confirm Password",
                                    placeholder: "Re-enter Password",
                                    isSecureField: true)
                .autocapitalization(.none)
                          
            }
            .padding(.horizontal)
            .padding(.top, 4)
            
            Button {
                print("Sigh user up..")
            } label: {
                HStack {
                    Text("Sign Up")
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
            
            Button {
                dismiss()
            } label: {
                    HStack {
                        Text("Already Have An Account?")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }
                    .font(.system(size:16))
            }
        }
    }
}

#Preview {
    RegistrationView()
}
