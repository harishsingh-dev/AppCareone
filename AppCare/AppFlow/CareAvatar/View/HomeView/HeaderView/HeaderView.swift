//
//  HeaderView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 08/11/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            HStack(spacing: 1 * scaleFactor){
                Image("image 5")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 72 * scaleFactor,minHeight: 72 * scaleFactor)
                    .padding(.top , 31 * scaleFactor)
                    .padding(.leading,4 * scaleFactor)
                
                Text("Care Avatar")
                    .font(.custom("Inter-Regular", size: 20 * scaleFactor))
                    .foregroundColor(Color(hex: "#D36794"))              .padding(.top, scaleFactor * 28)
                     .padding(.leading, scaleFactor * -8)
                
                Spacer()
                
                Image("mdi_bell-outline")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 24 * scaleFactor,minHeight: 24 * scaleFactor)
                    .padding(.top , 28 * scaleFactor)
                    .padding(.trailing, 16 * scaleFactor)

                
                
                
                
            }
            .frame(width: geometry.size.width, height: 73 * scaleFactor)
        }
        .frame(height: 73 * (ConstantClass.shared.isIpad()
                                     ? UIScreen.main.bounds.width / 600.0
                                     : 1.0))

       
    }
}

#Preview {
    HeaderView()
}
