
//  GenderProfilePhotoVC.swift
//  AppCare

//  Created by Harish Kumar Singh on 31/10/25.




import SwiftUI
import UIKit
import AVFoundation

struct GenderProfilePhotoVC: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var showImagePicker = false
    @State private var showSourceDialog = false
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @State private var showAlert = false
    @State private var navigateNext = false
    
    // 🔹 Keys for UserDefaults
    private let userImageKey = "userProfilePhoto"
    
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
                        
                        // 🔙 Back Button + Progress
                        HStack(spacing: 5 * scaleFactor) {
                            Button(action: { dismiss() }) {
                                Image("Back")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
                                    .padding(.leading, 25 * scaleFactor)
                                    .padding(.top, 58 * scaleFactor)
                            }
                            
                            VStack(alignment: .leading, spacing: 8 * scaleFactor) {
                                Text("Step 9/10")
                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                                    .padding(.leading, 15 * scaleFactor)
                                    .padding(.top, 60 * scaleFactor)
                                
                                GeometryReader { geo in
                                    let isLandscape = geo.size.width > geo.size.height
                                    
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                            .fill(Color(hex: "#C2C2C2"))
                                            .frame(
                                                width: geo.size.width * (isLandscape ? 0.85 : 0.7),
                                                height: 8 * scaleFactor
                                            )
                                        
                                        RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                            .fill(Color(hex: "#49A24E"))
                                            .frame(
                                                width: geo.size.width * (isLandscape ? 0.85 : 0.7) * 0.9,
                                                height: 8 * scaleFactor
                                            )
                                    }
                                    .padding(.leading, 15 * scaleFactor)
                                }
                            }
                            
//                            NavigationLink(destination: EmergencyContactVC().navigationBarHidden(true)) {
//                                Text("Skip")
//                                    .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
//                                    .foregroundColor(Color(hex: "#49A24E"))
//                                    .padding(.top, 74 * scaleFactor)
//                                    .padding(.trailing, 15 * scaleFactor)
//                            }
                        }
                        
                        // 📝 Title
                        Text("Add a profile photo ")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        // 🧾 Subtitle
                        Text("Choose a photo to represent yourself")
                            .font(.custom("Inter-Regular", size: 14.2 * scaleFactor))
                            .foregroundColor(Color(hex: "#878484"))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .padding(.top, 2 * scaleFactor)
                        
                        // 📸 Profile Image Picker
                        ZStack {
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150 * scaleFactor, height: 150 * scaleFactor)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray.opacity(0.4), lineWidth: 1))
                            } else {
                                Image("Ellipse 590")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150 * scaleFactor, height: 150 * scaleFactor)
                                
                                Image("octicon_person-24")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50 * scaleFactor, height: 50 * scaleFactor)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30 * scaleFactor)
                        .onTapGesture {
                            showSourceDialog = true
                        }
                        .confirmationDialog("Select Image Source", isPresented: $showSourceDialog) {
                            Button("Camera") {
                                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                    sourceType = .camera
                                    showImagePicker = true
                                } else {
                                    print("Camera not available (Simulator)")
                                }
                            }
                            Button("Photo Library") {
                                sourceType = .photoLibrary
                                showImagePicker = true
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(sourceType: sourceType, selectedImage: $selectedImage)
                                .onDisappear {
                                    // 🔹 Save the selected image when picker is closed
                                    if let image = selectedImage {
                                        saveImageToUserDefaults(image)
                                    }
                                }
                        }
                        
                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                // ✅ Continue Button
                Button(action: {
                    if selectedImage == nil {
                        showAlert = true
                    } else {
                        navigateNext = true
                    }
                }) {
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(selectedImage == nil ? Color(hex: "#C2C2C2") : Color(hex: "#49A24E"))
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                        .animation(.easeInOut, value: selectedImage != nil)
                }
                .disabled(selectedImage == nil)
                .alert("Please select a profile photo", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
                .background(
                    NavigationLink(
                        destination: EmergencyContactVC(selectedImage:selectedImage).navigationBarHidden(true),
                        isActive: $navigateNext
                    ) { EmptyView() }
                        .hidden()
                )
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            // 🔹 Load saved image when view appears
//            .onAppear {
//                if let savedImage = loadImageFromUserDefaults() {
//                    selectedImage = savedImage
//                }
            }
        }
    }
    

    // MARK: - 🧩 UserDefaults Helper Functions
    extension GenderProfilePhotoVC {
        private func saveImageToUserDefaults(_ image: UIImage) {
            if let data = image.jpegData(compressionQuality: 0.8) {
                UserDefaults.standard.set(data, forKey: userImageKey)
                print("✅ Image saved to UserDefaults")
            }
        }
        
//        private func loadImageFromUserDefaults() -> UIImage? {
//            if let data = UserDefaults.standard.data(forKey: userImageKey),
//               let image = UIImage(data: data) {
//                print("✅ Image loaded from UserDefaults")
//                return image
//            }
//            return nil
//        }
        
        // 🧩 Add this new helper
//        func getBase64ProfileImage() -> String? {
//                if let data = UserDefaults.standard.data(forKey: userImageKey) {
//                    return data.base64EncodedString()
//                }
//                return nil
//            }
        
        static func getBase64ProfileImage() -> String? {
                if let data = UserDefaults.standard.data(forKey: "userProfilePhoto") {
                    return data.base64EncodedString()
                }
                return nil
            }
    }


