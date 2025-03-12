//
//  LogInView.swift
//  UserLoginSignUp
//
//  Created by admin on 6/3/25.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Image("ice-cream-logo").resizable()
                    .scaledToFill().frame(width: 200, height: 200).padding(.vertical, 32)
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com").autocapitalization(.none)
                    
                    InputView(text: $password, title:"Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal).padding(.top, 12)
                
                // sign in button
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    VStack {
                        Text("SIGN IN").fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue)).disabled(!formIsValid).opacity(formIsValid ? 1.5 : 0.5).cornerRadius(10).padding(.top, 24)
                
                Spacer()
                
                // sign up button
                
                NavigationLink {
                    RegistrationView().navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up").fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
            
    }
}

// MARK: - AuthenticationFormProtocol

extension LogInView: AuthentiicationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LogInView()
}
