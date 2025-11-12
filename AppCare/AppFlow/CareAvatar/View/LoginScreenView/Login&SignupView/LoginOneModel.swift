//
//  LoginOneModel.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 01/11/25.
//

import Foundation


import Foundation

var OTPparm = [
    "phoneNumber": ""
    
    
]





struct OTPResponse: Codable,Identifiable {
    var id = UUID() // ✅ Local only — not from JSON
        
        let success: Bool?
        let msg: String?
        let otp: String?
        let phoneNumber: String?

        // ✅ Ignore 'id' when decoding from API
        enum CodingKeys: String, CodingKey {
            case success, msg, otp, phoneNumber
        }
}


