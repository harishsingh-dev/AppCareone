//
//  LoginOneViewModel.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 01/11/25.
//

import Foundation


import Combine

final class LoginOneViewModel: ObservableObject {
    @Published var contacts: OTPResponse?
    private var cancellables = Set<AnyCancellable>()
    @Published var errorMessage: String?

    func sendOTP() {

       
        
            APIManager.shared.postMethod(url: APIEndpoint.sendotp, body: OTPparm)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        print("❌ POST Error:", error.localizedDescription)
                    case .finished:
                        break
                    }
                } receiveValue: { (result: OTPResponse) in
                    print("✅ OTP Response:", result)
                    self.contacts = result
                }
                .store(in: &cancellables)
        }
}


