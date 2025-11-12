//
//  Endpoints.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 01/11/25.
//




import Foundation

enum APIEndpoint {
    static let baseURL = "http://172.104.206.4:5000/api/"

    static var sendotp: URL {
        return URL(string: "\(baseURL)send-otp")!
    }
    
    static var OtpVerification: URL {
        return URL(string: "\(baseURL)verify-otp")!
    }

    static var getCategory: URL {
        return URL(string: "\(baseURL)getCategory")!
    }
    
    static var postHobbies: URL {
        return URL(string: "\(baseURL)userHobbies")!
    }
    
    static var allDetail: URL {
        return URL(string: "\(baseURL)register")!
    }
    

    
    // Add more:
    // static var users = URL(string: "\(baseURL)/users")!
}
