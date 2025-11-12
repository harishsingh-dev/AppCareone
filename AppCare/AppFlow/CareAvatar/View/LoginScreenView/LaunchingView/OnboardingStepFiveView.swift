//
//  OnboardingStepFiveView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 28/09/25.
//

import SwiftUI

struct OnboardingStepFiveView: View {
    var body: some View {
            GeometryReader { geometry in
               
                // Set scaleFactor accordingly
                let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0   // iPad → scale with width
                : 1.0
                
                ScrollView {
                    VStack {
                        // Background color
                        Color.white
                            .ignoresSafeArea()
                        
                        VStack(spacing: scaleFactor * 10) {
                            // Main Image
                            Image("Group Chat-bro 1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: scaleFactor * 417, height: scaleFactor * 417)
                            
                            VStack(spacing: scaleFactor * 10) {
                                Text("Connect with the Community")
                                    .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                                    .foregroundColor(Color(red: 32/255, green: 115/255, blue: 37/255))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .opacity(1)
                                
                                // Second Text (split into two lines)
                                Text("Meet people nearby or talk one-on-one. You're not")
                                    .font(ConstantClass.shared.interFont(size: 15))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                // Third Text
                                Text("alone.")
                                    .font(ConstantClass.shared.interFont(size: 15))
                                  
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top, -scaleFactor * 10)
                            }
                            .padding(.bottom, scaleFactor * 40)
                            
                            Spacer() // Yeh content ko upar push karega
                            
                            // Continue Button - Ab yeh content ke neeche hi rahega
                            NavigationLink(destination: LoginOneView().navigationBarHidden(true)) {
                                HStack {
                                    Spacer()
                                    Text("Continue")
                                        .font(ConstantClass.shared.interFont(size: 18))
                                        
                                        .foregroundColor(.white)
                                        .frame(width: scaleFactor * 343, height: scaleFactor * 51)
                                        .background(Color(red: 0x49/255, green: 0xA2/255, blue: 0x4E/255))
                                        .cornerRadius(10)
                                    Spacer()
                                }
                                .padding(.top, scaleFactor * 30)
                                .padding(.bottom, scaleFactor * 10)
                                .padding(.horizontal, scaleFactor * 45)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: geometry.size.height)
                    }
                    .padding(.horizontal,-scaleFactor * 45)
                }
            }
            .navigationBarHidden(true)
        
    }
}

#Preview {
    OnboardingStepFiveView()
}
