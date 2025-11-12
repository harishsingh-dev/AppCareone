
//  OtpVerificationOne.swift
//  AppCare

//  Created by Harish Kumar Singh on 30/10/25.





//import SwiftUI
//
//struct OtpVerificationOne: View {
//    // MARK: - Environment
//    @Environment(\.dismiss) var dismiss
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    // MARK: - Parameters
//    var getotp: String
//    var getPhoneNumber: String
//    @State private var otp: [String] = Array(repeating: "", count: 6) // For a 6-digit OTP
//    @State private var fullOTP: String = "" // To store the combined OTP
//
//    // MARK: - State
//    @State private var otpFields = Array(repeating: "", count: 6)
//    @FocusState private var focusedField: Int?
//    
//    // 🟩 ADDED: state for navigation on success
//        @State private var isVerified = false
//        
//        // 🟩 ADDED: computed property to check OTP completeness
//        private var isOtpComplete: Bool {
//            !otp.contains("") // true only if all OTP boxes are filled
//        }
//
//    // MARK: - Body
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//                ? geometry.size.width / 600.0
//                : 1.0
//
//            VStack(spacing: 0) {
//                ScrollView(showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
//
//                        // MARK: - Back Button
//                        Button(action: { dismiss() }) {
//                            Image("Back")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
//                                .padding(.leading, 25 * scaleFactor)
//                                .padding(.top, 58 * scaleFactor)
//                        }
//
//                        // MARK: - Title
//                        Text("Verify your phone number")
//                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 30 * scaleFactor)
//
//                        // MARK: - Dynamic Phone Number
//                        Text("Enter the OTP sent to \(getPhoneNumber)")
//                            .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 10 * scaleFactor)
//
//                        HStack(alignment: .center, spacing: 10 * scaleFactor) {
//                            ForEach(0..<otp.count, id: \.self) { index in
//                                TextField("", text: $otp[index])
//                                    .font(.system(size: 12 * scaleFactor))
//
//                                    .frame(width: 46.48 * scaleFactor, height: 46.48 * scaleFactor)
//                                    .multilineTextAlignment(.center)
//                                    .keyboardType(.numberPad)
//                                    .focused($focusedField, equals: index)
//                                    .textFieldStyle(.roundedBorder)
//                                    .onChange(of: otp[index]) { newValue in
//                                        handleInput(for: index, newValue: newValue)
//                                    }
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading) // Align the HStack to the leading edge
//                        .padding(.leading,20) //
//                        .onAppear {
//                            focusedField = 0 // Focus the first field on appear
//                        }
//                        
//                        
//
//                        // MARK: - Timer
//                        Text("Resend code in 00:30")
//                            .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                            .foregroundColor(Color(hex: "#878484"))
//                            .padding(.leading, 27 * scaleFactor)
//                            .padding(.top, 10 * scaleFactor)
//
//                        // MARK: - Debug Info
//                        Text("Received OTP: \(getotp)")
//                            .font(.custom("Inter-Regular", size: 13 * scaleFactor))
//                            .foregroundColor(.gray)
//                            .padding(.top, 20 * scaleFactor)
//                            .frame(maxWidth: .infinity, alignment: .center)
//
//                        // MARK: - Terms & Privacy
//                        VStack(alignment: .leading, spacing: 4 * scaleFactor) {
//                            HStack(spacing: 7 * scaleFactor) {
//                                Image("Rectangle 10")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 13 * scaleFactor, height: 13 * scaleFactor)
//
//                                Text("I have read and agree to the Terms & Conditions and")
//                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                    .foregroundColor(.black)
//                            }
//
//                            Text("Privacy Policy")
//                                .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                .foregroundColor(.black)
//                                .padding(.leading, 20 * scaleFactor)
//                        }
//                        .padding(.leading, 27 * scaleFactor)
//                        .padding(.top, 370 * scaleFactor)
//
//                        // MARK: - Verify Button
//                        
//                        Button(action: {
//                                                    if otp.joined() == getotp {
//                                                        isVerified = true
//                                                    } else {
//                                                        alertMessage = "Invalid OTP. Please try again."
//                                                        showAlert = true
//                                                    }
//                        }) {
//                            
//                            Text("Verify")
//                                .font(.custom("Inter-Regular", size: scaleFactor * 18))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
//                                .background(Color.disabledButton)
//                            //.background(Color(red: 0x49/255, green: 0xA2/255, blue: 0x4E/255))
//                                
//                                .cornerRadius(10)
//                        }
//                            .disabled(!isOtpComplete)
//                            .padding(.top, scaleFactor * 10)
//                            .padding(.bottom, scaleFactor * 10)
//                            .padding(.horizontal, scaleFactor * 20)
//                        
//                        // 🟩 ADDED: NavigationLink triggered programmatically
//                                               NavigationLink(destination: Preference().navigationBarHidden(true),
//                                                              isActive: $isVerified) {
//                                                   EmptyView()
//                                               }
//                                           
//                        }
//                       
//                    
//                }
//
//                Spacer(minLength: 0)
//            }
//            .onTapGesture { hideKeyboard() }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Alert"),
//                      message: Text(alertMessage),
//                      dismissButton: .default(Text("OK")))
//            }
//            .onAppear {
//                // focus first box after slight delay to avoid layout race
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                    focusedField = 0
//                }
//                print("=== OTP VERIFICATION ===")
//                print("Received OTP: \(getotp)")
//                print("Phone Number: \(getPhoneNumber)")
//                print("========================")
//            }
//        }
//        .id(getotp + getPhoneNumber)
//    }
//    private func handleInput(for index: Int, newValue: String) {
//        // Ensure the field only takes one character
//        otp[index] = String(newValue.prefix(1))
//        
//        if !newValue.isEmpty { // If a character is entered
//            if index < otp.count - 1 {
//                focusedField = index + 1 // Move focus to the next field
//            }
//        } else { // If the field is cleared (backspace)
//            if index > 0 {
//                focusedField = index - 1 // Move focus to the previous field
//            }
//        }
//    }
//}
//
//
//
//
//#Preview {
//    OtpVerificationOne( getotp: "", getPhoneNumber: "")
//}


