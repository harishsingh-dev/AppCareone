
//  loadingStageViewModel.swift
//  AppCare

//  Created by Harish Kumar Singh on 07/11/25.


import Foundation
import SwiftUI
import Combine

final class LoadingStageViewModel: ObservableObject {
    
    @Published var errorMessage: String?
    @Published var userRegister: User?
    @Published var sucess: String?

    private var cancellables = Set<AnyCancellable>()
    @AppStorage("UserPhoneNumber") var UserPhoneNumber: String?
    @AppStorage("userName") var userName: String?
    @AppStorage("userEmail") var userEmail: String?
    @AppStorage("selectedGender") var userGender: String?
    @AppStorage("UserAge") var userAge: String?
    @AppStorage("Tall") var userTall: String?
    @AppStorage("tallIN") var userIN: String?
    @AppStorage("tallFit") var userfit: String?
    @AppStorage("userWeight") var userweight: String?
    @AppStorage("userBloodPressure") var userBloodPresser: String?
    @AppStorage("sugarmg") var usersugar: String?
    @AppStorage("userProfilePhoto") var userPhoto: String?

    @State private var emergencyContacts: [String] =
        UserDefaults.standard.array(forKey: "EmergencyContactNumbers") as? [String] ?? []

    func registerApiCall(image:UIImage?) {
        DispatchQueue.main.async {
           // self.activityIndicator.startAnimating()
        }
        
        guard let token = UserDefaultsManager.shared.getUserToken() else {
            print("No token found =====")
            DispatchQueue.main.async {
               // self.activityIndicator.stopAnimating()
            }
            return
        }
        
        let parameters: [String: Any] = [
                "name": userName ?? "",
                "email": userEmail ?? "",
                "phoneNumber": UserPhoneNumber ?? "",
                "dob": userAge ?? "",
                "gender":userGender ?? "",
                "emergencycontact": emergencyContacts,
                "userIN": userIN ?? "",
                "weight": userweight ?? "",
                "sugar": usersugar ?? "",
                "BP": userBloodPresser ?? "" ,      // ✅ Note: remove space from key name!
                "userfit": userfit ?? ""
            ]

        print("parameters3323===: \(parameters)")
        
        APIManager.shared.uploadMultipartData(endpoint: "register", parameters: parameters, image: image, token: token) { result in
            DispatchQueue.main.async {
               // self.activityIndicator.stopAnimating()
            }
            
            switch result {
            case .success(let responseObject):
                
                
                if let responseObject = responseObject as? [String: Any] {
                    print("Response JSON: \(responseObject)")
                    
                    let msg = responseObject["msg"] as? String
                    let success = responseObject["success"] as? Int
                    
                    print("msg==: \(String(describing: msg))")
                    print("success==: \(String(describing: success))")
                    
                    if let user = responseObject["user"] as? [String: Any] {
                        DispatchQueue.main.async {
                            let userId = user["_id"] as? String ?? ""
                            let avatar = user["avatar"] as? String ?? ""
                            let dob = user["dob"] as? String ?? ""
                            let email = user["email"] as? String ?? ""
                            let name = user["name"] as? String ?? ""
                            let phoneNumber = user["phoneNumber"] as? String ?? ""
                            let isFirstTime = user["isFirstTime"] as? Int ?? 0
                            let gender = user["gender"] as? String ?? ""
                            
                            // Optional arrays
                            let hobbies = user["hobbies"] as? [String] ?? []
                            let subscriptions = user["subscriptions"] as? [String] ?? []
                            
                            // Print extracted values
                            print("User ID: \(userId)")
                            print("Avatar: \(avatar)")
                            print("DOB: \(dob)")
                            print("Email: \(email)")
                            print("Name: \(name)")
                            print("Phone Number: \(phoneNumber)")
                            print("Is First Time: \(isFirstTime)")
                            print("Hobbies: \(hobbies)")
                            print("Subscriptions: \(subscriptions)")
                            print("gender: \(gender)")
                            
                            // Save user data to UserDefaults
                            UserDefaults.standard.set(userId, forKey: "userId")
                            UserDefaults.standard.set(avatar, forKey: "avatar")
                            UserDefaults.standard.set(dob, forKey: "dob")
                            UserDefaults.standard.set(email, forKey: "email")
                            UserDefaults.standard.set(name, forKey: "name")
                            UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
                            UserDefaults.standard.set(subscriptions, forKey: "subscriptions")
                            UserDefaults.standard.set(hobbies, forKey: "hobbies")
                            UserDefaults.standard.set(gender, forKey: "gender")
                            
                            // Navigate to the next view controller on the main thread
                            
                        }
                    } else {
                        print("Invalid response or success flag is not 1")
                        
                    }
                                     
                    
                    
                } else {
                    DispatchQueue.main.async {
                       // self.activityIndicator.stopAnimating()
                    }
                    print("Invalid response or success flag is not 1")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                   // self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}






//parameter

struct RegistrationParameters: Encodable {
    let name: String
    let email: String
    let phoneNumber: String
    let dob: String
    let gender: String
    let emergencycontact: String
    let userIN: String
    let weight: String
    let sugar: String
    let BP : String
    let userTall : String
    let userfit : String
}


//model
import Foundation

// MARK: - RegistrationResponse
struct RegistrationResponse: Codable {
    let success: Bool?
    let msg: String?
    let user: User?
}

// MARK: - User
struct User: Codable {
    let id: String?
    let phoneNumber: String?
    let isFirstTime: Bool?
    let hobbies: [String]?
    let donateItemList: [String]?
    let donatePageFirstTime: Bool?
    let communityPageFirstTime: Bool?
    let latitude: String?
    let longitude: String?
    let sendMessages: [String]?
    let receivedMessages: [String]?
    let communityMessages: [String]?
    let timeZone: String?
    let status: Bool?
    let isBP: Bool?
    let isSugar: Bool?
    let userType: String?
    let subscriptions: [String]?
    let recentItems: [String]?
    let createdAt: String?
    let updatedAt: String?
    let v: Int?
    let avatar: String?
    let dob: String?
    let email: String?
    let emergencyContact: String?
    let gender: String?
    let height: Double?
    let name: String?
    let sugar: String?
    let weight: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case phoneNumber
        case isFirstTime
        case hobbies
        case donateItemList = "DonateItemList"
        case donatePageFirstTime
        case communityPageFirstTime
        case latitude
        case longitude
        case sendMessages
        case receivedMessages
        case communityMessages
        case timeZone
        case status
        case isBP
        case isSugar
        case userType
        case subscriptions
        case recentItems
        case createdAt
        case updatedAt
        case v = "__v"
        case avatar
        case dob
        case email
        case emergencyContact = "emergencycontact"
        case gender
        case height
        case name
        case sugar
        case weight
    }
}
