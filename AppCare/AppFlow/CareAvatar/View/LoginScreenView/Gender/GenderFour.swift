//
//  GenderFour.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 31/10/25.
//






import SwiftUI

struct GenderFour: View {
    @Environment(\.dismiss) var dismiss
    @State private var Years: String = ""
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
                                Text("Step 4/10")
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
                                        .frame(width: geometry.size.width * 0.7 * 0.4, height: 8 * scaleFactor)
                                }
                                .padding(.leading, 15 * scaleFactor)
                            }
                        }
                        
                        // 📝 Title
                        Text("How old are you?")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        // 🧾 Text Field (with validation 0–200)
                        TextField("0", text: $Years)
                            .font(.custom("Inter-SemiBold", size: 90 * scaleFactor))
                            .foregroundColor(
                                Years.trimmingCharacters(in: .whitespaces).isEmpty
                                ? Color(hex: "#878484")
                                : Color(hex: "#49A24E")
                            )
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 45 * scaleFactor)
                            .onChange(of: Years) { newValue in
                                // Allow only digits
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                
                                // Convert to Int and limit range 0–200
                                if let number = Int(filtered) {
                                    if number > 200 {
                                        Years = "200"
                                    } else {
                                        Years = String(number)
                                    }
                                } else {
                                    Years = filtered
                                }
                            }
                             .keyboardType(.numberPad)
                        Text("Years")
                            .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                            .foregroundColor(Color(hex: "#000000"))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, -15 * scaleFactor)
                        
                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }
                .onTapGesture { hideKeyboard() }
               
                // ✅ Continue Button
                Button(action: {
                    if let age = Int(Years),
                       age >= 0, age <= 200 {
                        UserDefaultsManager.shared.setUserAge(Years)
                        print("✅ Age saved: \(Years)")
                        navigateNext = true
                    } else {
                        print("⚠️ Invalid age: must be between 0–200")
                    }
                }) {
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(
                            Color(hex: (Int(Years) ?? -1) >= 0 && (Int(Years) ?? -1) <= 200 ? "#49A24E" : "#C2C2C2")
                        )
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                }
                
                // Hidden Navigation Link
                NavigationLink(destination: GenderTallVC().navigationBarHidden(true),
                               isActive: $navigateNext) {
                    EmptyView()
                }
                .hidden()
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

#Preview {
    GenderFour()
}
