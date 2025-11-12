//
//  LoadingVC.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 30/10/25.
//

import SwiftUI

struct LoadingVC: View {
    @State private var navigate = false
    var body: some View {
        GeometryReader { geometry in
            
            // Scale for iPad / iPhone
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            
            VStack(spacing: 30 * scaleFactor) {
                
                Spacer()
                
                // Text message
                Text("Hang tight, we’re building your personalized experience…")
                    .font(.custom("Inter-SemiBold", size: scaleFactor * 22))
                    .foregroundColor(.black)
                    //.multilineTextAlignment(.center)
                    .padding(.horizontal, 30 * scaleFactor)
                
                
                // Custom gradient loader
                GradientLoader(size: 78 * scaleFactor)
                    .padding(.top, 40 * scaleFactor)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            
            //autonavigation
            .onAppear {
                // Navigate after 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigate = true
                }
            }
            // Navigation trigger
            .navigationDestination(isPresented: $navigate) {
                GenderOne()
              }
                
            }
                                
        }
    }


struct GradientLoader: View {
    let size: CGFloat
    @State private var rotation: Angle = .degrees(0)
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.85) // creates the "arc"
            .stroke(
                AngularGradient(
                    gradient: Gradient(colors: [Color.green, Color.green.opacity(0)]),
                    center: .center
                ),
                style: StrokeStyle(lineWidth: size * 0.15, lineCap: .round)
            )
            .frame(width: size, height: size)
            .rotationEffect(rotation)
            .onAppear {
                withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    rotation = .degrees(360)
                }
            }
    }
}

#Preview {
    LoadingVC()
}
