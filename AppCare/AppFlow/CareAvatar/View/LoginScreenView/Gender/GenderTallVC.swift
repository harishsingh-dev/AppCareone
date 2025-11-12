

//import SwiftUI
//
//struct GenderTallVC: View {
//    
//    @Environment(\.dismiss) var dismiss
//    @State private var selectedUnit = "cm"
//    let units = ["cm", "ft & in"]
//    @State private var Tall: String = ""
//    @State private var tallFit: String = ""
//    @State private var tallIN: String = ""
//    var body: some View {
//        
//        GeometryReader { geometry in
//            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
//            ? geometry.size.width / 600.0
//            : 1.0
//            
//            VStack(spacing: 0) {
//                ScrollView(showsIndicators: false) {
//                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
//                        
//                        // 🔙 Back Button + Progress
//                        HStack(spacing: 5 * scaleFactor) {
//                            Button(action: { dismiss() }) {
//                                Image("Back")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
//                                    .padding(.leading, 25 * scaleFactor)
//                                    .padding(.top, 58 * scaleFactor)
//                            }
//                            
//                            VStack(alignment: .leading, spacing: 8 * scaleFactor) {
//                                Text("Step 5/10")
//                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
//                                    .foregroundColor(Color(hex: "#878484"))
//                                    .padding(.leading, 15 * scaleFactor)
//                                    .padding(.top, 45 * scaleFactor)
//                                
//                                ZStack(alignment: .leading) {
//                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
//                                        .fill(Color(hex: "#C2C2C2"))
//                                        .frame(width: geometry.size.width * 0.7, height: 8 * scaleFactor)
//                                    
//                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
//                                        .fill(Color(hex: "#49A24E"))
//                                        .frame(width: geometry.size.width * 0.7 * 0.5, height: 8 * scaleFactor)
//                                }
//                                .padding(.leading, 15 * scaleFactor)
//                            }
//                        }
//                        
//                        // 📝 Title
//                        Text("How tall are you?")
//                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
//                            .foregroundColor(.black)
//                            .padding(.top, 65 * scaleFactor)
//                            .frame(maxWidth: .infinity)
//                            .multilineTextAlignment(.center)
//                    
//                        
//                        // 📏 Height Display (changes with selection)
//                        if selectedUnit == "cm" {
//                            // 🧾 Text Field (with dynamic color)
//                            TextField("0", text: $Tall)
//                               // .id(Tall) // 👈 Forces view refresh when text changes
//                                .font(.custom("Inter-SemiBold", size: 70 * scaleFactor))
//                                .foregroundColor(
//                                    Tall.trimmingCharacters(in: .whitespaces).isEmpty
//                                    ? Color(hex: "#878484")
//                                    : Color(hex: "#49A24E")
//                                )
//                                .multilineTextAlignment(.center)
//                                .keyboardType(.numberPad)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .padding(.top, 45 * scaleFactor)
//                                .onChange(of: Tall) { newValue in
//                                    // Optional: Allow only numeric input
//                                    Tall = newValue.filter { "0123456789".contains($0) }
//                                }
//                            
//                        } else {
//                            HStack(alignment: .firstTextBaseline, spacing: 1 * scaleFactor) {
//                                // Feet input
//                                TextField("0", text: $tallFit)
//                                    .font(.custom("Inter-SemiBold", size: 70 * scaleFactor))
//                                    .foregroundColor(
//                                        tallFit.trimmingCharacters(in: .whitespaces).isEmpty
//                                        ? Color(hex: "#878484")
//                                        : Color(hex: "#49A24E")
//                                    )
//                                    .multilineTextAlignment(.center)
//                                    .keyboardType(.numberPad)
//                                    .frame(width: 100 * scaleFactor)
//                                    .onChange(of: tallFit) { newValue in
//                                        tallFit = newValue.filter { "0123456789".contains($0) }
//                                    }
//                                
//                                Text("ft")
//                                    .font(.custom("Inter-SemiBold", size: 30 * scaleFactor))
//                                    .foregroundColor(Color(hex: "#878484"))
//                                    .padding(.trailing, 5 * scaleFactor)
//                                
//                                // Inches input
//                                TextField("0", text: $tallIN)
//                                    .font(.custom("Inter-SemiBold", size: 70 * scaleFactor))
//                                    .foregroundColor(
//                                        tallIN.trimmingCharacters(in: .whitespaces).isEmpty
//                                        ? Color(hex: "#878484")
//                                        : Color(hex: "#49A24E")
//                                    )
//                                    .multilineTextAlignment(.center)
//                                    .keyboardType(.numberPad)
//                                    .frame(width: 100 * scaleFactor)
//                                    .onChange(of: tallIN) { newValue in
//                                        tallIN = newValue.filter { "0123456789".contains($0) }
//                                    }
//                                
//                                Text("in")
//                                    .font(.custom("Inter-SemiBold", size: 30 * scaleFactor))
//                                    .foregroundColor(Color(hex: "#878484"))
//                            }
//                            .frame(maxWidth: .infinity)
//                            .padding(.top, 45 * scaleFactor)
//
//                        }
//                        
//                        // 🧭 Unit Toggle
//                        HStack(spacing: 0) {
//                            ForEach(units, id: \.self) { unit in
//                                Button(action: {
//                                    withAnimation(.easeInOut(duration: 0.2)) {
//                                        selectedUnit = unit
//                                    }
//                                }) {
//                                    Text(unit)
//                                        .font(.custom("Inter-Medium", size: 16 * scaleFactor))
//                                        .foregroundColor(selectedUnit == unit ? .black : .gray)
//                                        .frame(maxWidth: .infinity)
//                                        .padding(.vertical, 10 * scaleFactor)
//                                        .background(
//                                            RoundedRectangle(cornerRadius: 8 * scaleFactor)
//                                                .fill(selectedUnit == unit ? Color.white : Color.clear)
//                                        )
//                                }
//                            }
//                        }
//                        .padding(4 * scaleFactor)
//                        .background(Color(UIColor.systemGray6))
//                        .clipShape(RoundedRectangle(cornerRadius: 10 * scaleFactor))
//                        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
//                        .frame(width: 200 * scaleFactor)
//                        .frame(maxWidth: .infinity)
//                        .padding(.top, 5 * scaleFactor)
//
//                        
//                        Spacer(minLength: 80 * scaleFactor)
//                    }
//                    .frame(maxWidth: .infinity)
//                }
//                .onTapGesture { hideKeyboard() }
//
//                // ✅ Bottom Continue Button
//                NavigationLink(destination: GenderWeightVC().navigationBarHidden(true)) {
//                    Text("Continue")
//                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
//                        .background(Color(hex: "#C2C2C2"))
//                        .cornerRadius(10)
//                        .padding(.horizontal, scaleFactor * 20)
//                        .padding(.bottom, scaleFactor * 10)
//                }
//            }
//            .ignoresSafeArea(.keyboard, edges: .bottom)
//        }
//    }
//}
//
//#Preview {
//    GenderTallVC()
//}


