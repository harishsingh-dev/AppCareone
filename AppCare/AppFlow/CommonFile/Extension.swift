//
//  Extension.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 01/11/25.
//

import Foundation
import SwiftUI


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
