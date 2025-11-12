//
//  ServicesView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 12/11/25.
//

import SwiftUI

struct NewServicessView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ServicesView()
                    .padding(.top,20)
                ActiveServicesView()
                    .padding(.top, 80)
                History()
            }
            .padding(.bottom, 20) // Optional – bottom padding for spacing
        }
       // .ignoresSafeArea() // ✅ Safe area ignore kar diya
    }
}

#Preview {
    NewServicessView()
}
