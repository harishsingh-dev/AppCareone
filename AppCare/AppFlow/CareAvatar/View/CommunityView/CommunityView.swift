//
//  CommunityView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 12/11/25.
//



import SwiftUI

struct CommunityView: View {
    @State private var selectedTab: CommunityTab = .explore
    
    enum CommunityTab {
        case explore, joined
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            // ✅ iPad scaling logic
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            
            ScrollView {
                VStack(spacing: 20 * scaleFactor) {
                    
                    // MARK: - Header
                    HStack {
                        Text("Community")
                            .font(.custom("Inter-Medium", size: 25 * scaleFactor))
                            .foregroundColor(Color(hex: "#000000"))
                            
                        
                        Spacer()
                        
                        HStack(spacing: 15 * scaleFactor) {
                            Button(action: {}) {
                                Image("material-symbols-light_add-box-outline-rounded")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 32 * scaleFactor,minHeight: 32 * scaleFactor)
                                    .foregroundColor(.black)
                            }
                            
                            Button(action: {}) {
                                Image("Vector (1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 24 * scaleFactor,minHeight: 22.11 * scaleFactor)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.horizontal, 16 * scaleFactor)
                    
                    // MARK: - Horizontal Scroll of Users
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16 * scaleFactor) {
                            ForEach(0..<5) { index in
                                ZStack(alignment: .bottom) {
                                    Image("Rectangle 5740")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 137 * scaleFactor,minHeight: 148 * scaleFactor)
                                        .clipShape(RoundedRectangle(cornerRadius: 10 * scaleFactor))
                                    
                                    HStack {
                                        Image("Ellipse 605")
//                                            .resizable()
//                                            .scaledToFill()
                                            .frame(maxWidth: 30 * scaleFactor,minHeight: 30 * scaleFactor)
                                            .clipShape(RoundedRectangle(cornerRadius: 15 * scaleFactor))
                                        
                                        
                                        Text("Jane Matry")
                                            .font(.custom("Inter-Bold", size: 12 * scaleFactor))
                                            .foregroundColor(Color(hex: "#FFFFFF"))
                                    }
                                    // 👇 This gives space between the bottom of the image and the HStack
                                       .padding(.bottom, 10 * scaleFactor)
                                    
                                }
                            }
                        }
                        .padding(.horizontal, 16 * scaleFactor)
                    }
                    
                    // MARK: - Upcoming Event Card
                    VStack(alignment: .leading, spacing: 12 * scaleFactor) {
                        Text("Upcoming Event")
                            .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                            .foregroundColor(Color(hex: "#39523A"))

                            .padding(.horizontal, 16 * scaleFactor)
                        
                        VStack(alignment: .leading, spacing: 8 * scaleFactor) {
                            Text("Community Dance Night")
                                .font(.custom("Inter-Bold", size: 16 * scaleFactor))
                                .foregroundColor(.white)
                            
                            Text("Join us for fun evening of game, dance and socializing")
                                .font(.custom("Inter-Regular", size: 12 * scaleFactor))
                                .foregroundColor(Color(hex: "#FFFFFF"))
                                .padding(.top, -5 * scaleFactor)
                            
                            Text("Oct 16, 8:00PM")
                                .font(.custom("Inter-Regular", size: 12 * scaleFactor))
                                .foregroundColor(Color(hex: "#FFFFFF"))
                                .padding(.top, 4 * scaleFactor)
                            
                            // Images inside the card
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 18 * scaleFactor) {
                                    ForEach(0..<3) { index in
                                        Image("Rectangle 5746")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100 * scaleFactor, height: 100 * scaleFactor)
                                            .clipShape(RoundedRectangle(cornerRadius: 12 * scaleFactor))
                                            .padding(.top, 10 * scaleFactor)
                                    }
                                }
                            }
                        }
                        .padding(16 * scaleFactor)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "#9598FF"),
                                    Color(hex: "#5A5FF1")
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )

                        .cornerRadius(16 * scaleFactor)
                        .padding(.horizontal, 16 * scaleFactor)
                    }
                    
                    // MARK: - Find Friends Card
                    VStack(alignment: .leading, spacing: 15 * scaleFactor) {
                        Text("Find Friends")
                            .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                            .foregroundColor(Color(hex: "#39523A"))
                            .padding(.leading, 20 * scaleFactor)
                        
                        
                        HStack(spacing: 30 * scaleFactor) {
                            VStack(spacing: 5){
                                Text("Lets Connect to the people near\n you")
                                    .font(.custom("Inter-Bold", size: 15 * scaleFactor))
                                    .foregroundColor(Color(hex: "#F0F0F0"))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                HStack(spacing: -10 * scaleFactor) {
                                    ForEach(0..<5) { index in
                                        Image("image")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40 * scaleFactor, height: 40 * scaleFactor)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 1 * scaleFactor))
                                    }
                                    Spacer()
                                    Text("56 Near You")
                                        .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                        .foregroundColor(Color(hex: "#F0F0F0"))
                                        .offset(x: -30 * scaleFactor)
                                }
                                
                               
                            }
                            
                         
                            
                            
                            
                            
                            ZStack() {
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 41 * scaleFactor, height: 41 * scaleFactor)
                                    .overlay(
                                               Circle()
                                                   .stroke(Color(hex: "#E57A27"), lineWidth: 1 * scaleFactor)
                                           )
                                
                                
                                Image(systemName: "arrow.up.right")
                                    .resizable()
                                    .font(.system(size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#E57A27"))
                                    .frame(width: 19 * scaleFactor, height: 19 * scaleFactor)
                            }
                        }
                        .padding(16 * scaleFactor)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "#FCDDA2"),
                                    Color(hex: "#E47621")
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )

                        .cornerRadius(16 * scaleFactor)
                        .padding(.horizontal, 16 * scaleFactor)
                    }
                    
                    Text("Community")
                        .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                        .foregroundColor(Color(hex: "#39523A"))
                        .padding(.leading, -180 * scaleFactor)
                        .padding(.top, 12 * scaleFactor)
                    
                    // MARK: - Community Tabs
                    HStack(spacing: 0) {
                        Button(action: { selectedTab = .explore }) {
                            Text("Explore")
                                .font(.custom("Inter-Medium", size: 15 * scaleFactor))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                // अंदर padding दी ताकि background चारों तरफ से हो
                                .padding(.vertical, 8 * scaleFactor)
                                .padding(.horizontal, 16 * scaleFactor)
                                .frame(maxWidth: .infinity)
                                .background(
                                               RoundedRectangle(cornerRadius: 8 * scaleFactor)
                                                   .fill(selectedTab == .explore ? Color.white : Color.clear)
                                                   // Left & right से थोड़ा space देने के लिए horizontal padding यहाँ
                                                   .padding(.horizontal, 10 * scaleFactor)
                                           )
                        }
                        
                        Button(action: { selectedTab = .joined }) {
                            Text("Joined")
                                .font(.custom("Inter-Medium", size: 15 * scaleFactor))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                // अंदर padding दी ताकि background चारों तरफ से हो
                                .padding(.vertical, 8 * scaleFactor)
                                .padding(.horizontal, 16 * scaleFactor)
                                .frame(maxWidth: .infinity)
                                .background(
                                               RoundedRectangle(cornerRadius: 8 * scaleFactor)
                                                   .fill(selectedTab == .joined ? Color.white : Color.clear)
                                                   // Left & right से थोड़ा space देने के लिए horizontal padding यहाँ
                                                   .padding(.horizontal, 10 * scaleFactor)
                                           )
                        }
                    }
                    .frame(height: 50 * scaleFactor)
                    .background(Color(hex: "#F2FAF0"))
                    .cornerRadius(8 * scaleFactor)
                    .padding(.horizontal, 16 * scaleFactor)

                    
                    
                    // MARK: - Community List
                    VStack(spacing: 12 * scaleFactor) {
                        ForEach(0..<8) { index in
                            HStack(spacing: 12 * scaleFactor) {
                                Image("Ellipse 606")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 66 * scaleFactor, height: 66 * scaleFactor)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 6 * scaleFactor) {
                                    Text("Make Health Priority")
                                        .font(.custom("Inter-SemiBold", size: 15.02 * scaleFactor))
                                    
                                    Text("7+ Messages")
                                        .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                        .foregroundColor(Color(hex: "#49A24E"))
                                }
                                
                                Spacer()
                                
                                Text("Yesterday")
                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#000000"))
                            }
                            .padding(.horizontal, 16 * scaleFactor)
                        }
                    }
                }
                .padding(.vertical, 16 * scaleFactor)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CommunityView()
}
