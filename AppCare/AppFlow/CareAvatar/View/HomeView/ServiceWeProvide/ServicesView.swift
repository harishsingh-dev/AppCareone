//
//  ServicesView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 11/11/25.
//

//import SwiftUI
//
//struct ServicesView: View {
//    var body: some View {
//        
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//            ? geometry.size.width / 600.0
//            : 1.0
//            VStack(alignment: .leading, spacing: 30) {
//                
//                // Title
//                Text("Services We Provide")
//                    .font(.custom("Inter-Medium", size: 20 * scaleFactor))
//                           .foregroundColor(Color(hex: "#39523A"))
//                   
//                    .padding(.horizontal)
//                    .padding(.top, 16 * scaleFactor) // Add some top padding so it’s not clipped
//                
//                // Book Caretaker Card
//                ServiceCardView(
//                    title: "Book Caretaker",
//                    subtitle: "Trained nurse or physiotherapist at home",
//                    buttonTitle: "Book Now",
//                    buttonColor: Color(hex: "#E95290"),
//                    imageName: "Rectangle 259",
//                    scaleFactor: scaleFactor
//
//                )
//                
//                // Book Medical Items Card
//                ServiceCardView(
//                    title: "Book Medical Items",
//                    subtitle: "Oxygen cylinders, beds, wheelchairs & more",
//                    buttonTitle: "Order Now",
//                    buttonColor: Color(hex: "#1F7124"),
//                    imageName: "Rectangle 262",
//                    scaleFactor: scaleFactor
//
//                )
//                
//                Spacer() // Push content up neatly
//            }
//            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//            .background(Color(.systemGroupedBackground))
//            .ignoresSafeArea(edges: .bottom)
//            .frame(width: geometry.size.width, height: 320 * scaleFactor)
//        }
//        .frame(maxWidth: .infinity)
//        // ✅ outer frame fix (finite height)
//                .frame(height: 320 * (ConstantClass.shared.isIpad()
//                                      ? UIScreen.main.bounds.width / 600.0
//                                      : 1.0))
//    }
//}
//struct ServiceCardView: View {
//    let title: String
//    let subtitle: String
//    let buttonTitle: String
//    let buttonColor: Color
//    let imageName: String
//    let scaleFactor: CGFloat
//
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 8) {
//                Text(title)
//                    .font(.custom("Inter-SemiBold", size: 15.5 * scaleFactor))
//                    .foregroundColor(Color(hex: "#000000"))
//                
//                Text(subtitle)
//                    .font(.custom("Inter-Regular", size: 11 * scaleFactor))
//                    .foregroundColor(Color(hex: "#878484"))
//                
//                Button(action: {}) {
//                    Text(buttonTitle)
//                        .font(.custom("Inter-SemiBold", size: 13 * scaleFactor))
//                        .foregroundColor(Color(hex: "#F0F0F0"))
//                        .padding(.horizontal, 24)
//                        .padding(.vertical, 10)
//                        .background(buttonColor)
//                        .cornerRadius(15.62)
//                }
//                .padding(.top, 8)
//            }
//            
//            Spacer()
//            
//            Image(imageName)
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: 125 * scaleFactor, minHeight: 104 * scaleFactor)
//                .padding(.trailing, 8)
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(15)
//        .overlay( // 👇 Border added here
//            RoundedRectangle(cornerRadius: 15)
//                .stroke(Color(hex: "#00000033"), lineWidth: 0.52)
//        )
//        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
//        .padding(.horizontal)
//    }
//}
//
//struct ServicesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ServicesView()
//    }
//}

import SwiftUI

struct ServicesView: View {
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
            
            VStack(alignment: .leading, spacing: 30 * scaleFactor) {
                
                // Title
                Text("Services We Provide")
                    .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                    .foregroundColor(Color(hex: "#39523A"))
                    .padding(.horizontal)
                    .padding(.top, 16 * scaleFactor)
                
                // Book Caretaker Card
                ServiceCardView(
                    title: "Book Caretaker",
                    subtitle: "Trained nurse or physiotherapist at home",
                    buttonTitle: "Book Now",
                    buttonColor: Color(hex: "#E95290"),
                    imageName: "Rectangle 259",
                    scaleFactor: scaleFactor
                )
                
                // Book Medical Items Card
                ServiceCardView(
                    title: "Book Medical Items",
                    subtitle: "Oxygen cylinders, beds, wheelchairs & more",
                    buttonTitle: "Order Now",
                    buttonColor: Color(hex: "#1F7124"),
                    imageName: "Rectangle 262",
                    scaleFactor: scaleFactor
                )
                
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, minHeight: 320 * scaleFactor, maxHeight: 320 * scaleFactor, alignment: .top)
            
        }
        // 👇 This outer frame tells the VStack in HomeView the actual height.
        .frame(maxWidth: .infinity)
        .frame(height: 320 * (ConstantClass.shared.isIpad()
                              ? UIScreen.main.bounds.width / 600.0
                              : 1.0))
        
        
        
    }
}

struct ServiceCardView: View {
    let title: String
    let subtitle: String
    let buttonTitle: String
    let buttonColor: Color
    let imageName: String
    let scaleFactor: CGFloat

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.custom("Inter-SemiBold", size: 15.5 * scaleFactor))
                    .foregroundColor(Color(hex: "#000000"))

                Text(subtitle)
                    .font(.custom("Inter-Regular", size: 11 * scaleFactor))
                    .foregroundColor(Color(hex: "#878484"))

                Button(action: {}) {
                    Text(buttonTitle)
                        .font(.custom("Inter-SemiBold", size: 13 * scaleFactor))
                        .foregroundColor(Color(hex: "#F0F0F0"))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .background(buttonColor)
                        .cornerRadius(15.62)
                }
                .padding(.top, 8)
            }

            Spacer()

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 125 * scaleFactor, minHeight: 104 * scaleFactor)
                .padding(.trailing, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .overlay( // 👇 Border added here
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(hex: "#00000033"), lineWidth: 0.52)
        )
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}

