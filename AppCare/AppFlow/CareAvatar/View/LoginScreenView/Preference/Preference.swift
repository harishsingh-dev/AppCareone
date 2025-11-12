
//  Preference.swift
//  AppCare

//  Created by Harish Kumar Singh on 30/10/25.


import SwiftUI

struct Preference: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CategoriesViewModel()
    // Navigation trigger state
    @State private var navigateToLoading = false
    @StateObject private var postviewModel = CategoriesViewModel()

    
    // MARK: - Categories Grid
    @State private var selectedCategoryIDs: Set<UUID> = [] // multiple selection support
    

    
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
            
            ZStack(alignment: .bottomTrailing) {
                // MARK: - Scrollable Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
                        
                        // MARK: - Back Button
                        Button(action: { dismiss() }) {
                            Image("Back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
                                .padding(.leading, 25 * scaleFactor)
                                .padding(.top, 58 * scaleFactor)
                        }
                        
                        // MARK: - Heading
                        VStack(alignment: .leading, spacing: 4 * scaleFactor) {
                            Text("What brings you to Care")
                                .font(.custom("Inter-SemiBold", size: scaleFactor * 25))
                                .foregroundColor(.black)
                            
                            Text("Avatar?")
                                .font(.custom("Inter-SemiBold", size: scaleFactor * 25))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 30 * scaleFactor)
                        .padding(.top, 20 * scaleFactor)
                        
                       
                        LazyVGrid(
                            columns: [GridItem(.flexible()), GridItem(.flexible())],
                            spacing: 12 * scaleFactor
                        ) {
                            ForEach(viewModel.categories) { category in
                                let isSelected = selectedCategoryIDs.contains(category.id)
                                
                                Text(category.name ?? "Unknown")
                                    .font(.custom("Inter-Regular", size: scaleFactor * 16))
                                    .foregroundColor(isSelected ? Color(hex: "#E36598") : Color(hex: "#49A24E"))
                                    .frame(maxWidth: .infinity, minHeight: 46 * scaleFactor)
                                    .background(isSelected ? Color(hex: "#FFEAF2") : Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 15 * scaleFactor)) // keeps background inside border
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15 * scaleFactor)
                                            .stroke(isSelected ? Color(hex: "#E36598") : Color(hex: "#49A24E"), lineWidth: 1 * scaleFactor)
                                    )
                                    .onTapGesture {
                                        if isSelected {
                                            selectedCategoryIDs.remove(category.id)
                                        } else {
                                            selectedCategoryIDs.insert(category.id)
                                        }
                                        print("✅ Selected categories:", selectedCategoryIDs)
                                    }
                            }
                        }
                        .padding(.horizontal, 20 * scaleFactor)
                        .padding(.top, 40 * scaleFactor)
                        Spacer(minLength: 100 * scaleFactor) // Give space for floating button
                    }
                }
                .onAppear {
                    viewModel.fetchCategories()
                }
                
                
                
                // MARK: - Floating Button
                                Button(action: {
                                    // Navigate only if something is selected
                                    if !selectedCategoryIDs.isEmpty {
                                        // Navigation trigger handled by state
                                        navigateToLoading = true
                                        
                                        //api calling
                                                                               
                                        let selectedNames = postviewModel.selectedNames(from: selectedCategoryIDs)
                                        postviewModel.fetchPostCategories(selectedNames: selectedNames)

                                        
                                        
                                    }
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(selectedCategoryIDs.isEmpty ? Color(hex: "#C2C2C2") : Color(hex: "#49A24E"))
                                            .frame(width: scaleFactor * 60)
                                        
                                        Image("mingcute_arrow-down-line")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: scaleFactor * 30)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.trailing, 25 * scaleFactor)
                                .padding(.bottom, 25 * scaleFactor)
                                .disabled(selectedCategoryIDs.isEmpty) // disables tap
                                .background(
                                    NavigationLink(
                                        destination: LoadingVC().navigationBarHidden(true),
                                        isActive: $navigateToLoading
                                    ) { EmptyView() }
                                )
                
                
            }
        }
    }
}


#Preview {
    Preference()
}

