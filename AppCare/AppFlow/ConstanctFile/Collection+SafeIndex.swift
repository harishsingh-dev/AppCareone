//
//  Collection+SafeIndex.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 07/11/25.
//

import Foundation

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
