//
//  OnboardingStepThreeView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 28/09/25.
//

import SwiftUI


struct OnboardingStepThreeView: View {
    var body: some View {
            GeometryReader { geometry in
               // Set scaleFactor accordingly
                let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                        ? geometry.size.width / 600.0   // iPad → scale with width
                        : 1.0
                
                ScrollView {
                    ZStack(alignment: .bottomTrailing) { // 👈 Added alignment for bottom-right placement
                        
                        // MARK: - Background
                        Color.white
                            .ignoresSafeArea()
                        
                        VStack(spacing: scaleFactor * 10) {
                            
                            // MARK: - Image
                            Image("family fishing-bro 1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: scaleFactor * 250)
                                //.padding(.top, scaleFactor * 100)
                            
                            // MARK: - Texts
                            VStack(spacing: scaleFactor * 10) {
                                Text("Special Care for Special Needs")
                                    
                                    //.font(ConstantClass.shared.interFont(weight: "Inter-SemiBold", size: 24))
                                    .font(.custom("Inter-SemiBold", size: 24 * scaleFactor))
                                    .foregroundColor(Color(red: 32/255, green: 115/255, blue: 37/255))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Text("Support for Alzheimer’s and Autism with ")
                                    .font(ConstantClass.shared.interFont(weight: "Inter-Regular", size: 15))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Text("personalized caregiver tools.")
                                    .font(ConstantClass.shared.interFont(weight: "Inter-Regular", size: 15))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top, -scaleFactor * 8)
                            }
                            .padding(.bottom, scaleFactor * 40)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: geometry.size.height)
                        
                        
                        // MARK: - Bottom-Right Button
                        
                        
                        NavigationLink(destination: OnboardingStepFourView().navigationBarHidden(true)) {
                           
                            ZStack {
                                Circle()
                                    .fill(Color(red: 73/255, green: 162/255, blue: 78/255))
                                    .frame(width: scaleFactor * 60)
                                
                                Image("mingcute_arrow-down-line")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: scaleFactor * 30)
                                    .foregroundColor(.white)
                            }
                        }
                        // 👇 Moved to bottom-right with dynamic padding
                        .padding(.trailing, scaleFactor * 10)
                        .padding(.bottom, scaleFactor * 10)
                    }
                }
               // .scrollIndicators(.hidden) // cleaner look
            }
            .navigationBarHidden(true)
        }
    }

#Preview {
    OnboardingStepThreeView()
}