//import SwiftUI
//
//struct OtpVerificationOne: View {
//    // MARK: - Environment
//    @Environment(\.dismiss) var dismiss
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    // MARK: - Parameters
//    var getotp: String
//    var getPhoneNumber: String
//    @State private var otp: [String] = Array(repeating: "", count: 6) // For a 6-digit OTP
//    @State private var fullOTP: String = "" // To store the combined OTP
//
//    // MARK: - State
//    @State private var otpFields = Array(repeating: "", count: 6)
//    @FocusState private var focusedField: Int?
//    
//    // 🟩 ADDED: state for navigation on success
//    @State private var isVerified = false
//    
//    // 🟥 ADDED: state for wrong OTP
//    @State private var isWrongOtp = false
//    
//    // 🕒 ADDED: Timer states
//        @State private var timeRemaining = 30
//        @State private var timer: Timer?
//        @State private var isTimerFinished = false
//        
//    // 🟩 ADDED: computed property to check OTP completeness
//    private var isOtpComplete: Bool {
//        !otp.contains("") // true only if all OTP boxes are filled
//    }
//
//    // MARK: - Body
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//                ? geometry.size.width / 600.0
//                : 1.0
//
//            VStack(spacing: 0) {
//                ScrollView(showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
//
//                        // MARK: - Back Button
//                        Button(action: { dismiss() }) {
//                            Image("Back")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
//                                .padding(.leading, 25 * scaleFactor)
//                                .padding(.top, 58 * scaleFactor)
//                        }
//
//                        // MARK: - Title
//                        Text("Verify your phone number")
//                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 30 * scaleFactor)
//
//                        // MARK: - Dynamic Phone Number
//                        Text("Enter the OTP sent to \(getPhoneNumber)")
//                            .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 10 * scaleFactor)
//
//                        HStack(alignment: .center, spacing: 10 * scaleFactor) {
//                            ForEach(0..<otp.count, id: \.self) { index in
//                                TextField("", text: $otp[index])
//                                    .font(.system(size: 12 * scaleFactor))
//                                    .frame(width: 46.48 * scaleFactor, height: 46.48 * scaleFactor)
//                                    .multilineTextAlignment(.center)
//                                    .keyboardType(.numberPad)
//                                    .focused($focusedField, equals: index)
//                                    // 🟥 CONDITIONAL BORDER COLOR
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 5)
//                                            .stroke(isWrongOtp ? Color.red : Color.gray, lineWidth: 1)
//                                    )
//                                    .onChange(of: otp[index]) { newValue in
//                                        handleInput(for: index, newValue: newValue)
//                                    }
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading,20)
//                        .onAppear {
//                            focusedField = 0 // Focus the first field on appear
//                        }
//                        
//                        // 🟥 ADDED: Error message for wrong OTP
////
//                        
//                        // MARK: - Timer
////                        Text("Resend code in 00:30")
////                            .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
////                            .foregroundColor(Color(hex: "#878484"))
////                            .padding(.leading, 27 * scaleFactor)
////                            .padding(.top, 10 * scaleFactor)
//                        
//                        // MARK: - Timer / Resend Code
//                                                HStack {
//                                                    if isTimerFinished {
//                                                        // 🕒 Show Resend Code button when timer finishes
//                                                        Button(action: {
//                                                            resendCode()
//                                                        }) {
//                                                            Text("Resend code")
//                                                                .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                                                .foregroundColor(.blue)
//                                                        }
//                                                    } else {
//                                                        // 🕒 Show timer when counting down
//                                                        Text("Resend code in \(formatTime(timeRemaining))")
//                                                            .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                                            .foregroundColor(Color(hex: "#878484"))
//                                                    }
//                                                }
//                                                .padding(.leading, 27 * scaleFactor)
//                                                .padding(.top, 10 * scaleFactor)
//
//
//                        // MARK: - Debug Info
//                        Text("Received OTP: \(getotp)")
//                            .font(.custom("Inter-Regular", size: 13 * scaleFactor))
//                            .foregroundColor(.gray)
//                            .padding(.top, 20 * scaleFactor)
//                            .frame(maxWidth: .infinity, alignment: .center)
//
//                        // MARK: - Terms & Privacy
//                        VStack(alignment: .leading, spacing: 4 * scaleFactor) {
//                            HStack(spacing: 7 * scaleFactor) {
//                                Image("Rectangle 10")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 13 * scaleFactor, height: 13 * scaleFactor)
//
//                                Text("I have read and agree to the Terms & Conditions and")
//                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                    .foregroundColor(.black)
//                            }
//
//                            Text("Privacy Policy")
//                                .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                .foregroundColor(.black)
//                                .padding(.leading, 20 * scaleFactor)
//                        }
//                        .padding(.leading, 27 * scaleFactor)
//                        .padding(.top, 370 * scaleFactor)
//
//                        // MARK: - Verify Button
//                        Button(action: {
//                            if otp.joined() == getotp {
//                                isVerified = true
//                                isWrongOtp = false // 🟩 Reset wrong OTP state
//                            } else {
//                                isWrongOtp = true // 🟥 Set wrong OTP state
//                                alertMessage = "Invalid OTP. Please try again."
//                                showAlert = true
//                            }
//                        }) {
//                            Text("Verify")
//                                .font(.custom("Inter-Regular", size: scaleFactor * 18))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
//                                // 🟢 CONDITIONAL BACKGROUND COLOR
//                                .background(isOtpComplete ? Color.green : Color.disabledButton)
//                                .cornerRadius(10)
//                        }
//                        .disabled(!isOtpComplete)
//                        .padding(.top, scaleFactor * 10)
//                        .padding(.bottom, scaleFactor * 10)
//                        .padding(.horizontal, scaleFactor * 20)
//                        
//                        // 🟩 ADDED: NavigationLink triggered programmatically
//                        NavigationLink(destination: Preference().navigationBarHidden(true),
//                                      isActive: $isVerified) {
//                            EmptyView()
//                        }
//                    }
//                }
//
//                Spacer(minLength: 0)
//            }
//            .onTapGesture { hideKeyboard() }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Alert"),
//                      message: Text(alertMessage),
//                      dismissButton: .default(Text("OK")))
//            }
//            .onAppear {
//                // focus first box after slight delay to avoid layout race
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                    focusedField = 0
//                }
//                print("=== OTP VERIFICATION ===")
//                print("Received OTP: \(getotp)")
//                print("Phone Number: \(getPhoneNumber)")
//                print("========================")
//            }
//        }
//        .id(getotp + getPhoneNumber)
//    }
//    
//    private func handleInput(for index: Int, newValue: String) {
//        // 🟥 Reset wrong OTP state when user starts typing again
//        if isWrongOtp {
//            isWrongOtp = false
//        }
//        
//        // Ensure the field only takes one character
//        otp[index] = String(newValue.prefix(1))
//        
//        if !newValue.isEmpty { // If a character is entered
//            if index < otp.count - 1 {
//                focusedField = index + 1 // Move focus to the next field
//            }
//        } else { // If the field is cleared (backspace)
//            if index > 0 {
//                focusedField = index - 1 // Move focus to the previous field
//            }
//        }
//    }
//}
//
//#Preview {
//    OtpVerificationOne(getotp: "123456", getPhoneNumber: "1234567890123456")
//}

