
//  CustomTabBarView.swift
//  AppCare

//  Created by Harish Kumar Singh on 11/11/25.




import SwiftUI
//import
struct CustomTabBarView: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, services, community, care, profile
    }
    
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
            
            VStack {
                Spacer()
                
                HStack(spacing: 40 * scaleFactor) {
                    
                    TabButton(
                        image: "material-symbols-light_home-rounded",
                        title: "Home",
                        isSelected: selectedTab == .home,
                        showBadge: false,
                        scaleFactor: scaleFactor
                    ) { selectedTab = .home }
                    
                    TabButton(
                        image: "pepicons-pencil_handshake",
                        title: "Service",
                        isSelected: selectedTab == .services,
                        showBadge: false,
                        scaleFactor: scaleFactor
                    ) { selectedTab = .services }
                    
                    TabButton(
                        image: "Vector",
                        title: "Community",
                        isSelected: selectedTab == .community,
                        showBadge: true,
                        scaleFactor: scaleFactor
                    ) { selectedTab = .community }
                    
                    TabButton(
                        image: "Group",
                        title: "Upscale",
                        isSelected: selectedTab == .care,
                        showBadge: false,
                        scaleFactor: scaleFactor
                    ) { selectedTab = .care }
                    
                    TabButton(
                        image: "Group (1)",
                        title: "Profile",
                        isSelected: selectedTab == .profile,
                        showBadge: false,
                        scaleFactor: scaleFactor
                    ) { selectedTab = .profile }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20 * scaleFactor)
                .padding(.vertical, 12 * scaleFactor)
                .background(Color.white.shadow(radius: 2))
            }
            .frame(width: geometry.size.width, height: 75 * scaleFactor)
        }
        .frame(height: 75 * (ConstantClass.shared.isIpad() ? UIScreen.main.bounds.width / 600.0 : 1.0))
    }
}

// MARK: - Tab Button
struct TabButton: View {
    let image: String
    let title: String
    let isSelected: Bool
    let showBadge: Bool
    let scaleFactor: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .topTrailing) {
                
                HStack(spacing: 6 * scaleFactor) {
                    Image(image)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isSelected ? 18 * scaleFactor : 22 * scaleFactor,
                               height: isSelected ? 18 * scaleFactor : 22 * scaleFactor)
                        .foregroundColor(isSelected ? .white : .gray)
                    
                    if isSelected {
                        Text(title)
                            .font(.system(size: 14 * scaleFactor, weight: .medium))
                            .foregroundColor(.white)
                            .lineLimit(1)                   // ✅ CHANGED: Prevent multiline text
                            .minimumScaleFactor(0.6)        // ✅ CHANGED: Shrink text if needed
                            .transition(.opacity)
                            .animation(.easeInOut, value: isSelected)
                    }
                }
                .padding(.horizontal, isSelected ? 14 * scaleFactor : 0)
                .padding(.vertical, isSelected ? 8 * scaleFactor : 0)
                .background(isSelected ? Color(hex: "#39523A") : Color.clear)
                .cornerRadius(isSelected ? 20 * scaleFactor : 0)
                
                // 🔴 Badge
                if showBadge {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 18 * scaleFactor, height: 18 * scaleFactor)
                        .overlay(
                            Text("4")
                                .font(.system(size: 10 * scaleFactor, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .offset(x: 10 * scaleFactor, y: -8 * scaleFactor)
                }
            }
        }
       // .frame(minWidth: 0, maxWidth: .infinity) // ✅ CHANGED: Make button adaptive to prevent clipping
    }
}



// MARK: - Preview
#Preview {
    CustomTabBarView()
}
