//
//  Color+Extensions.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 30/10/25.
//

import Foundation

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}





// how to use
//Color(hex: "#878484")
//Color(hex: "#FF5733")


import SwiftUI

extension Color {
    // MARK: - Brand Colors
    static let mainGreen = Color(red: 73/255, green: 162/255, blue: 78/255)       // #49A24E
    static let mainRed = Color(red: 243/255, green: 13/255, blue: 13/255)         // #F30D0D
    static let headingColor = Color(red: 0/255, green: 0/255, blue: 0/255)        // #000000
    static let disabledButton = Color(red: 194/255, green: 194/255, blue: 194/255) // #C2C2C2
    static let grayText = Color(red: 135/255, green: 132/255, blue: 132/255)      // #878484
    static let headingButtonTab = Color(red: 57/255, green: 82/255, blue: 58/255) // #39523A
    static let lightGreen = Color(red: 221/255, green: 255/255, blue: 223/255)    // #DDFFDF
}




// Usage:
//Color.customGreen

  //  .foregroundColor(.headingColor)
   // .foregroundColor(Color.headingColor)


