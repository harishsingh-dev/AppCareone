//
//  GenderBloodPressureVC.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 31/10/25.
//



import SwiftUI

struct GenderBloodPressureVC: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedGender: String = ""
    @State private var navigateNext: Bool = false
    
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
                                Text("Step 7/10")
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
                                                width: geo.size.width * (isLandscape ? 0.85 : 0.7) * 0.6,
                                                height: 8 * scaleFactor
                                            )
                                    }
                                    .padding(.leading, 15 * scaleFactor)
                                }
                            }

                            NavigationLink(destination: GenderSugarLabelVC().navigationBarHidden(true)) {
                                Text("Skip")
                                    .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                                    .foregroundColor(Color(hex: "#49A24E"))
                                    .padding(.top, 74 * scaleFactor)
                                    .padding(.trailing, 15 * scaleFactor)
                            }
                        }
                        
                        // 📝 Title
                        Text("What is your Blood Pressure ?")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        // 🧾 Text Field
                        TextField("0", text: $selectedGender)
                            .font(.custom("Inter-SemiBold", size: 90 * scaleFactor))
                            .foregroundColor(selectedGender.isEmpty ? Color(hex: "#878484") : Color(hex: "#49A24E"))
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 45 * scaleFactor)
                        
                        Text("mmHg")
                            .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.top, -15 * scaleFactor)
                        
                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }
                .onTapGesture { hideKeyboard() }
                
                // ✅ Fixed bottom button
                Button(action: {
                    if !selectedGender.isEmpty {
                        // 🟢 Save to UserDefaults
                        UserDefaults.standard.set(selectedGender, forKey: "userBloodPressure")
                        
                        // 🖨 Print value to console
                        print("Saved Blood Pressure Value: \(selectedGender)")
                        
                        navigateNext = true
                    }
                }) {
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(
                            selectedGender.isEmpty
                            ? Color(hex: "#C2C2C2")
                            : Color(hex: "#49A24E")
                        )
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                }
                .background(
                    NavigationLink(
                        destination: GenderSugarLabelVC().navigationBarHidden(true),
                        isActive: $navigateNext,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

#Preview {
    GenderBloodPressureVC()
}
