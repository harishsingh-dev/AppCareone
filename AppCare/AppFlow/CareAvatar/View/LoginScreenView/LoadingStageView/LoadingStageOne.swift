////import SwiftUI
////
////struct LoadingStageOne: View {

import SwiftUI

struct LoadingStageOne: View {
    @State private var filledCount = 0
    let totalRects = 17
    @State private var navigateToNext = false
    
    @StateObject private var viewModel = LoadingStageViewModel()
    var selectedImage: UIImage?

    //userdefault Value
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



    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
                ? geometry.size.width / 600.0
                : 1.0
                
                VStack(spacing: 1) {
                    Image("Ellipse 13 (1)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: scaleFactor * 419, height: scaleFactor * 187)
                        .padding(.top, scaleFactor * -250)
                        .padding(.horizontal, scaleFactor * -14)
                    headerImage(scaleFactor: scaleFactor)
                    titleTexts(scaleFactor: scaleFactor)
                    loadingBar(scaleFactor: scaleFactor)
                        .onAppear {
                            animateLoading()
                        }
                    
                    NavigationLink(destination: HoldingScreenone(),
                                   isActive: $navigateToNext,
                                   label: { EmptyView() })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                
              
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

// MARK: - Subviews

private extension LoadingStageOne {
    func headerImage(scaleFactor: CGFloat) -> some View {
        Image("Social life-pana 1")
            .resizable()
            .scaledToFit()
            .frame(width: scaleFactor * 346, height: scaleFactor * 346)
            .padding(.top, scaleFactor * -70)
            .padding(.horizontal, scaleFactor * 32)
    }

    func titleTexts(scaleFactor: CGFloat) -> some View {
        VStack(spacing: 1 * scaleFactor) {
            Text("Care Avatar is for everyone")
            Text("from curious kids to wise elders.")
            Text("Your companion, at every stage of life.")
        }
        .font(.custom("Inter-SemiBold", size: 18 * scaleFactor))
        .foregroundColor(.black)
        .multilineTextAlignment(.center)
        .padding(.top, scaleFactor * 18)
        .padding(.horizontal, scaleFactor * 10)
    }

    func loadingBar(scaleFactor: CGFloat) -> some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(0..<totalRects, id: \.self) { index in
                Rectangle()
                    .fill(index < filledCount ? Color(red: 73/255, green: 162/255, blue: 78/255) : Color.gray.opacity(0.2))
                    .frame(width: scaleFactor * 10.6,
                           height: scaleFactor * 20.46)
                    .cornerRadius(2)
                                   .animation(.easeInOut(duration: 0.1)
                                       .delay(Double(index) * (2.0 / Double(totalRects))),
                                        value: filledCount)
                            }
            }
            .padding(.top, scaleFactor * 25)
            .padding(.horizontal, scaleFactor * 20)
        }
        
        func animateLoading() {
            withAnimation(.easeInOut(duration: 2.0)) {
                filledCount = totalRects
            }
            
            // ✅ Dynamic parameter pass karna
            //                let selectedNames = ["\(userName ?? "")","\(userEmail ?? "")","\(UserPhoneNumber ?? "" )","\(userAge ?? "")", "\(userGender ?? "")", "\(emergencyContacts ?? [])","\(userTall ?? "")","\(userIN ?? "")","\(userfit ?? "")","\(userweight ?? "")","\(userBloodPresser ?? "")","\(usersugar ?? "")",]
            //
            // Prepare parameters for API call - Break into smaller steps
            let emergencyContactString = emergencyContacts.joined(separator: ",")
            
            // Create the array in a simpler way
            var selectedNames: [String] = []
            
            // Add each value individually
            selectedNames.append(userName ?? "")
            selectedNames.append(userEmail ?? "")
            selectedNames.append(UserPhoneNumber ?? "")
            selectedNames.append(userAge ?? "")
            selectedNames.append(userGender ?? "")
            selectedNames.append(emergencyContactString) // Use the converted string
            selectedNames.append(userTall ?? "")
            selectedNames.append(userIN ?? "")
            selectedNames.append(userfit ?? "")
            selectedNames.append(userweight ?? "")
            selectedNames.append(userBloodPresser ?? "")
            selectedNames.append(usersugar ?? "")
            
            print("📤 Calling API with parameters:")
            print("   👤 Name: \(selectedNames[0])")
            print("   📧 Email: \(selectedNames[1])")
            print("   📞 Phone: \(selectedNames[2])")
            print("   🎂 Age: \(selectedNames[3])")
            print("   🧬 Gender: \(selectedNames[4])")
            print("   🆘 Emergency Contacts: \(selectedNames[5])")
            print("   📏 Height: \(selectedNames[6]) \(selectedNames[7]) \(selectedNames[8])")
            print("   ⚖️ Weight: \(selectedNames[9])")
            print("   💉 BP: \(selectedNames[10])")
            print("   🍬 Sugar: \(selectedNames[11])")
            
            viewModel.registerApiCall(image: selectedImage)
            // Call API
           // viewModel.registerUser()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        navigateToNext = true
                    }
        }
        
        
        
    }

#Preview {
    LoadingStageOne()
}



