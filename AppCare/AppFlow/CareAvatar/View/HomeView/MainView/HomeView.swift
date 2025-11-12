//
//  HomeView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 08/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    HeaderView()
                    
                    ChatNowSecondView()
                    
                    DailyHealthSupportVC()
                        .padding(.top, -20)
                    BookYourExports()
                    ServicesView()
                    Spacer(minLength: 50)
                    PopularRecommendationView()
                    WhatsOnYourMindView()
                    privacyPolicy()
                        .padding(.top,-25)
                   
                }
                .padding(.horizontal, 0) // optional
            }
            .ignoresSafeArea(edges: .horizontal)
            CustomTabBarView()
        }

    }
}

#Preview {
    HomeView()
}