//import SwiftUI
//
//struct OtpVerificationOne: View {
//    // MARK: - Environment
//    @Environment(\.dismiss) var dismiss
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    // MARK: - Parameters
//    var getotp: String
//    var getPhoneNumber: String
//    @State private var otp: [String] = Array(repeating: "", count: 6) // For a 6-digit OTP
//    @State private var fullOTP: String = "" // To store the combined OTP
//
//    // MARK: - State
//    @State private var otpFields = Array(repeating: "", count: 6)
//    @FocusState private var focusedField: Int?
//    
//    // 🟩 ADDED: state for navigation on success
//    @State private var isVerified = false
//    
//    // 🟥 ADDED: state for wrong OTP
//    @State private var isWrongOtp = false
//    
//    // 🕒 ADDED: Timer states
//    @State private var timeRemaining = 30
//    @State private var timer: Timer?
//    @State private var isTimerFinished = false
//        
//    // 🟩 ADDED: computed property to check OTP completeness
//    private var isOtpComplete: Bool {
//        !otp.contains("") // true only if all OTP boxes are filled
//    }
//
//    // MARK: - Body
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//                ? geometry.size.width / 600.0
//                : 1.0
//
//            VStack(spacing: 0) {
//                ScrollView(showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
//
//                        // MARK: - Back Button
//                        Button(action: { dismiss() }) {
//                            Image("Back")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
//                                .padding(.leading, 25 * scaleFactor)
//                                .padding(.top, 58 * scaleFactor)
//                        }
//
//                        // MARK: - Title
//                        Text("Verify your phone number")
//                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 30 * scaleFactor)
//
//                        // MARK: - Dynamic Phone Number
//                        Text("Enter the OTP sent to \(getPhoneNumber)")
//                            .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 8 * scaleFactor)
//
//                        HStack(alignment: .center, spacing: 10 * scaleFactor) {
//                            ForEach(0..<otp.count, id: \.self) { index in
//                                TextField("", text: $otp[index])
//                                    .font(.system(size: 12 * scaleFactor))
//                                    .frame(width: 46.48 * scaleFactor, height: 46.48 * scaleFactor)
//                                    .multilineTextAlignment(.center)
//                                    .keyboardType(.numberPad)
//                                    .focused($focusedField, equals: index)
//                                    // 🟥 CONDITIONAL BORDER COLOR
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 5)
//                                            .stroke(isWrongOtp ? Color.red : Color.gray, lineWidth: 1)
//                                    )
//                                    .onChange(of: otp[index]) { newValue in
//                                        handleInput(for: index, newValue: newValue)
//                                    }
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading,20)
//                        .padding(.top, 10 * scaleFactor)
//                        .onAppear {
//                            focusedField = 0 // Focus the first field on appear
//                        }
//                        
//                        // 🟥 ADDED: Error message for wrong OTP
////                        if isWrongOtp {
////                            Text("Invalid OTP. Please try again.")
////                                .font(.custom("Inter-Regular", size: 12 * scaleFactor))
////                                .foregroundColor(.red)
////                                .padding(.leading, 27 * scaleFactor)
////                                .padding(.top, 5 * scaleFactor)
////                        }
//                        
//                        // MARK: - Timer / Resend Code
//                        HStack {
//                            if isTimerFinished {
//                                // 🕒 Show Resend Code button when timer finishes
//                                Button(action: {
//                                    resendCode()
//                                }) {
//                                    Text("Resend code")
//                                        .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                        .foregroundColor(Color.black)
//                                }
//                            } else {
//                                // 🕒 Show timer when counting down
//                                Text("Resend code in \(formatTime(timeRemaining))")
//                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                    .foregroundColor(Color(hex: "#878484"))
//                            }
//                        }
//                        .padding(.leading, 27 * scaleFactor)
//                        .padding(.top, 10 * scaleFactor)
//
//                        // MARK: - Debug Info
//                        Text("Received OTP: \(getotp)")
//                            .font(.custom("Inter-Regular", size: 13 * scaleFactor))
//                            .foregroundColor(.gray)
//                            .padding(.top, 20 * scaleFactor)
//                            .frame(maxWidth: .infinity, alignment: .center)
//
//                        // MARK: - Terms & Privacy
//                        VStack(alignment: .leading, spacing: 4 * scaleFactor) {
//                            HStack(spacing: 7 * scaleFactor) {
//                                Image("Rectangle 10")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 13 * scaleFactor, height: 13 * scaleFactor)
//
//                                Text("I have read and agree to the Terms & Conditions and")
//                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                    .foregroundColor(.black)
//                            }
//
//                            Text("Privacy Policy")
//                                .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                .foregroundColor(.black)
//                                .padding(.leading, 20 * scaleFactor)
//                        }
//                        .padding(.leading, 27 * scaleFactor)
//                        .padding(.top, 370 * scaleFactor)
//
//                        // MARK: - Verify Button
//                        Button(action: {
//                            if otp.joined() == getotp {
//                                isVerified = true
//                                isWrongOtp = false // 🟩 Reset wrong OTP state
//                                stopTimer() // 🕒 Stop timer on success
//                            } else {
//                                isWrongOtp = true // 🟥 Set wrong OTP state
//                                alertMessage = "Invalid OTP. Please try again."
//                                showAlert = true
//                            }
//                        }) {
//                            Text("Verify")
//                                .font(.custom("Inter-Regular", size: scaleFactor * 18))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
//                                // 🟢 CONDITIONAL BACKGROUND COLOR
//                                .background(isOtpComplete ? Color.green : Color.disabledButton)
//                                .cornerRadius(10)
//                        }
//                        .disabled(!isOtpComplete)
//                        .padding(.top, scaleFactor * 10)
//                        .padding(.bottom, scaleFactor * 10)
//                        .padding(.horizontal, scaleFactor * 20)
//                        
//                        // 🟩 ADDED: NavigationLink triggered programmatically
//                        NavigationLink(destination: Preference().navigationBarHidden(true),
//                                      isActive: $isVerified) {
//                            EmptyView()
//                        }
//                    }
//                }
//
//                Spacer(minLength: 0)
//            }
//            .onTapGesture { hideKeyboard() }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Alert"),
//                      message: Text(alertMessage),
//                      dismissButton: .default(Text("OK")))
//            }
//            .onAppear {
//                // focus first box after slight delay to avoid layout race
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                    focusedField = 0
//                }
//                // 🕒 Start timer when view appears
//                startTimer()
//                
//                print("=== OTP VERIFICATION ===")
//                print("Received OTP: \(getotp)")
//                print("Phone Number: \(getPhoneNumber)")
//                print("========================")
//            }
//            .onDisappear {
//                // 🕒 Clean up timer when view disappears
//                stopTimer()
//            }
//        }
//        .id(getotp + getPhoneNumber)
//    }
//    
//    // 🕒 Timer Functions
//    private func startTimer() {
//        timeRemaining = 30
//        isTimerFinished = false
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//            if timeRemaining > 0 {
//                timeRemaining -= 1
//            } else {
//                isTimerFinished = true
//                stopTimer()
//            }
//        }
//    }
//    
//    private func stopTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
//    
//    private func resendCode() {
//        // 🕒 Reset and restart timer
//        startTimer()
//        
//        // 🕒 Reset OTP fields
//        otp = Array(repeating: "", count: 6)
//        isWrongOtp = false
//        
//        // 🕒 Focus first field again
//        focusedField = 0
//        
//        // 🕒 Here you can add your API call to resend OTP
//        print("Resend OTP requested for: \(getPhoneNumber)")
//        
//        // Optional: Show alert for resend
//        alertMessage = "New OTP has been sent to your phone."
//        showAlert = true
//    }
//    
//    private func formatTime(_ seconds: Int) -> String {
//        let minutes = seconds / 60
//        let seconds = seconds % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//    
//    private func handleInput(for index: Int, newValue: String) {
//        // 🟥 Reset wrong OTP state when user starts typing again
//        if isWrongOtp {
//            isWrongOtp = false
//        }
//        
//        // Ensure the field only takes one character
//        otp[index] = String(newValue.prefix(1))
//        
//        if !newValue.isEmpty { // If a character is entered
//            if index < otp.count - 1 {
//                focusedField = index + 1 // Move focus to the next field
//            }
//        } else { // If the field is cleared (backspace)
//            if index > 0 {
//                focusedField = index - 1 // Move focus to the previous field
//            }
//        }
//    }
//}
//
//#Preview {
//    OtpVerificationOne(getotp: "123456", getPhoneNumber: "123456781")
//}


