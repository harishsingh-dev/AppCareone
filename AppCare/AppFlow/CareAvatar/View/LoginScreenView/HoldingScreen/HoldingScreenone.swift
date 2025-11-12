//
//  HoldingScreenone.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 03/11/25.
//






//import SwiftUI
//
//struct HoldingScreenone: View {
//    @State private var progressStage = 0
//    @State private var isHolding = false
//    @State private var circleScale: CGFloat = 1.0
//    @State private var bgColor = Color.white
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//            ? geometry.size.width / 600.0
//            : 1.0
//            
//            ZStack {
//                bgColor
//                    .ignoresSafeArea()
//                
//                VStack(spacing: 40) {
//                    // MARK: - Top Title (only visible at start)
//                    if progressStage == 0 {
//                        VStack(spacing: 8) {
//                            Text("Are you ready to begin?")
//                                .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
//                                .foregroundColor(.black)
//                                .padding(.top, 114 * scaleFactor)
//                                .frame(maxWidth: .infinity)
//                                .multilineTextAlignment(.center)
//
//                            Text("You’ve shared your goals. Now commit to your journey.")
//                                .font(.custom("Inter-Medium", size: 12 * scaleFactor))
//                                .foregroundColor(.black)
//                                .padding(.top, 1 * scaleFactor)
//                                .frame(maxWidth: .infinity)
//                                .multilineTextAlignment(.center)
//                        }
//                        .padding(.horizontal, 10)
//                    }
//                    
//                    Spacer()
//                    
//                    // MARK: - Commit Circle (centered)
//                    VStack(spacing: 20) {
//                        ZStack {
//                            Circle()
//                                .fill(Color(hex: "#3D8B43"))
//                                
//
//                                .scaleEffect(circleScale)
//                                .animation(.easeInOut(duration: 0.8), value: circleScale)
//                            
//                            if progressStage < 3 {
//                                Image(systemName: "touchid")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 46, height: 50)
//                                    .foregroundColor(.white)
//                            }
//                        }
//                        .frame(width: 100 * scaleFactor, height: 100 * scaleFactor)
//                        .contentShape(Circle())
//                        .gesture(
//                            LongPressGesture(minimumDuration: 2)
//                                .onChanged { _ in
//                                    if !isHolding {
//                                        isHolding = true
//                                        startAnimation()
//                                    }
//                                }
//                                .onEnded { _ in
//                                    isHolding = false
//                                }
//                        )
//                        
//                        // MARK: - Stage Text
//                        Text(stageText)
//                            .font(.custom("Inter-SemiBold", size: textSize(for: progressStage, scaleFactor: scaleFactor)))
//                            .foregroundColor(progressStage == 0 ? .black : .white)
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .transition(.opacity)
//                            .animation(.easeInOut, value: progressStage)
//                            .padding(.top, textPadding(for: progressStage))
//                    }
//                    
//                    Spacer()
//                }
//                .padding()
//            }
//        }
//        // ✅ Hide automatic back button
//        .navigationBarBackButtonHidden(true)
//    }
//    
//    // MARK: - Stage Text
//    private var stageText: String {
//        switch progressStage {
//        case 0: return "Hold to Commit"
//        case 1: return "Almost there"
//        case 2: return "Get Ready"
//        default: return "Welcome to Care Avatar"
//        }
//    }
//    
//    // MARK: - Dynamic Text Size
//    private func textSize(for stage: Int, scaleFactor: CGFloat) -> CGFloat {
//        switch stage {
//        case 0: return 16 * scaleFactor
//        case 1: return 20 * scaleFactor
//        case 2: return 20 * scaleFactor
//        default: return 25 * scaleFactor
//        }
//    }
//    
//    // MARK: - Dynamic Padding
//    private func textPadding(for stage: Int) -> CGFloat {
//        switch stage {
//        case 0: return -14
//        case 1, 2: return -40
//        default: return -100
//        }
//    }
//    
//    // MARK: - Animation Sequence
//    private func startAnimation() {
//        withAnimation(.easeInOut(duration: 0.8)) {
//            progressStage = 1
//            circleScale = 2.5
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            withAnimation(.easeInOut(duration: 0.8)) {
//                progressStage = 2
//                circleScale = 5
//            }
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            withAnimation(.easeInOut(duration: 0.8)) {
//                progressStage = 3
//                bgColor = .green
//                circleScale = 20
//            }
//        }
//    }
//}
//
//
//
//// MARK: - Preview
//#Preview {
//    HoldingScreenone()
//}

import SwiftUI

struct HoldingScreenone: View {
    @State private var progressStage = 0
    @State private var isHolding = false
    @State private var circleScale: CGFloat = 1.0
    @State private var bgColor = Color.white
    @State private var navigateNext = false  // ✅ New state for navigation
    
    var body: some View {
        NavigationStack { // Use NavigationStack for modern SwiftUI
            GeometryReader { geometry in
                let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
                
                ZStack {
                    bgColor
                        .ignoresSafeArea()
                    
                    VStack(spacing: 40) {
                        if progressStage == 0 {
                            VStack(spacing: 8) {
                                Text("Are you ready to begin?")
                                    .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                                    .foregroundColor(.black)
                                    .padding(.top, 114 * scaleFactor)
                                    .frame(maxWidth: .infinity)
                                    .multilineTextAlignment(.center)

                                Text("You’ve shared your goals. Now commit to your journey.")
                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                    .foregroundColor(.black)
                                    .padding(.top, 1 * scaleFactor)
                                    .frame(maxWidth: .infinity)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal, 10)
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: "#3D8B43"))
                                    .scaleEffect(circleScale)
                                    .animation(.easeInOut(duration: 0.8), value: circleScale)
                                
                                if progressStage < 3 {
                                    Image(systemName: "touchid")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 46, height: 50)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: 100 * scaleFactor, height: 100 * scaleFactor)
                            .contentShape(Circle())
                            .gesture(
                                LongPressGesture(minimumDuration: 2)
                                    .onChanged { _ in
                                        if !isHolding {
                                            isHolding = true
                                            startAnimation()
                                        }
                                    }
                                    .onEnded { _ in
                                        isHolding = false
                                    }
                            )
                            
                            Text(stageText)
                                .font(.custom("Inter-SemiBold", size: textSize(for: progressStage, scaleFactor: scaleFactor)))
                                .foregroundColor(progressStage == 0 ? .black : .white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .transition(.opacity)
                                .animation(.easeInOut, value: progressStage)
                                .padding(.top, textPadding(for: progressStage))
                        }
                        
                        Spacer()
                    }
                    .padding()
                    
                    // ✅ Hidden NavigationLink to trigger automatic navigation
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $navigateNext) {
                        EmptyView()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var stageText: String {
        switch progressStage {
        case 0: return "Hold to Commit"
        case 1: return "Almost there"
        case 2: return "Get Ready"
        default: return "Welcome to Care Avatar"
        }
    }
    
    private func textSize(for stage: Int, scaleFactor: CGFloat) -> CGFloat {
        switch stage {
        case 0: return 16 * scaleFactor
        case 1: return 20 * scaleFactor
        case 2: return 20 * scaleFactor
        default: return 25 * scaleFactor
        }
    }
    
    private func textPadding(for stage: Int) -> CGFloat {
        switch stage {
        case 0: return -14
        case 1, 2: return -40
        default: return -100
        }
    }
    
    private func startAnimation() {
        withAnimation(.easeInOut(duration: 0.8)) {
            progressStage = 1
            circleScale = 2.5
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 0.8)) {
                progressStage = 2
                circleScale = 5
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 0.8)) {
                progressStage = 3
                bgColor = .green
                circleScale = 20
            }
            
            // ✅ Navigate to next view after animation completes
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                navigateNext = true
            }
        }
    }
}

// Dummy NextView
struct NextView: View {
    var body: some View {
        Text("Next Screen")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
