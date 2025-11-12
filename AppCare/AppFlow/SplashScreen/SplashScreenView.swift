//
//  SplashScreenView.swift
//  AppCare
//
//  Created by Rohit Shishodia on 28/10/25.
//

import SwiftUI

struct SplashScreenView: View {
    // State variable to control navigation
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            // After 2 seconds → show LoginScreen
            OnboardingStepTwoView()
        } else {
            VStack(spacing: ConstantClass.shared.isIpad() ? 20 : 10) {
                Image("SplashIcon")
                    .resizable()
                    .frame(
                        width: ConstantClass.shared.isIpad() ? 300 : 200,
                        height: ConstantClass.shared.isIpad() ? 300 : 200
                    )
                   
                Text(Constant.Welcome)
                    .font(ConstantClass.shared.interFont(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 32/255, green: 115/255, blue: 37/255))
                    .padding(.top,-20)
                 
                //Text Subtitle
                Text(Constant.Personalized)
                    .font(ConstantClass.shared.interFont(size: 12))
                    .foregroundColor(Color(hex: "#D16B93"))
                    .multilineTextAlignment(.center)
                
                Text(Constant.Personalizedd)
                    .font(ConstantClass.shared.interFont(size: 12))
                    .foregroundColor(Color(hex: "#D16B93"))
                    .multilineTextAlignment(.center)
                    .padding(.top,-10)
                
            }
            
            
            .frame(width: ConstantClass.shared.isIpad() ? UIScreen.screenWidth/1.5 : UIScreen.screenWidth - 20 )
            .background(Color.white)
            .onAppear {
                // Wait for 2 seconds before switching
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
