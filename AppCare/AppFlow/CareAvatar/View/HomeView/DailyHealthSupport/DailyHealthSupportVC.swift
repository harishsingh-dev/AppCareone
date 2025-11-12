//
//  DailyHealthSupportVC.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 10/11/25.
//

import SwiftUI

struct DailyHealthSupportVC: View {
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            VStack(alignment: .leading) {
                Text("Daily Health Support")
                    .font(.custom("Inter-Medium", size: 22 * scaleFactor))
                           .foregroundColor(Color(hex: "#39523A"))
                          // .multilineTextAlignment(.center)
                           .padding(.top, scaleFactor * 30)
                           .padding(.leading, scaleFactor * 25)
                
                
                HStack(spacing: 35 * scaleFactor) {
                    VStack(){
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#FFD3C5"))
                                .frame(width: 94.18 * scaleFactor, height: 94.18 * scaleFactor)
                                .padding(.top, scaleFactor * 20)
                             Image("image 6")
                                .resizable()
                                .frame(width: 71 * scaleFactor, height: 82 * scaleFactor)
                                .padding(.top, scaleFactor * 40)
                        }
                        
                        Text("Health and\nFitness")
                            .font(.custom("Inter-Medium", size: 15 * scaleFactor))
                            .foregroundColor(Color(hex: "#000000"))
                            .multilineTextAlignment(.center)
                            .padding(.top, scaleFactor * 1)
                    }
                    //.padding(.leading, scaleFactor * 20)
                    
                    VStack(){
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#358ACB"))
                                .frame(width: 94.18 * scaleFactor, height: 94.18 * scaleFactor)
                                .padding(.top, scaleFactor * 20)
                             Image("image 8")
                                .resizable()
                                .frame(width: 103 * scaleFactor, height: 103 * scaleFactor)
                                .padding(.top, scaleFactor * 40)
                        }
                        
                        Text("Medical\nReminder")
                            .font(.custom("Inter-Medium", size: 15 * scaleFactor))
                            .foregroundColor(Color(hex: "#000000"))
                            .multilineTextAlignment(.center)
                            .padding(.top, scaleFactor * -12)
                    }
                    //.padding(.leading, scaleFactor * 20)
                    VStack(){
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#FFC068"))
                                .frame(width: 94.18 * scaleFactor, height: 94.18 * scaleFactor)
                                .padding(.top, scaleFactor * 20)
                             Image("image 13")
                                .resizable()
                                .frame(width: 73 * scaleFactor, height: 69 * scaleFactor)
                                .padding(.top, scaleFactor * 40)
                        }
                        