import SwiftUI

struct GenderTallVC: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedUnit = "cm"
    let units = ["cm", "ft & in"]
    @State private var Tall: String = ""
    @State private var tallFit: String = ""
    @State private var tallIN: String = ""
    @State private var navigateNext = false // ✅ For manual navigation
    
    // ✅ Computed property: determines if height input is valid
    private var isHeightEntered: Bool {
        if selectedUnit == "cm" {
            return !Tall.trimmingCharacters(in: .whitespaces).isEmpty
        } else {
            return !tallFit.trimmingCharacters(in: .whitespaces).isEmpty ||
                   !tallIN.trimmingCharacters(in: .whitespaces).isEmpty
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 5 * scaleFactor) {
                        
                        // 🔙 Back Button + Progress
                        HStack(spacing: 5 * scaleFactor) {
                            Button(action: { dismiss() }) {
                                Image("Back")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 39 * scaleFactor, height: 39 * scaleFactor)
                                    .padding(.leading, 25 * scaleFactor)
                                    .padding(.top, 58 * scaleFactor)
                            }
                            
                            VStack(alignment: .leading, spacing: 8 * scaleFactor) {
                                Text("Step 5/10")
                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                                    .padding(.leading, 15 * scaleFactor)
                                    .padding(.top, 45 * scaleFactor)
                                
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                        .fill(Color(hex: "#C2C2C2"))
                                        .frame(width: geometry.size.width * 0.7, height: 8 * scaleFactor)
                                    
                                    RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                        .fill(Color(hex: "#49A24E"))
                                        .frame(width: geometry.size.width * 0.7 * 0.5, height: 8 * scaleFactor)
                                }
                                .padding(.leading, 15 * scaleFactor)
                            }
                        }
                        
                        // 📝 Title
                        Text("How tall are you?")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    
                        // 📏 Height Input
                        if selectedUnit == "cm" {
                            TextField("0", text: $Tall)
                                .font(.custom("Inter-SemiBold", size: 70 * scaleFactor))
                                .foregroundColor(
                                    Tall.trimmingCharacters(in: .whitespaces).isEmpty
                                    ? Color(hex: "#878484")
                                    : Color(hex: "#49A24E")
                                )
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, 45 * scaleFactor)
                                .onChange(of: Tall) { newValue in
                                    Tall = newValue.filter { "0123456789".contains($0) }
                                }
                        } else {
                            HStack(alignment: .firstTextBaseline, spacing: 1 * scaleFactor) {
                                TextField("0", text: $tallFit)
                                    .font(.custom("Inter-SemiBold", size: 70 * scaleFactor))
                                    .foregroundColor(
                                        tallFit.trimmingCharacters(in: .whitespaces).isEmpty
                                        ? Color(hex: "#878484")
                                        : Color(hex: "#49A24E")
                                    )
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .frame(width: 100 * scaleFactor)
                                    .onChange(of: tallFit) { newValue in
                                        tallFit = newValue.filter { "0123456789".contains($0) }
                                    }
                                
                                Text("ft")
                                    .font(.custom("Inter-SemiBold", size: 30 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                                    .padding(.trailing, 5 * scaleFactor)
                                
                                TextField("0", text: $tallIN)
                                    .font(.custom("Inter-SemiBold", size: 70 * scaleFactor))
                                    .foregroundColor(
                                        tallIN.trimmingCharacters(in: .whitespaces).isEmpty
                                        ? Color(hex: "#878484")
                                        : Color(hex: "#49A24E")
                                    )
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .frame(width: 100 * scaleFactor)
                                    .onChange(of: tallIN) { newValue in
                                        tallIN = newValue.filter { "0123456789".contains($0) }
                                    }
                                
                                Text("in")
                                    .font(.custom("Inter-SemiBold", size: 30 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 45 * scaleFactor)
                        }
                        
                        // 🧭 Unit Toggle
                        HStack(spacing: 0) {
                            ForEach(units, id: \.self) { unit in
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedUnit = unit
                                    }
                                }) {
                                    Text(unit)
                                        .font(.custom("Inter-Medium", size: 16 * scaleFactor))
                                        .foregroundColor(selectedUnit == unit ? .black : .gray)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 10 * scaleFactor)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8 * scaleFactor)
                                                .fill(selectedUnit == unit ? Color.white : Color.clear)
                                        )
                                }
                            }
                        }
                        .padding(4 * scaleFactor)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10 * scaleFactor))
                        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                        .frame(width: 200 * scaleFactor)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 5 * scaleFactor)
                        
                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }
                .onTapGesture { hideKeyboard() }

                // ✅ Hidden NavigationLink for manual navigation
                NavigationLink(destination: GenderWeightVC().navigationBarHidden(true),
                               isActive: $navigateNext) { EmptyView() }

                // ✅ Continue Button (manual navigation)
                Button(action: {
                    if isHeightEntered {
                        // ✅ Save to UserDefaults
                        UserDefaults.standard.set(selectedUnit, forKey: "selectedUnit")
                        UserDefaults.standard.set(Tall, forKey: "Tall")
                        UserDefaults.standard.set(tallFit, forKey: "tallFit")
                        UserDefaults.standard.set(tallIN, forKey: "tallIN")
                        
                        // 🖨️ Print saved values
                        print("✅ Height saved successfully:")
                        print("Unit:", UserDefaults.standard.string(forKey: "selectedUnit") ?? "")
                        print("Tall (cm):", UserDefaults.standard.string(forKey: "Tall") ?? "")
                        print("Feet:", UserDefaults.standard.string(forKey: "tallFit") ?? "")
                        print("Inches:", UserDefaults.standard.string(forKey: "tallIN") ?? "")
                        
                        // ✅ Navigate manually
                        navigateNext = true
                    } else {
                        print("❌ Please enter your height first.")
                    }
                }) {
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(isHeightEntered ? Color.mainGreen : Color(hex: "#C2C2C2"))
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                }
                .disabled(!isHeightEntered)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

#Preview {
    GenderTallVC()
}
