//
//  WhatsOnYourMindView.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 11/11/25.
//




import SwiftUI

struct WhatsOnYourMindView: View {
    let items: [MindItem] = [
        MindItem(title: "Weight loose", imageName: "Rectangle 161"),
        MindItem(title: "Weight gain", imageName: "Rectangle 164"),
        MindItem(title: "Diet", imageName: "Rectangle 163"),
        MindItem(title: "Exercise videos", imageName: "Rectangle 166"),
        MindItem(title: "Mental wellness", imageName: "Rectangle 165"),
        MindItem(title: "Step Count", imageName: "Rectangle 167")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
            
            VStack(alignment: .leading, spacing: 20 * scaleFactor) {
                
                // Title
                Text("What’s on your mind")
                    .font(.custom("Inter-Medium", size: 20 * scaleFactor))
                    .foregroundColor(Color(hex: "#39523A"))
                    .padding(.horizontal)
                    .padding(.top, 16 * scaleFactor)
                
                // Grid layout
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 16 * scaleFactor),
                        GridItem(.flexible(), spacing: 16 * scaleFactor),
                        GridItem(.flexible(), spacing: 16 * scaleFactor)
                    ],
                    spacing: 20 * scaleFactor
                ) {
                    ForEach(items) { item in
                        VStack(spacing: 8 * scaleFactor) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100 * scaleFactor, height: 100 * scaleFactor)
                                .clipped()
                                .cornerRadius(9.58)
                            
                            Text(item.title)
                                .font(.custom("Inter-Medium", size: 15.5 * scaleFactor))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            // .frame(maxWidth: .infinity, maxHeight: 400.15 * scaleFactor, alignment: .top) // 👈 Keeps it top-aligned
            .background(Color(hex: "#FCF0FB")) // 👈 Light pink background
            .cornerRadius(9.58)
            //.padding(.top, 0) // optional
            // ✅ inner ZStack size fix
            .frame(width: geometry.size.width, height: 400.15 * scaleFactor)
        }
        // ✅ outer frame fix (finite height)
        .frame(height: 400.15 * (ConstantClass.shared.isIpad()
                                      ? UIScreen.main.bounds.width / 600.0
                                      : 1.0))

    }
}

struct MindItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

#Preview {
    WhatsOnYourMindView()
}
