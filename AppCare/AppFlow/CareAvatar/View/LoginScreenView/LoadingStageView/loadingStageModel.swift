//
//  loadingStageModel.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 07/11/25.




////parameter
//
//struct RegistrationParameters: Encodable {
//    let name: String
//    let email: String
//    let phoneNumber: String
//    let dob: String
//    let gender: String
//    let emergencycontact: String
//    let userIN: String
//    let weight: String
//    let sugar: String
//    let BP : String
//    let userTall : String
//    let userfit : String
//}
//
//
////model
//struct RegistrationResponse: Codable {
//    let success: Bool?
//    let msg: String?
//    let user: User?
//}
//
//struct User: Codable, Identifiable {
//    let id: String?
//    let phoneNumber: String?
//    let isFirstTime: Bool?
//    let hobbies: [String]?
//    let donateItemList: [String]?
//    let donatePageFirstTime: Bool?
//    let communityPageFirstTime: Bool?
//    let latitude: String?
//    let longitude: String?
//    let sendMessages: [String]?
//    let receivedMessages: [String]?
//    let communityMessages: [String]?
//    let timeZone: String?
//    let status: Bool?
//    let isBP: Bool?
//    let isSugar: Bool?
//    let userType: String?
//    let subscriptions: [String]?
//    let recentItems: [String]?
//    let createdAt: String?
//    let updatedAt: String?
//    let avatar: String?
//    let dob: String?
//    let email: String?
//    let emergencycontact: String?
//    let gender: String?
//    let height: Int?
//    let name: String?
//    let weight: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case phoneNumber, isFirstTime, hobbies
//        case donateItemList = "DonateItemList"
//        case donatePageFirstTime, communityPageFirstTime, latitude, longitude
//        case sendMessages, receivedMessages, communityMessages, timeZone, status
//        case isBP, isSugar, userType, subscriptions, recentItems, createdAt
//        case updatedAt, avatar, dob, email, emergencycontact, gender, height, name, weight
//    }
//}
