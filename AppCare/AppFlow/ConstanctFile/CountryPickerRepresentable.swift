
//  CountryPickerRepresentable.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 27/10/25.


//import SwiftUI
//import CountryPickerView
//
//// MARK: - UIKit Wrapper for CountryPickerView
//struct CountryPickerRepresentable: UIViewRepresentable {
//    @Binding var selectedCountry: Country
//
//    func makeUIView(context: Context) -> CountryPickerView {
//        let picker = CountryPickerView()
//        picker.delegate = context.coordinator
//        picker.dataSource = context.coordinator
//        picker.showPhoneCodeInView = true
//        picker.showCountryCodeInView = false
//        return picker
//    }
//
//    func updateUIView(_ uiView: CountryPickerView, context: Context) {}
//
//    func makeCoordinator() -> Coordinator { Coordinator(self) }
//
//    class Coordinator: NSObject, CountryPickerViewDelegate, CountryPickerViewDataSource {
//        var parent: CountryPickerRepresentable
//
//        init(_ parent: CountryPickerRepresentable) {
//            self.parent = parent
//        }
//
//        func countryPickerView(_ cpv: CountryPickerView, didSelectCountry country: Country) {
//            parent.selectedCountry = country
//        }
//    }
//}
//
//
//


import SwiftUI
import CountryPickerView

struct CountryPickerViewRepresentable: UIViewRepresentable {
    @Binding var selectedCountry: Country?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> CountryPickerView {
        let countryPicker = CountryPickerView()
        countryPicker.delegate = context.coordinator
        countryPicker.dataSource = context.coordinator

        // ✅ Show only flag and phone code
        countryPicker.showCountryCodeInView = false
        countryPicker.showPhoneCodeInView = true
        countryPicker.showCountryNameInView = false

        return countryPicker
    }

    func updateUIView(_ uiView: CountryPickerView, context: Context) {
        if let country = selectedCountry {
            uiView.setCountryByCode(country.code)
        }
    }

    // MARK: - Coordinator
    class Coordinator: NSObject, CountryPickerViewDelegate, CountryPickerViewDataSource {
        var parent: CountryPickerViewRepresentable

        init(_ parent: CountryPickerViewRepresentable) {
            self.parent = parent
        }

        func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
            // You can remove this if you don’t want to update binding
            parent.selectedCountry = country
        }

        // Default country (optional)
        func preferredCountries(in countryPickerView: CountryPickerView) -> [Country] {
            // Example: Default to India 🇮🇳
            if let india = countryPickerView.getCountryByCode("IN") {
                return [india]
            }
            return []
        }
    }
}
