//
//  History.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 12/11/25.
//

import SwiftUI

struct History: View {
    var body: some View {
        GeometryReader { geometry in
                    
                    // ✅ iPad scaling logic
                    let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                    ? geometry.size.width / 600.0
                    : 1.0
                    
                    VStack(alignment: .leading, spacing: 20 * scaleFactor) {
                        // Title
                        Text("History")
                            .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                            .foregroundColor(Color(hex: "#39523A"))
                            .padding(.leading, 14 * scaleFactor)

                        // Caretaker Card hhhh
                        HStack(alignment: .center, spacing: 20 * scaleFactor) {
                            // Profile Image
                            Image("Rectangle 5634") // Replace with your asset name
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118 * scaleFactor, height: 108 * scaleFactor)
                                .clipShape(RoundedRectangle(cornerRadius: 10 * scaleFactor))
                                .clipped()

                            // Text + Button Section
                            VStack(alignment: .leading, spacing: 8 * scaleFactor) {
                                Text("Caretaker")
                                    .font(.custom("Inter-SemiBold", size: 18 * scaleFactor))
                                    .foregroundColor(Color(hex: "#000000"))

                                Text("Sam Dyson")
                                    .font(.custom("Inter-Regular", size: 16 * scaleFactor))
                                    .foregroundColor(Color(hex: "#000000"))

                                Button(action: {
                                    print("View Details tapped")
                                }) {
                                    Text("View Details")
                                        .font(.custom("Inter-Medium", size: 16 * scaleFactor))

                                        .foregroundColor(Color(hex: "#49A24E"))
                                        .frame(width: 150 * scaleFactor, height: 36 * scaleFactor)
                                        .background(Color(hex: "#E8FDEA"))
                                        .cornerRadius(10 * scaleFactor)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 16 * scaleFactor)
                    }
                    .padding()
            // ✅ inner ZStack size fix
                        .frame(width: geometry.size.width, height: 175 * scaleFactor)

                }
        // ✅ outer frame fix (finite height)
                .frame(height: 175 * (ConstantClass.shared.isIpad()
                                      ? UIScreen.main.bounds.width / 600.0
                                      : 1.0))
    }
}

#Preview {
    History()
}
