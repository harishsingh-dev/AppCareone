//
//  OtpVerificationModel.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 04/11/25.
//

import Foundation

var OtpVerificationparm = [
    "phoneNumber": "",
    
    "otp": ""
]





import Foundation

struct LoginResponse: Codable{
    let success: Bool?
    let token: String?
    let isFirstTime: Bool?
    let id: String?
}
