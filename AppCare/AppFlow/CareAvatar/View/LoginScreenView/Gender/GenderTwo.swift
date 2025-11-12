
//  GenderTwo.swift
//  AppCare

//  Created by Harish Kumar Singh on 30/10/25.



//import SwiftUI
//
//struct GenderTwo: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var name: String = ""
//    @State private var navigateNext: Bool = false // ✅ Manual navigation control
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//            ? geometry.size.width / 600.0
//            : 1.0
//            
//            VStack(spacing: 0) {
//                ScrollView(showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
//                        
//                        // 🔙 Back Button + Progress
//                        HStack(spacing: 5 * scaleFactor) {
//                            Button(action: { dismiss() }) {
//                                Image("Back")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
//                                    .padding(.leading, 25 * scaleFactor)
//                                    .padding(.top, 58 * scaleFactor)
//                            }
//                            
//                            VStack(alignment: .leading, spacing: 8 * scaleFactor) {
//                                Text("Step 2/10")
//                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
//                                    .foregroundColor(Color(hex: "#878484"))
//                                    .padding(.leading, 15 * scaleFactor)
//                                    .padding(.top, 45 * scaleFactor)
//                                
//                                ZStack(alignment: .leading) {
//                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
//                                        .fill(Color(hex: "#C2C2C2"))
//                                        .frame(width: geometry.size.width * 0.7, height: 8 * scaleFactor)
//                                    
//                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
//                                        .fill(Color(hex: "#49A24E"))
//                                        .frame(width: geometry.size.width * 0.7 * 0.2, height: 8 * scaleFactor)
//                                }
//                                .padding(.leading, 15 * scaleFactor)
//                            }
//                        }
//                        
//                        // 📝 Title
//                        Text("Write your email ID")
//                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.top, 65 * scaleFactor)
//                            .frame(maxWidth: .infinity)
//                            .multilineTextAlignment(.center)
//                        
//                      
//                        // 🧾 Text Field
//                        TextField("Enter your name", text: $name)
//                            .font(.custom("Inter-Regular", size: 17 * scaleFactor))
//                            .foregroundColor(Color(hex: "#878484"))
//                            .frame(maxWidth: .infinity, minHeight: 60 * scaleFactor, alignment: .leading)
//                            .padding(.leading, 15 * scaleFactor)
//                            .background(Color.white)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10 * scaleFactor)
//                                    .stroke(Color(.systemGray), lineWidth: 1 * scaleFactor)
//                            )
//                            .padding(.horizontal, geometry.size.width * 0.08)
//                            .padding(.top, 20 * scaleFactor)
//
//                        Spacer(minLength: 80 * scaleFactor)
//                    }
//                    .frame(maxWidth: .infinity)
//                }
//                
//                //keyboard hide
//                .onTapGesture { hideKeyboard() }
//                
//                // ✅ Bottom Continue Button
//                Button(action: {
//                    if !name.trimmingCharacters(in: .whitespaces).isEmpty {
//                        
//                        UserDefaults.standard.set(name, forKey: "userEmail")
//                        print("✅ Email saved: \(name)")
//                                               
//                        navigateNext = true
//                    }
//                }) {
//                    Text("Continue")
//                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
//                        .background(
//                            name.trimmingCharacters(in: .whitespaces).isEmpty
//                            ? Color(hex: "#C2C2C2") // gray
//                            : Color.mainGreen // red when text entered
//                        )
//                        .cornerRadius(10)
//                        .padding(.horizontal, scaleFactor * 20)
//                        .padding(.bottom, scaleFactor * 10)
//                }
//                .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
//
//                // ✅ Hidden NavigationLink (manual trigger)
//                NavigationLink(
//                    destination: GenderThree().navigationBarHidden(true),
//                    isActive: $navigateNext
//                ) { EmptyView() }
//            }
//            .ignoresSafeArea(.keyboard, edges: .bottom)
//        }
//    }
//}
//
//#Preview {
//    GenderTwo()
//}

import SwiftUI

struct GenderTwo: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var navigateNext: Bool = false
    @State private var isValidEmail: Bool = true // ✅ for showing validation state
    
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
                                Text("Step 2/10")
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
                                        .frame(width: geometry.size.width * 0.7 * 0.2, height: 8 * scaleFactor)
                                }
                                .padding(.leading, 15 * scaleFactor)
                            }
                        }
                        
                        // 📝 Title
                        Text("Write your email ID")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        // 🧾 Email TextField
                        TextField("Enter your email", text: $name)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .font(.custom("Inter-Regular", size: 17 * scaleFactor))
                            .foregroundColor(Color(hex: "#878484"))
                            .frame(maxWidth: .infinity, minHeight: 60 * scaleFactor, alignment: .leading)
                            .padding(.leading, 15 * scaleFactor)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10 * scaleFactor)
                                    .stroke(isValidEmail || name.isEmpty ? Color(.systemGray) : .red, lineWidth: 1 * scaleFactor)
                            )
                            .padding(.horizontal, geometry.size.width * 0.08)
                            .padding(.top, 20 * scaleFactor)
                            .onChange(of: name) { newValue in
                                isValidEmail = isValidEmailAddress(newValue)
                            }

                        // ❗️Error Message
                        if !isValidEmail && !name.isEmpty {
                            Text("Please enter a valid email address.")
                                .foregroundColor(.red)
                                .font(.custom("Inter-Regular", size: 14 * scaleFactor))
                                .padding(.leading, geometry.size.width * 0.1)
                                .padding(.top, 5 * scaleFactor)
                        }

                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                .onTapGesture { hideKeyboard() } // hide keyboard
                
                // ✅ Continue Button
                Button(action: {
                    if isValidEmail && !name.trimmingCharacters(in: .whitespaces).isEmpty {
                        UserDefaults.standard.set(name, forKey: "userEmail")
                        print("✅ Email saved: \(name)")
                        navigateNext = true
                    } else {
                        isValidEmail = false
                    }
                }) {
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(
                            (isValidEmail && !name.trimmingCharacters(in: .whitespaces).isEmpty)
                            ? Color.mainGreen
                            : Color(hex: "#C2C2C2")
                        )
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                }
                .disabled(!isValidEmail || name.trimmingCharacters(in: .whitespaces).isEmpty)

                // ✅ Navigation Link
                NavigationLink(
                    destination: GenderThree().navigationBarHidden(true),
                    isActive: $navigateNext
                ) { EmptyView() }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    
    // ✅ Email Validation Function
    private func isValidEmailAddress(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    GenderTwo()
}
