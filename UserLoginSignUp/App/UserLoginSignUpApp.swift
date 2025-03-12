//
//  UserLoginSignUpApp.swift
//  UserLoginSignUp
//
//  Created by admin on 6/3/25.
//

import SwiftUI
import Firebase

@main
struct UserLoginSignUpApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
