//
//  OtpVerificationViewModel.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 04/11/25.
//

import Foundation

import Combine

final class OtpVerificationViewModel: ObservableObject {
    @Published var otpverify: LoginResponse?    //changeable
    private var cancellables = Set<AnyCancellable>()
    @Published var errorMessage: String?

    func sendOTP() {
            APIManager.shared.postMethod(url: APIEndpoint.OtpVerification, body: OtpVerificationparm)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        print("❌ POST Error:", error.localizedDescription)
                    case .finished:
                        break
                    }
                } receiveValue: { (result: LoginResponse) in   //changeable
                    print("✅ OTP Response:", result)
                    self.otpverify = result     // changeable
                    
                    UserDefaultsManager.shared.setUserToken(result.token ?? "")

                }
                .store(in: &cancellables)
        }
}


