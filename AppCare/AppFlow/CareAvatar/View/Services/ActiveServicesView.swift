//
//  ActiveServicesView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 12/11/25.
//

import SwiftUI

struct ActiveServicesView: View {
    var body: some View {
        GeometryReader { geometry in
            
            // ✅ iPad scaling logic
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            VStack(spacing: 20 * scaleFactor) {
                Text("Active Services")
                    .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                    .foregroundColor(Color(hex: "#39523A"))
                    .padding(.leading, -180 * scaleFactor)
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    
                    ForEach(0..<2) { index in
                        HStack(spacing: 12 * scaleFactor) {
                            Image("Ellipse 606")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 66 * scaleFactor, height: 66 * scaleFactor)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 6 * scaleFactor) {
                                Text("Make Health Priority")
                                    .font(.custom("Inter-SemiBold", size: 16 * scaleFactor))
                                
                                Text("Caretaker")
                                    .font(.custom("Inter-Regular", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#000000"))
                            }
                            
                            Spacer()
                            
                            Text("In Progress")
                                .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                .foregroundColor(Color(hex: "#49A24E"))
                        }
                        .padding(.horizontal, 16 * scaleFactor)
                    }
                    
                }
                
                
                
            }
            // ✅ inner ZStack size fix
                        .frame(width: geometry.size.width, height: 200 * scaleFactor)

        }
        // ✅ outer frame fix (finite height)
                .frame(height: 200 * (ConstantClass.shared.isIpad()
                                      ? UIScreen.main.bounds.width / 600.0
                                      : 1.0))

    }
}
#Preview {
    ActiveServicesView()
}
