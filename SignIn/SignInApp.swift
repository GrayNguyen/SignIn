//
//  SignInApp.swift
//  SignIn
//
//  Created by Gia Hân on 07/09/2023.
//

import SwiftUI
import Firebase

@main
struct SignInApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
