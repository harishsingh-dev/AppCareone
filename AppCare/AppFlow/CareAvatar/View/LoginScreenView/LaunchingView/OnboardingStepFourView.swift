//
//  OnboardingStepFourView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 28/09/25.
//

import SwiftUI

struct OnboardingStepFourView: View {
    var body: some View {
            GeometryReader { geometry in
                let isIpad = UIDevice.current.userInterfaceIdiom == .pad
                
                // Set scaleFactor accordingly
                let scaleFactor: CGFloat = isIpad
                ? geometry.size.width / 600.0   // iPad → scale with width
                : 1.0
                
                ScrollView{
                    ZStack(alignment: .bottomTrailing) {
                        // Background color
                        Color.white
                            .ignoresSafeArea()
                        
                        VStack(spacing: scaleFactor * 10) {
                            // Main Image
                            Image("Emergency call-pana 1")
                                .resizable()
                            // .frame(width: 305, height: 305)
                                .frame(width: scaleFactor * 305, height: scaleFactor * 305)
                            
                            
                            
                            VStack(spacing: scaleFactor * 10){
                                // First Text
                                Text("Emergency SOS")
                                    .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                                   
                                    .foregroundColor(Color(red: 32/255, green: 115/255, blue: 37/255))
                                   
                                    .multilineTextAlignment(.center)
                                    
                                    .padding(.horizontal)
                                
                                // Second Text (split into two lines)
                                Text("Alert your loved ones instantly in case of ")
                                    .font(ConstantClass.shared.interFont(size: 15))
                                    .foregroundColor(.black)
                                    //.frame(width: 363, height: 54)
                                    .multilineTextAlignment(.center)
                                   
                                    .padding(.horizontal)
                                
                                //Third Text
                                Text("emergencies.")
                                    .font(ConstantClass.shared.interFont(size: 12))
                                 
                                    .font(ConstantClass.shared.interFont(weight: "Inter-SemiBold", size: 15))
                                    .foregroundColor(.black) //.frame(width: 363, height: 54)
                                    .multilineTextAlignment(.center)
                                    
                                   
                                    .padding(.top, -scaleFactor * 9)
                            }
                            .padding(.bottom, scaleFactor * 40)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: geometry.size.height)
                      
                        
                        
                        
                        // Ellipse Image
                        NavigationLink(destination: OnboardingStepFiveView()
                            .navigationBarHidden(true)) {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 73/255, green: 162/255, blue: 78/255)) // green circle
                                        .frame(width: scaleFactor * 60)
                                    
                                    Image("mingcute_arrow-down-line")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: scaleFactor * 30) // adjust size as needed
                                        .foregroundColor(.white) // make arrow white
                                }
                                
                                
                            }
                            .padding(.trailing, scaleFactor * 10)
                            .padding(.bottom, scaleFactor * 10)
                    }
                }
                
                
            }
            .navigationBarHidden(true)
        }
    
}

#Preview {
    OnboardingStepFourView()
}
