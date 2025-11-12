
//  LoginOneView.swift
//  AppCare

//  Created by Harish Kumar Singh on 27/10/25.
//

import SwiftUI
import CountryPickerView

struct LoginOneView: View {
    @State private var selectedCountry: Country? = nil
    @State private var mobileNumber = ""
    @State private var countryCode = "+91"

    @StateObject private var viewModel = LoginOneViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isNavigating = false
    @State private var receivedOTP = ""   // store OTP here
    @State private var receivedPhone = ""

    // Computed property to check if phone number is valid
    private var isPhoneNumberValid: Bool {
        validatePhoneNumber(mobileNumber)
    }

    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0

            ScrollView {
                VStack(spacing: 24 * scaleFactor) {

                    // MARK: - Image Section
                    Image("Public health-rafiki 1")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 400 * scaleFactor)
                        .padding(.horizontal)
                        .padding(.top, 40 * scaleFactor)

                    // MARK: - "Get Started" Section
                    HStack(spacing: 8 * scaleFactor) {
                        Rectangle()
                            .frame(height: 1 * scaleFactor)
                            .foregroundColor(Color(red: 135/255, green: 132/255, blue: 132/255))

                        Text("Get Started")
                            .font(.custom("Inter-Regular", size: 14 * scaleFactor))
                            .foregroundColor(.black)

                        Rectangle()
                            .frame(height: 1 * scaleFactor)
                            .foregroundColor(Color(red: 135/255, green: 132/255, blue: 132/255))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)

                    // MARK: - Country Picker + Mobile Input
                    HStack(spacing: 8 * scaleFactor) {

                        // Flag + Country Code + Dropdown Icon
                        HStack(spacing: 4 * scaleFactor) {
                            CountryPickerViewRepresentable(selectedCountry: $selectedCountry)
                                .frame(height: 25 * scaleFactor)

                            Image(systemName: "chevron.down")
                                .font(.system(size: 10 * scaleFactor))
                                .foregroundColor(.gray)
                        }
                        .frame(width: 120 * scaleFactor)
                        .onChange(of: selectedCountry) { newValue in
                            if let country = newValue {
                                countryCode = country.code
                                print("Selected country code: \(country.code)")
                                print("Selected phone code: \(country.phoneCode)")
                                print("Selected country name: \(country.name)")
                            }
                        }

                        // Divider
                        Divider()
                            .frame(height: 20 * scaleFactor)
                            .background(Color.gray.opacity(0.5))
                            .padding(.horizontal, 4 * scaleFactor)

                        // Mobile Number TextField with 10 digit limit
                        TextField("Enter mobile number", text: $mobileNumber)
                            .keyboardType(.numberPad)
                            .font(.system(size: 16 * scaleFactor))
                            .foregroundColor(.black)
                            .onChange(of: mobileNumber) { newValue in
                                // Only allow digits and limit to 10 characters
                                let filtered = newValue.filter { $0.isNumber }
                                if filtered.count <= 10 {
                                    mobileNumber = filtered
                                } else {
                                    // If more than 10 digits, truncate to first 10
                                    mobileNumber = String(filtered.prefix(10))
                                }
                            }
                    }
                    .padding(.horizontal, 16 * scaleFactor)
                    .padding(.vertical, 8 * scaleFactor)
                    .background(Color.white)
                    .cornerRadius(8 * scaleFactor)
                    .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 1)

                    // MARK: - Continue Button
                    Button(action: {
                        if validatePhoneNumber(mobileNumber) {
                                let fullPhoneNumber = countryCode + mobileNumber
                                
                                // ✅ 1. Save phone number to UserDefaults
                                UserDefaults.standard.set(fullPhoneNumber, forKey: "UserPhoneNumber")
                                
                                // ✅ 2. Print it in console for debugging
                                print("📱 Saved user phone number: \(UserDefaults.standard.string(forKey: "UserPhoneNumber") ?? "nil")")
                                
                                // ✅ 3. Proceed with OTP process
                                OTPparm["phoneNumber"] = fullPhoneNumber
                                viewModel.sendOTP()
                            } else {
                                alertMessage = "Please enter a valid 10-digit mobile number."
                                showAlert = true
                            }
                    }) {
                        Text("Continue")
                            .font(.custom("Inter-Regular", size: scaleFactor * 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                            .background(isPhoneNumberValid ?
                                       Color(red: 0x49/255, green: 0xA2/255, blue: 0x4E/255) : // Green when valid
                                        Color.disabledButton) // Gray when invalid
                            .cornerRadius(10)
                    }
                    .disabled(!isPhoneNumberValid) // Disable button when invalid
                    .padding(.top, scaleFactor * 15)
                    .padding(.horizontal, scaleFactor * 20)

                    // MARK: - Terms and Privacy
                    VStack(spacing: 2) {
                        Text("By continuing you agree to our Terms and Condition &")
                            .font(.custom("Inter-Regular", size: scaleFactor * 12))
                            .foregroundColor(.black)

                        Text("Privacy Policy")
                            .font(.custom("Inter-Regular", size: scaleFactor * 12))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, scaleFactor * 15)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.ignoresSafeArea())
                .onTapGesture { hideKeyboard() }

                // MARK: - NavigationLink to OTP Screen
                NavigationLink(
                    destination: OtpVerificationOne(
                        getotp: receivedOTP,
                        getPhoneNumber: receivedPhone
                    ).navigationBarHidden(true),
                    isActive: $isNavigating
                ) { EmptyView() }
            }
            
            // MARK: - ViewModel Observers
            .onReceive(viewModel.$contacts) { response in
                if let response = response, response.success! {
                    receivedOTP = response.otp ?? ""
                    receivedPhone = response.phoneNumber ?? ""
                    print(receivedOTP)
                    print(receivedPhone)
                    isNavigating = true
                }
            }
            .onReceive(viewModel.$errorMessage) { error in
                if let error = error {
                    alertMessage = error
                    showAlert = true
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
    }

    // MARK: - Helper: Phone Number Validation
    private func validatePhoneNumber(_ phone: String) -> Bool {
        // Check if exactly 10 digits and all are numbers
        let regex = "^[0-9]{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: phone)
    }
}

#Preview {
    LoginOneView()
}
