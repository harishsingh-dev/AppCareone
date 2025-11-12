//
//  privacyPolicy.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 12/11/25.
//

import SwiftUI

struct privacyPolicy: View {
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            VStack(alignment: .center, spacing: 0) {
               Image("image 15")
                .resizable()
                .scaledToFit()
                .frame(width: 77 * scaleFactor, height: 77 * scaleFactor)
             Text("Your health data is 100% secure and encrypted. We never\nshare it without your consent.")
                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                           .foregroundColor(Color(hex: "#585858"))
                           .multilineTextAlignment(.center)
                           .padding(.top, scaleFactor * 10)
                           .padding(.horizontal, scaleFactor * 10)
                Text("Privacy policy")
                    .font(.custom("Inter-Semibold", size: 12 * scaleFactor))
                           .foregroundColor(Color(hex: "#396E2E"))
                           .multilineTextAlignment(.center)
                          // .padding(.top, scaleFactor * 10)
                           .padding(.horizontal, scaleFactor * 10)
                
            }
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            // ✅ inner ZStack size fix
                        .frame(width: geometry.size.width, height: 140 * scaleFactor)

        }
        // ✅ outer frame fix (finite height)
                .frame(height: 140 * (ConstantClass.shared.isIpad()
                                      ? UIScreen.main.bounds.width / 600.0
                                      : 1.0))

    }
}

#Preview {
    privacyPolicy()
}