//import SwiftUI
//
//struct OtpVerificationOne: View {
//    // MARK: - Environment
//    @Environment(\.dismiss) var dismiss
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    @State private var isChecked = false
//    // MARK: - Parameters
//    var getotp: String
//    var getPhoneNumber: String
//    @State private var otp: [String] = Array(repeating: "", count: 6) // For a 6-digit OTP
//    @State private var fullOTP: String = "" // To store the combined OTP
//
//    // MARK: - State
//    @State private var otpFields = Array(repeating: "", count: 6)
//    @FocusState private var focusedField: Int?
//    
//    // 🟩 ADDED: state for navigation on success
//    @State private var isVerified = false
//    
//    // 🟥 ADDED: state for wrong OTP
//    @State private var isWrongOtp = false
//    
//    // 🕒 ADDED: Timer states
//    @State private var timeRemaining = 30
//    @State private var timer: Timer?
//    @State private var isTimerFinished = false
//    
//    // ✅ ADDED: Terms & Conditions check state
//    @State private var isTermsAccepted = false
//        
//    // 🟩 ADDED: computed property to check OTP completeness
//    private var isOtpComplete: Bool {
//        !otp.contains("") // true only if all OTP boxes are filled
//    }
//    
//    // ✅ ADDED: computed property to check if all conditions are met
//    private var isAllConditionsMet: Bool {
//        isOtpComplete && isTermsAccepted
//    }
//
//    // MARK: - Body
//    var body: some View {
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//                ? geometry.size.width / 600.0
//                : 1.0
//
//            VStack(spacing: 0) {
//                ScrollView(showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
//
//                        // MARK: - Back Button
//                        Button(action: { dismiss() }) {
//                            Image("Back")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
//                                .padding(.leading, 25 * scaleFactor)
//                                .padding(.top, 58 * scaleFactor)
//                        }
//
//                        // MARK: - Title
//                        Text("Verify your phone number")
//                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 30 * scaleFactor)
//
//                        // MARK: - Dynamic Phone Number
//                        Text("Enter the OTP sent to \(getPhoneNumber)")
//                            .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.leading, 25 * scaleFactor)
//                            .padding(.top, 10 * scaleFactor)
//
//                        HStack(alignment: .center, spacing: 10 * scaleFactor) {
//                            ForEach(0..<otp.count, id: \.self) { index in
//                                TextField("", text: $otp[index])
//                                    .font(.system(size: 12 * scaleFactor))
//                                    .frame(width: 46.48 * scaleFactor, height: 46.48 * scaleFactor)
//                                    .multilineTextAlignment(.center)
//                                    .keyboardType(.numberPad)
//                                    .focused($focusedField, equals: index)
//                                    // 🟥 CONDITIONAL BORDER COLOR
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 5)
//                                            .stroke(isWrongOtp ? Color.red : Color.gray, lineWidth: 1)
//                                    )
//                                    .onChange(of: otp[index]) { newValue in
//                                        handleInput(for: index, newValue: newValue)
//                                    }
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading,20)
//                        .onAppear {
//                            focusedField = 0 // Focus the first field on appear
//                        }
//                        
//                        // 🟥 ADDED: Error message for wrong OTP
//                        if isWrongOtp {
//                            Text("Invalid OTP. Please try again.")
//                                .font(.custom("Inter-Regular", size: 12 * scaleFactor))
//                                .foregroundColor(.red)
//                                .padding(.leading, 27 * scaleFactor)
//                                .padding(.top, 5 * scaleFactor)
//                        }
//                        
//                        // MARK: - Timer / Resend Code
//                        HStack {
//                            if isTimerFinished {
//                                // 🕒 Show Resend Code button when timer finishes
//                                Button(action: {
//                                    resendCode()
//                                }) {
//                                    Text("Resend code")
//                                        .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                        .foregroundColor(.black)
//                                }
//                            } else {
//                                // 🕒 Show timer when counting down
//                                Text("Resend code in \(formatTime(timeRemaining))")
//                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                    .foregroundColor(Color(hex: "#878484"))
//                            }
//                        }
//                        .padding(.leading, 27 * scaleFactor)
//                        .padding(.top, 10 * scaleFactor)
//
//                        // MARK: - Debug Info
//                        Text("Received OTP: \(getotp)")
//                            .font(.custom("Inter-Regular", size: 13 * scaleFactor))
//                            .foregroundColor(.gray)
//                            .padding(.top, 20 * scaleFactor)
//                            .frame(maxWidth: .infinity, alignment: .center)
//
//                        // MARK: - Terms & Privacy (Updated with tap gesture)
//                        VStack(alignment: .leading, spacing: 4 * scaleFactor) {
//                            HStack(spacing: 7 * scaleFactor) {
//                                // ✅ Tappable Checkbox
//                                Button(action: {
//                                    isTermsAccepted.toggle()
//                                }) {
//
//                                    SquareCheckBox(isChecked: $isChecked)
//                                    
//                                }
//
//                                Text("I have read and agree to the Terms & Conditions and")
//                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                    .foregroundColor(.black)
//                            }
//
//                            HStack(spacing: 0) {
//                                Text("Privacy Policy")
//                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
//                                    .foregroundColor(.black)
//                            }
//                            .padding(.leading, 22 * scaleFactor)
//                            .padding(.top, -2 * scaleFactor)
//                        }
//                        .padding(.leading, 27 * scaleFactor)
//                        .padding(.top, 350 * scaleFactor)
//
//                        // MARK: - Verify Button
//                        Button(action: {
//                            // ✅ FIRST CHECK: Terms & Conditions
//                            if !isTermsAccepted {
//                                //alertMessage = "Please accept Terms & Conditions to continue."
//                                showAlert = true
//                                return
//                            }
//                            
//                            // ✅ SECOND CHECK: OTP Validation
//                            if otp.joined() == getotp {
//                                isVerified = true
//                                isWrongOtp = false // 🟩 Reset wrong OTP state
//                                stopTimer() // 🕒 Stop timer on success
//                            } else {
//                                isWrongOtp = true // 🟥 Set wrong OTP state
//                                alertMessage = "Invalid OTP. Please try again."
//                                showAlert = true
//                            }
//                        }) {
//                            Text("Verify")
//                                .font(.custom("Inter-Regular", size: scaleFactor * 18))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
//                                // 🟢 CONDITIONAL BACKGROUND COLOR
//                                .background(isAllConditionsMet ? Color.green : Color.disabledButton)
//                                .cornerRadius(10)
//                        }
//                        .disabled(!isAllConditionsMet) // ✅ Disable if conditions not met
//                        .padding(.top, scaleFactor * 10)
//                        .padding(.bottom, scaleFactor * 10)
//                        .padding(.horizontal, scaleFactor * 20)
//                        
//                        // 🟩 ADDED: NavigationLink triggered programmatically
//                        NavigationLink(destination: Preference().navigationBarHidden(true),
//                                      isActive: $isVerified) {
//                            EmptyView()
//                        }
//                    }
//                }
//
//                Spacer(minLength: 0)
//            }
//            .onTapGesture { hideKeyboard() }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Alert"),
//                      message: Text(alertMessage),
//                      dismissButton: .default(Text("OK")))
//            }
//            .onAppear {
//                // focus first box after slight delay to avoid layout race
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                    focusedField = 0
//                }
//                // 🕒 Start timer when view appears
//                startTimer()
//                
//                print("=== OTP VERIFICATION ===")
//                print("Received OTP: \(getotp)")
//                print("Phone Number: \(getPhoneNumber)")
//                print("========================")
//            }
//            .onDisappear {
//                // 🕒 Clean up timer when view disappears
//                stopTimer()
//            }
//        }
//        .id(getotp + getPhoneNumber)
//    }
//    
//    // 🕒 Timer Functions
//    private func startTimer() {
//        timeRemaining = 30
//        isTimerFinished = false
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//            if timeRemaining > 0 {
//                timeRemaining -= 1
//            } else {
//                isTimerFinished = true
//                stopTimer()
//            }
//        }
//    }
//    
//    private func stopTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
//    
//    private func resendCode() {
//        // 🕒 Reset and restart timer
//        startTimer()
//        
//        // 🕒 Reset OTP fields
//        otp = Array(repeating: "", count: 6)
//        isWrongOtp = false
//        
//        // 🕒 Focus first field again
//        focusedField = 0
//        
//        // 🕒 Here you can add your API call to resend OTP
//        print("Resend OTP requested for: \(getPhoneNumber)")
//        
//        // Optional: Show alert for resend
//        alertMessage = "New OTP has been sent to your phone."
//        showAlert = true
//    }
//    
//    private func formatTime(_ seconds: Int) -> String {
//        let minutes = seconds / 60
//        let seconds = seconds % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//    
//    private func handleInput(for index: Int, newValue: String) {
//        // 🟥 Reset wrong OTP state when user starts typing again
//        if isWrongOtp {
//            isWrongOtp = false
//        }
//        
//        // Ensure the field only takes one character
//        otp[index] = String(newValue.prefix(1))
//        
//        if !newValue.isEmpty { // If a character is entered
//            if index < otp.count - 1 {
//                focusedField = index + 1 // Move focus to the next field
//            }
//        } else { // If the field is cleared (backspace)
//            if index > 0 {
//                focusedField = index - 1 // Move focus to the previous field
//            }
//        }
//    }
//}
//
//#Preview {
//    OtpVerificationOne(getotp: "123456", getPhoneNumber: "1234345667")
//}


