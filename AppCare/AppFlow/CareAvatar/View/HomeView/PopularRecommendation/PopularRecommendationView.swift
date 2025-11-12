//
//  PopularRecommendationView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 11/11/25.
//

//import SwiftUI
//
//struct PopularRecommendationView: View {
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//                ? geometry.size.width / 600.0
//                : 1.0
//            
//            VStack(alignment: .leading, spacing: 20 * scaleFactor) {
//                
//                // Title
//                Text("Popular Recommendation")
//                    .font(.custom("Inter-Medium", size: 20 * scaleFactor))
//                    .foregroundColor(Color(hex: "#39523A"))
//                    .padding(.horizontal)
//                    .padding(.top, 16 * scaleFactor)
//                
//                // Yoga & Strength Exercise Card (TOP-LEFT)
//                RecommendationCardView(
//                    title: "Yoga & Strength\nExercise",
//                    imageName: "Rectangle 150",
//                    scaleFactor: scaleFactor,
//                    alignment: .topLeading   // 👈 text position
//                )
//                
//                // Physiotherapy Card (BOTTOM-LEFT)
//                RecommendationCardView(
//                    title: "Physiotherapy",
//                    imageName: "Rectangle 160",
//                    scaleFactor: scaleFactor,
//                    alignment: .bottomLeading // 👈 text position
//                )
//                
//                Spacer()
//            }
//            //.frame(maxWidth: .infinity, alignment: .top)
//            .background(Color(.systemGroupedBackground))
//            .ignoresSafeArea(edges: .bottom)
//            
//            // ✅ inner ZStack size fix
//                        .frame(width: geometry.size.width, height: 430 * scaleFactor)
//        }
//        // ✅ outer frame fix (finite height)
//                .frame(height: 430 * (ConstantClass.shared.isIpad()
//                                      ? UIScreen.main.bounds.width / 600.0
//                                      : 1.0))
//    }
//}
//
//struct RecommendationCardView: View {
//    let title: String
//    let imageName: String
//    let scaleFactor: CGFloat
//    let alignment: Alignment   // 👈 new parameter
//    
//    var body: some View {
//        ZStack(alignment: alignment) { // 👈 use alignment parameter
//            Image(imageName)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 343 * scaleFactor, height: 183 * scaleFactor)
//                .clipped()
//            
//            Text(title)
//                .font(.system(size: 19.16 * scaleFactor))
//                .italic()
//                .foregroundColor(.black)
//                .padding(16 * scaleFactor)
//        }
//        .frame(width: 343 * scaleFactor, height: 183 * scaleFactor)
//        .cornerRadius(9.58)
//        .clipped()
//        .padding(.horizontal)
//    }
//}
//
//#Preview {
//    PopularRecommendationView()
//}

import SwiftUI

struct PopularRecommendationView: View {
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
            
            VStack(alignment: .leading, spacing: 20 * scaleFactor) {
                
                // Title
                Text("Popular Recommendation")
                    .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                    .foregroundColor(Color(hex: "#39523A"))
                    .padding(.horizontal)
                    .padding(.top, 16 * scaleFactor)
                
                // Yoga & Strength Exercise Card (TOP-LEFT)
                RecommendationCardView(
                    title: "Yoga & Strength\nExercise",
                    imageName: "Rectangle 150",
                    scaleFactor: scaleFactor,
                    alignment: .topLeading
                )
                
                // Physiotherapy Card (BOTTOM-LEFT)
                RecommendationCardView(
                    title: "Physiotherapy",
                    imageName: "Rectangle 160",
                    scaleFactor: scaleFactor,
                    alignment: .bottomLeading
                )
                
                Spacer(minLength: 0)
            }
//            .frame(
//                maxWidth: .infinity,
//                minHeight: 430 * scaleFactor,
//                maxHeight: 430 * scaleFactor,
//                alignment: .top
//            )
            //.background(Color(.systemGroupedBackground))
            // ✅ inner ZStack size fix
                        .frame(width: geometry.size.width, height: 430 * scaleFactor)

        }
        // ✅ outer frame fix (ensures proper stacking in parent VStack)
        .frame(maxWidth: .infinity)
        .frame(height: 430 * (ConstantClass.shared.isIpad()
                              ? UIScreen.main.bounds.width / 600.0
                              : 1.0))
    }
}

struct RecommendationCardView: View {
    let title: String
    let imageName: String
    let scaleFactor: CGFloat
    let alignment: Alignment
    
    var body: some View {
        ZStack(alignment: alignment) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 360 * scaleFactor, height: 183 * scaleFactor)
                .clipped()
            
            Text(title)
                .font(.system(size: 19.16 * scaleFactor))
                .italic()
                .foregroundColor(.black)
                .padding(16 * scaleFactor)
        }
        .frame(width: 360 * scaleFactor, height: 183 * scaleFactor)
        .cornerRadius(9.58)
        .clipped()
        .padding(.horizontal)
    }
}

#Preview {
    PopularRecommendationView()
}
