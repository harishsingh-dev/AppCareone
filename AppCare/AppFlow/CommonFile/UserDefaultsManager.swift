//
//  UserDefaultsManager.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 04/11/25.
//

import Foundation


final class UserDefaultsManager {
    // MARK: - Shared Instance (Singleton)
    static let shared = UserDefaultsManager()
    private init() { }

    // MARK: - Keys
    private enum Keys {
       
        static let userToken  = "userToken"
        static let UserAge  = "UserAge"

    }

    // MARK: - Setters
    

    func setUserToken(_ token: String?) {
        UserDefaults.standard.set(token, forKey: Keys.userToken)
    }

    func getUserToken() -> String? {
        return UserDefaults.standard.string(forKey: Keys.userToken)
    }
    
    
    func setUserAge(_ age: String?) {
        UserDefaults.standard.set(age, forKey: Keys.UserAge)
    }
    
    func getUserAge() -> String? {
        return UserDefaults.standard.string(forKey: Keys.UserAge)
    }
    // MARK: - Clear
    func clearAll() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
