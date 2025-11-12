//
//  ConstantClass.swift
//  AppCare
//
//  Created by Rohit Shishodia on 28/10/25.
//

import Foundation
import UIKit
import SwiftUI


struct Constant {
    static let appName = "AppCare"
    static let Track_yoga = "Track yoga, diet, fitness, and health all in one"
    static let Track_yogaa = "place."
    static let Welcome = "Welcome To Care Avatar"
    static let Personalized = "Personalized healthcare for you and your loved"
    static let Personalizedd = "ones from daily fitness to emergency support."
}

class ConstantClass {
    static let shared = ConstantClass()
    
    private init() {} // ✅ Prevents creating multiple instances
    
    func isIpad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    /// 🔹 Use custom Inter font with weight (e.g. "Inter-Regular", "Inter-SemiBold")
      func interFont(weight: String =  "Inter-Regular" , size: CGFloat) -> Font {
          let adjustedSize = isIpad() ? size * 1.5 : size
          let fontName = "Inter-\(weight)"   // e.g. "Inter-SemiBold"
          return .custom(fontName, size: adjustedSize)
      }
    
}
extension UIScreen {
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    static var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
}
