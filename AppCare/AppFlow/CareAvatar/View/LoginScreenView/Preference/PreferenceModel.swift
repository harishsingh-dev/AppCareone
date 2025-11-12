//
//  PreferenceModel.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 04/11/25.
//

import Foundation


struct CategoriesResponse: Decodable {
    let status: Bool?
    let categories: [CategoryItem]?
    let notificationCount: Int?
}

struct CategoryItem: Decodable, Identifiable {
    var id = UUID() // ✅ Local only — not from JSON

    let _id: String?            // Maps from "_id"
    let name: String?
    let image: String?
    let userCount: Int?
    
    // Custom CodingKeys for "_id"
    enum CodingKeys: String, CodingKey {
        case _id
        case name
        case image
        case userCount
    }
}



// MARK: - HobbiesRequest (for POST body)
struct HobbiesRequest: Encodable {
    let userHobbie: [String]
}





//post method
import Foundation

// MARK: - Root
struct HobbiesResponse: Codable {
    let message: String?
    let hobbies: UserHobbies?
}

// MARK: - UserHobbies
struct UserHobbies: Codable {
   
    let id: String?
    let phoneNumber: String?
    let isFirstTime: Bool?
    let hobbies: [Hobby]?
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
    }
}

struct Hobby: Codable, Identifiable {
    var idd = UUID() // unique local ID for SwiftUI
    let id: String?
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case image
    }
}

