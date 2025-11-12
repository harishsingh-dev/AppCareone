//
//  AppCareApp.swift
//  AppCare

import SwiftUI

@main
struct AppCareApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    //SplashScreenView()
                   // OnboardingStepTwoView()
                    // LoginOneView()
                    CommunityView()
                   
                    
                   
                }
            } else {
                NavigationView {
                    //SplashScreenView()
                    //OnboardingStepTwoView()
                   // HoldingScreenone()
                    CommunityView()
                   
                }
            }
        }
    }
}
