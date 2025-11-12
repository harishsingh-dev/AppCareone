//
//  GenderSugarLabelVC.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 31/10/25.
//

import SwiftUI

struct GenderSugarLabelVC: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedUnit = "mg/dl"
    let units = ["mg/dl", "mmo/L"]
    @State private var sugarmg: String = ""
    @State private var sugarmmo: String = ""
    @State private var navigateNext = false
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
                                Text("Step 8/10")
                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                                    .padding(.leading, 15 * scaleFactor)
                                    .padding(.top, 60 * scaleFactor)
                                
                                GeometryReader { geo in
                                    let isLandscape = geo.size.width > geo.size.height // 🔸 Detect orientation
                                    
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                            .fill(Color(hex: "#C2C2C2"))
                                            .frame(
                                                width: geo.size.width * (isLandscape ? 0.85 : 0.7), // 🔸 Wider in landscape
                                                height: 8 * scaleFactor
                                            )
                                        
                                        RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                            .fill(Color(hex: "#49A24E"))
                                            .frame(
                                                width: geo.size.width * (isLandscape ? 0.85 : 0.7) * 0.8, // 🔸 Match outer width
                                                height: 8 * scaleFactor
                                            )
                                    }
                                    .padding(.leading, 15 * scaleFactor)
                                    //.padding(.trailing, 40 * scaleFactor)
                                }
                            }

                            NavigationLink(destination: GenderProfilePhotoVC().navigationBarHidden(true)) {
                                Text("Skip")
                                    .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                                    .foregroundColor(Color(hex: "#49A24E"))
                                    .padding(.top, 74 * scaleFactor)
                                    .padding(.trailing, 15 * scaleFactor)
                            }
                        }
                        
                        // 📝 Title
                        Text("What is your Sugar Level ?")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    
                        
                        // 📏 Height Display (changes with selection)
                        if selectedUnit == "mg/dl" {
                            TextField("0",text: $sugarmg)
                                .font(.custom("Inter-SemiBold", size: 90 * scaleFactor))
                                .foregroundColor(
                                    sugarmg.trimmingCharacters(in: .whitespaces).isEmpty
                                    ? Color(hex: "#878484")
                                    : Color(hex: "#49A24E")
                                )
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, 45 * scaleFactor)
                                .onChange(of: sugarmg) { newValue in
                                    sugarmg = newValue.filter { "0123456789".contains($0) }
                                }
                                .keyboardType(.numberPad)
                        } else {
                            TextField("0",text: $sugarmmo)
                                .font(.custom("Inter-SemiBold", size: 90 * scaleFactor))
                                .foregroundColor(
                                    sugarmmo.trimmingCharacters(in: .whitespaces).isEmpty
                                    ? Color(hex: "#878484")
                                    : Color(hex: "#49A24E")
                                )
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, 45 * scaleFactor)
                                .onChange(of: sugarmmo) { newValue in
                                    sugarmmo = newValue.filter { "0123456789".contains($0) }
                                }
                                .keyboardType(.numberPad)
                        }
                        
                        // 🧭 Unit Toggle
                        HStack(spacing: 0) {
                            ForEach(units, id: \.self) { unit in
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedUnit = unit
                                    }
                                }) {
                                    Text(unit)
                                        .font(.custom("Inter-Medium", size: 16 * scaleFactor))
                                        .foregroundColor(selectedUnit == unit ? .black : .gray)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 10 * scaleFactor)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8 * scaleFactor)
                                                .fill(selectedUnit == unit ? Color.white : Color.clear)
                                        )
                                }
                            }
                        }
                        .padding(4 * scaleFactor)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10 * scaleFactor))
                        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                        .frame(width: 180 * scaleFactor)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 5 * scaleFactor)

                        
                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }
                .onTapGesture { hideKeyboard() }
                
                
                Button(action: {
                    let enteredValue = selectedUnit == "mg/dl" ? sugarmg : sugarmmo
                    guard !enteredValue.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                    
                    // Save to UserDefaults
                    UserDefaults.standard.setValue(enteredValue, forKey: "sugarmg")
                    UserDefaults.standard.setValue(selectedUnit, forKey: "sugarmmo")
                    
                    // ✅ Print the saved values
                                      
                    print("✅ Saved sugarlabel value: \(enteredValue) \(selectedUnit)")
                                      
                   
                    
                    // Navigate manually
                    navigateNext = true
                }) {
                    
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(
                            isWeightValid ? Color(hex: "#49A24E") : Color(hex: "#C2C2C2")
                        )
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                }
                .disabled(!isWeightValid)
                
                // 🔁 Navigation trigger
                NavigationLink(
                    destination: GenderProfilePhotoVC().navigationBarHidden(true),
                    isActive: $navigateNext
                ) {
                    EmptyView()
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    // MARK: - Helper
    private var isWeightValid: Bool {
        if selectedUnit == "mg/dl" {
            return !sugarmg.trimmingCharacters(in: .whitespaces).isEmpty
        } else {
            return !sugarmmo.trimmingCharacters(in: .whitespaces).isEmpty
        }
    }

}

#Preview {
    GenderSugarLabelVC()
}
