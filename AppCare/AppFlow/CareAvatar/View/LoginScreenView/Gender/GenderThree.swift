
//  GenderThree.swift
//  AppCare

//  Created by Harish Kumar Singh on 31/10/25.






import SwiftUI

struct GenderThree: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedGender: String? = nil
    @State private var navigateNext: Bool = false // manual navigation control

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
                                Text("Step 3/10")
                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                                    .padding(.leading, 15 * scaleFactor)
                                    .padding(.top, 45 * scaleFactor)

                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                        .fill(Color(hex: "#C2C2C2"))
                                        .frame(width: geometry.size.width * 0.7, height: 8 * scaleFactor)

                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                        .fill(Color(hex: "#49A24E"))
                                        .frame(width: geometry.size.width * 0.7 * 0.3, height: 8 * scaleFactor)
                                }
                                .padding(.leading, 15 * scaleFactor)
                            }
                        }

                        // 📝 Title
                        Text("Which gender do you more closely identify with?")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)

                        // 👦 Male Option
                        genderOptionView(
                            label: "Male",
                            imageName: "️🧔🏻_♂️",
                            scaleFactor: scaleFactor,
                            geometry: geometry
                        )

                        // 👩 Female Option
                        genderOptionView(
                            label: "Female",
                            imageName: "🙎🏻_♀️" ,// replace with actual female icon if available
                            scaleFactor: scaleFactor,
                            geometry: geometry
                        )

                        // ⚧ Others Option (centered)
                        genderOptionView(
                            label: "Others",
                            imageName: "  ",
                            scaleFactor: scaleFactor,
                            geometry: geometry
                        )

                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }

                // ✅ Continue Button
                Button(action: {
                    if selectedGender != nil {
                        
                        // Save selected gender to UserDefaults
                                                UserDefaults.standard.set(selectedGender, forKey: "selectedGender")
                                                print("Saved gender: \(selectedGender)")
                        
                        
                        navigateNext = true
                    }
                }) {
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(
                            selectedGender == nil
                            ? Color(hex: "#C2C2C2") // gray when nothing selected
                            : Color(hex: "#49A24E") // green when selected
                        )
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                }
                .disabled(selectedGender == nil)

                // ✅ Hidden NavigationLink (manual navigation)
                NavigationLink(
                    destination: GenderFour().navigationBarHidden(true),
                    isActive: $navigateNext
                ) {
                    EmptyView()
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }

    // MARK: - Gender Option View
    @ViewBuilder
    private func genderOptionView(label: String, imageName: String?, scaleFactor: CGFloat, geometry: GeometryProxy) -> some View {
        Button(action: {
            selectedGender = label
        }) {
            HStack(spacing: 60 * scaleFactor) {
                if let imageName = imageName {
                    Image(imageName)
                }
                Text(label)
                    .font(.custom("Inter-SemiBold", size: 20 * scaleFactor))
                    .foregroundColor(.black)
                    .padding(.trailing, 50 * scaleFactor)
            }
            .frame(maxWidth: .infinity, minHeight: 79 * scaleFactor)
            .background(
                selectedGender == label
                ? Color(hex: "#DDFFDF") // green if selected
                : Color.white
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10 * scaleFactor)
                    .stroke(Color(.systemGray), lineWidth: 1 * scaleFactor)
            )
            .cornerRadius(10 * scaleFactor)
            .padding(.horizontal, geometry.size.width * 0.08)
            .padding(.top, label == "Male" ? 50 * scaleFactor : 30 * scaleFactor)
        }
    }
}

#Preview {
    GenderThree()
}
