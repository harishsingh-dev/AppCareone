//
//  OnboardingStepTwoView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 25/09/25.
//

import SwiftUI

import SwiftUI

struct OnboardingStepTwoView: View {
    var body: some View {
            GeometryReader { geometry in
                        // Set scaleFactor accordingly
                let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                        ? geometry.size.width / 600.0   // iPad → scale with width
                        : 1.0
                
                ScrollView {
                    ZStack(alignment: .bottomTrailing) { // 👈 Added alignment 
                        Color.white
                            .ignoresSafeArea()
                        
                        VStack(spacing: scaleFactor * 10) {
                            
                            // MARK: - Image
                            Image("Healthy habit-bro 1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: scaleFactor * 250)
                                //.padding(.top, scaleFactor * 100)
                            
                            // MARK: - Texts
                            VStack(spacing: scaleFactor * 10) {
                                Text("Complete Wellness")
                                    //.font(ConstantClass.shared.interFont(size: 25))
                                    .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                                    .foregroundColor(Color(red: 32/255, green: 115/255, blue: 37/255))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Text(Constant.Track_yoga)
                                    .font(ConstantClass.shared.interFont(size: 15))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Text(Constant.Track_yogaa)
                                    .font(ConstantClass.shared.interFont(size: 15))
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
                        
                        
                        NavigationLink(destination: OnboardingStepThreeView().navigationBarHidden(true)) {
                           
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
            }
           
        }
    
}

#Preview {
    OnboardingStepTwoView()
}