import SwiftUI

struct OtpVerificationOne: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @State private var alertMessage = ""
    @StateObject private var viewModel = OtpVerificationViewModel()
    
    
    // MARK: - Parameters
    var getotp: String
    var getPhoneNumber: String
    @State private var otp: [String] = Array(repeating: "", count: 6)
    @State private var fullOTP: String = ""

    // MARK: - State
    @State private var otpFields = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
    // Navigation states
    @State private var isVerified = false
    @State private var isWrongOtp = false
    
    // Timer states
    @State private var timeRemaining = 30
    @State private var timer: Timer?
    @State private var isTimerFinished = false
    
    // ✅ Terms & Conditions check state
    @State private var isTermsAccepted = false
        
    // Computed properties
    private var isOtpComplete: Bool {
        !otp.contains("")
    }
    
    private var isAllConditionsMet: Bool {
        isOtpComplete && isTermsAccepted
    }

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0

            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {

                        // MARK: - Back Button
                        Button(action: { dismiss() }) {
                            Image("Back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
                                .padding(.leading, 25 * scaleFactor)
                                .padding(.top, 50 * scaleFactor)
                        }

                        // MARK: - Title
                        Text("Verify your phone number")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.leading, 25 * scaleFactor)
                            .padding(.top, 30 * scaleFactor)

                        // MARK: - Dynamic Phone Number
                        Text("Enter the OTP sent to \(getPhoneNumber)")
                            .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.leading, 25 * scaleFactor)
                            .padding(.top, 8 * scaleFactor)

                        HStack(alignment: .center, spacing: 10 * scaleFactor) {
                            ForEach(0..<otp.count, id: \.self) { index in
                                TextField("", text: $otp[index])
                                    .font(.system(size: 12 * scaleFactor))
                                    .frame(width: 46.48 * scaleFactor, height: 46.48 * scaleFactor)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .focused($focusedField, equals: index)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(isWrongOtp ? Color.red : Color.gray, lineWidth: 1)
                                    )
                                    .onChange(of: otp[index]) { newValue in
                                        handleInput(for: index, newValue: newValue)
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,20 * scaleFactor)
                        .padding(.top, 10 * scaleFactor)
                        .onAppear {
                            focusedField = 0
                        }
                        
                        
                        
                        // MARK: - Timer / Resend Code
                        HStack {
                            if isTimerFinished {
                                Button(action: {
                                    resendCode()
                                }) {
                                    Text("Resend code")
                                        .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
                                        .foregroundColor(.black)
                                }
                            } else {
                                Text("Resend code in \(formatTime(timeRemaining))")
                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                            }
                        }
                        .padding(.leading, 27 * scaleFactor)
                        .padding(.top, 10 * scaleFactor)

                        // MARK: - Debug Info
                        Text("Received OTP: \(getotp)")
                            .font(.custom("Inter-Regular", size: 13 * scaleFactor))
                            .foregroundColor(.gray)
                            .padding(.top, 20 * scaleFactor)
                            .frame(maxWidth: .infinity, alignment: .center)

                        // MARK: - Terms & Privacy
                        VStack(alignment: .leading, spacing: 4 * scaleFactor) {
                            HStack(spacing: 7 * scaleFactor) {
                                // ✅ Tappable Checkbox - UPDATED
                                Button(action: {
                                    isTermsAccepted.toggle()
                                }) {
                                    SquareCheckBox(isChecked: $isTermsAccepted) // ✅ Direct binding to isTermsAccepted
                                }

                                Text("I have read and agree to the Terms & Conditions and")
                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
                                    .foregroundColor(.black)
                            }

                            HStack(spacing: 0) {
                                Text("Privacy Policy")
                                    .font(.custom("Inter-SemiBold", size: 12 * scaleFactor))
                                    .foregroundColor(.black)
                                
                                
                            }
                            .padding(.leading, 22 * scaleFactor)
                            .padding(.top, -2 * scaleFactor)
                        }
                        .padding(.leading, 27 * scaleFactor)
                        .padding(.top, 350 * scaleFactor)

                        Button(action: {
                            // ✅ FIRST CHECK: Terms & Conditions
                            if !isTermsAccepted {
                                alertMessage = "Please accept Terms & Conditions to continue."
                                showAlert = true
                                return
                            }

                            // ✅ SECOND: Check OTP field is filled
                            let enteredOTP = otp.joined()
                            if enteredOTP.count < 6 {
                                alertMessage = "Please enter the complete OTP."
                                showAlert = true
                                return
                                
                            }

                            // ✅ Prepare parameters
                            OtpVerificationparm["phoneNumber"] = getPhoneNumber
                            OtpVerificationparm["otp"] = enteredOTP

                            // ✅ Call API
                            viewModel.sendOTP()

                            // ✅ Observe response
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                if let response = viewModel.otpverify {
                                    if let success = response.success {
                                        if success {
                                            // ✅ Verification success
                                            isVerified = true
                                            isWrongOtp = false
                                            stopTimer()
                                        } else {
                                            // ❌ Wrong OTP
                                            isWrongOtp = true
                                            alertMessage = "Invalid OTP. Please try again."
                                            showAlert = true
                                        }
                                    } else
                                    {
                                        print("Success is nil")

                                    }
                                } else if let error = viewModel.errorMessage {
                                    alertMessage = "Server error: \(error)"
                                    showAlert = true
                                }
                            }

                        }) {
                            Text("Verify")
                                .font(.custom("Inter-Regular", size: scaleFactor * 18))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                                .background(isAllConditionsMet ? Color.mainGreen : Color.disabledButton)
                                .cornerRadius(10)
                        }
                        .disabled(!isAllConditionsMet)
                        .padding(.top, scaleFactor * 10)
                        .padding(.bottom, scaleFactor * 10)
                        .padding(.horizontal, scaleFactor * 20)
                        
                        // NavigationLink
                        NavigationLink(destination: Preference().navigationBarHidden(true),
                                      isActive: $isVerified) {
                            EmptyView()
                        }
                        
                       
                        
                    }
                }

                Spacer(minLength: 0)
            }
            .onTapGesture { hideKeyboard() }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    focusedField = 0
                }
                startTimer()
                
                print("=== OTP VERIFICATION ===")
                print("Received OTP: \(getotp)")
                print("Phone Number: \(getPhoneNumber)")
                print("========================")
            }
            .onDisappear {
                stopTimer()
            }
        }
        .id(getotp + getPhoneNumber)
    }
    
    // MARK: - Timer Functions
    private func startTimer() {
        timeRemaining = 30
        isTimerFinished = false
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isTimerFinished = true
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func resendCode() {
        startTimer()
        otp = Array(repeating: "", count: 6)
        isWrongOtp = false
        focusedField = 0
        
        print("Resend OTP requested for: \(getPhoneNumber)")
        alertMessage = "New OTP has been sent to your phone."
        showAlert = true
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func handleInput(for index: Int, newValue: String) {
        if isWrongOtp {
            isWrongOtp = false
        }
        
        otp[index] = String(newValue.prefix(1))
        
        if !newValue.isEmpty {
            if index < otp.count - 1 {
                focusedField = index + 1
            }
        } else {
            if index > 0 {
                focusedField = index - 1
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    OtpVerificationOne(getotp: "", getPhoneNumber: "")
}


