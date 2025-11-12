//
//  ChatNowSecondView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 10/11/25.
//



//import SwiftUI
//
//struct ChatNowSecondView: View {
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//                ? geometry.size.width / 600.0
//                : 1.0
//            
//            ZStack {
//                // Background gradient with custom colors
//                LinearGradient(
//                    gradient: Gradient(colors: [
//                        Color(hex: "FFD2D2"),
//                        Color(hex: "FFFFFF")
//                    ]),
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                .ignoresSafeArea()
//               
//                Text("Stop Recurring \nHeadaches")
//                    .font(.custom("Inter-Medium", size: 25 * scaleFactor))
//                    .foregroundColor(Color(hex: "#830D0D"))
//                    .offset(x: -100 * scaleFactor, y: -60 * scaleFactor)
//
//                Text("Find and fix the root cause of **tension** and\n*migrane* headaches")
//                    .font(.custom("Inter-Regular", size: 10 * scaleFactor))
//                    .foregroundColor(Color(hex: "#830D0D"))
//                    .offset(x: -90 * scaleFactor, y: -5 * scaleFactor)
//
//                Image("image 14")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 123 * scaleFactor, height: 199 * scaleFactor)
//                    .padding(.top , 28 * scaleFactor)
//                    .padding(.leading, 235 * scaleFactor)
//
//                Text("Chat Now")
//                    .font(.custom("Inter-Medium", size: 15 * scaleFactor))
//                    .foregroundColor(.white)
//                    .frame(width: 127 * scaleFactor, height: 35 * scaleFactor)
//                    .background(
//                        Color(hex: "#FF4D4D")
//                            .cornerRadius(10 * scaleFactor)
//                    )
//                    .padding(.top, 150 * scaleFactor)
//            }
//            // ✅ inner ZStack size fix
//            .frame(width: geometry.size.width, height: 258 * scaleFactor)
//        }
//        // ✅ outer frame fix (finite height)
//        .frame(height: 258 * (ConstantClass.shared.isIpad()
//                              ? UIScreen.main.bounds.width / 600.0
//                              : 1.0))
//    }
//}
//
//#Preview {
//    ChatNowSecondView()
//}

import SwiftUI

struct ChatNowSecondView: View {
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
            
            ZStack {
                // Background gradient with custom colors
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "FFD2D2"),
                        Color(hex: "FFFFFF")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
               
                Text("Stop Recurring \nHeadaches")
                    .font(.custom("Inter-Medium", size: 25 * scaleFactor))
                    .foregroundColor(Color(hex: "#830D0D"))
                    .offset(x: -80 * scaleFactor, y: -60 * scaleFactor)

                Text("Find and fix the root cause of **tension** and\n*migrane* headaches")
                    .font(.custom("Inter-Regular", size: 10 * scaleFactor))
                    .foregroundColor(Color(hex: "#830D0D"))
                    .offset(x: -70 * scaleFactor, y: -5 * scaleFactor)

                Image("image 14")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 123 * scaleFactor, height: 199 * scaleFactor)
                    .padding(.top , 28 * scaleFactor)
                    .padding(.leading, 235 * scaleFactor)

                Text("Chat Now")
                    .font(.custom("Inter-Medium", size: 15 * scaleFactor))
                    .foregroundColor(.white)
                    .frame(width: 127 * scaleFactor, height: 35 * scaleFactor)
                    .background(
                        Color(hex: "#FF4D4D")
                            .cornerRadius(10 * scaleFactor)
                    )
                    .padding(.top, 150 * scaleFactor)
            }
            // ✅ use maxWidth instead of geometry.size.width
            .frame(maxWidth: .infinity, minHeight: 258 * scaleFactor, maxHeight: 258 * scaleFactor)
        }
        // ✅ Outer frame full width + fixed height
        .frame(maxWidth: .infinity)
        .frame(height: 258 * (ConstantClass.shared.isIpad()
                              ? UIScreen.main.bounds.width / 600.0
                              : 1.0))
    }
}

#Preview {
    ChatNowSecondView()
}