                        Text("Diet planner")
                            .font(.custom("Inter-Medium", size: 15 * scaleFactor))
                            .foregroundColor(Color(hex: "#000000"))
                            .multilineTextAlignment(.center)
                            .padding(.top, scaleFactor * 1)
                    }
                   
                }
                .padding(.horizontal, scaleFactor * 30)

                .padding(.top, scaleFactor * -10)
                
                
                Text("Kids & Seniors Care Support")
                    .font(.custom("Inter-Medium", size: 22 * scaleFactor))
                    .foregroundColor(Color(hex: "#39523A"))
                    .padding(.top, scaleFactor * 15)
                    .padding(.leading, scaleFactor * 25)
                
                HStack(spacing: 20) {
                           
                           // --- Autism Support Card ---
                           ZStack(alignment: .topLeading) {
                               VStack(spacing: 12) {
                                   Image("Rectangle 142") // replace with your image asset
                                       .resizable()
                                       .scaledToFill()
                                       .frame(width: 142 * scaleFactor,height: 142 * scaleFactor)
                                       .clipped()
                                       .cornerRadius(7.56)
                                       .padding(.horizontal, 10)
                                       .padding(.top, 15)
                                   
                                   Text("Autism Support")
                                       .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                                       .fontWeight(.bold)
                                       .foregroundColor(.black)
                                       .padding(.bottom, 10)
                               }
                               .frame(width: 167 * scaleFactor , height: 209 * scaleFactor)
                               .background(Color(red: 1.0, green: 0.89, blue: 0.87)) // soft peach
                               .cornerRadius(10)
                               .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
                               
                               // "Coming Soon" ribbon
                               Text("Coming Soon")
                                   .font(.custom("Inter-Regular", size: 10 * scaleFactor))
                                   .foregroundColor(.black)
                                   .padding(.vertical,3)
                                   .padding(.horizontal, 10)
                                   .background(Color(hex: "#F9EE26"))
                                   .rotationEffect(.degrees(-40))
                                   .offset(x: -10, y: 20)
                           }
                           
                           // --- Dementia Care Card ---
                           VStack(spacing: 12) {
                               Image("Rectangle 145") // replace with your image asset
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: 142 * scaleFactor,height: 142 * scaleFactor)
                                   .clipped()
                                   .cornerRadius(7.56)
                                   .padding(.horizontal, 10)
                                   .padding(.top, 15)
                               
                               Text("Dementia Care")
                                   .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                                   .fontWeight(.bold)
                                   .foregroundColor(.black)
                                   .padding(.bottom, 10)
                           }
                           .frame(width: 167 * scaleFactor , height: 209 * scaleFactor)
                           .background(Color(red: 0.95, green: 0.91, blue: 1.0)) // soft lavender
                           .cornerRadius(10)
                           .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
                       }
                     .padding(.top, 15 * scaleFactor)
                     .padding(.leading, 28 * scaleFactor)
                     .background(Color.white)
                
                Text("Daily Boost")
                    .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                           .foregroundColor(Color(hex: "#39523A"))
                           //.multilineTextAlignment(.center)
                           .padding(.top, scaleFactor * 18)
                           .padding(.leading, scaleFactor * 25)
                HStack(spacing: 20 * scaleFactor) {
                    ZStack {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: "#B9EEBA"))
                                    .frame(width: 45 * scaleFactor, height: 45 * scaleFactor)
                                
                                Image("streamline-flex_salad-vegetable-diet")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28.73 * scaleFactor, height: 28.73 * scaleFactor)
                            }
                            
                            Text("Diet")
                                .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                .foregroundColor(Color(hex: "#000000"))
                        }
                    }
                    .frame(width: 105 * scaleFactor, height: 87 * scaleFactor)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#203020"), lineWidth: 1)
                    )
                    
                    ZStack {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: "#B9EEBA"))
                                    .frame(width: 45 * scaleFactor, height: 45 * scaleFactor)
                                
                                Image("material-symbols_water-full-rounded")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28.73 * scaleFactor, height: 28.73 * scaleFactor)
                            }
                            
                            Text("Water Intake")
                                .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                .foregroundColor(Color(hex: "#000000"))
                        }
                    }
                    .frame(width: 105 * scaleFactor, height: 87 * scaleFactor)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#203020"), lineWidth: 1)
                    )
                    
                    ZStack {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: "#B9EEBA"))
                                    .frame(width: 45 * scaleFactor, height: 45 * scaleFactor)
                                
                                Image("iconoir_yoga")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28.73 * scaleFactor, height: 28.73 * scaleFactor)
                            }
                            
                            Text("Yoga Exercises")
                                .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                .foregroundColor(Color(hex: "#000000"))
                        }
                    }
                    .frame(width: 105 * scaleFactor, height: 87 * scaleFactor)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#203020"), lineWidth: 1)
                    )
                }
                .padding(.top,10 * scaleFactor)
                .padding(.horizontal, 30 * scaleFactor)

                
            }
            
            .frame(width: geometry.size.width, height: 650 * scaleFactor)
        }
        .frame(height: 650 * (ConstantClass.shared.isIpad()
                                      ? UIScreen.main.bounds.width / 600.0
                                      : 1.0))
    }
}

#Preview {
    DailyHealthSupportVC()
}


