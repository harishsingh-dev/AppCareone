
//  EmergencyContactVC.swift
//  AppCare

//  Created by Harish Kumar Singh on 31/10/25.




import SwiftUI
import Contacts

struct EmergencyContactVC: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var manager = ContactManager()
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var navigate = false
    var selectedImage: UIImage?
    // Filtered contacts based on search
    var filteredContacts: [ContactModel] {
        if searchText.isEmpty {
            return manager.contacts
        } else {
            return manager.contacts.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.phone.contains(searchText)
            }
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
                                Text("Step 10/10")
                                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                                    .foregroundColor(Color(hex: "#878484"))
                                    .padding(.leading, 15 * scaleFactor)
                                    .padding(.top, 60 * scaleFactor)
                                
                                GeometryReader { geo in
                                    let isLandscape = geo.size.width > geo.size.height
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                            .fill(Color(hex: "#C2C2C2"))
                                            .frame(
                                                width: geo.size.width * (isLandscape ? 0.85 : 0.7),
                                                height: 8 * scaleFactor
                                            )
                                        
                                        RoundedRectangle(cornerRadius: 4 * scaleFactor)
                                            .fill(Color(hex: "#49A24E"))
                                            .frame(
                                                width: geo.size.width * (isLandscape ? 0.85 : 0.7),
                                                height: 8 * scaleFactor
                                            )
                                    }
                                    .padding(.leading, 15 * scaleFactor)
                                }
                            }

                            NavigationLink(destination: LoadingStageOne().navigationBarHidden(true)) {
                                Text("Skip")
                                    .font(.custom("Inter-SemiBold", size: 15 * scaleFactor))
                                    .foregroundColor(Color(hex: "#49A24E"))
                                    .padding(.top, 74 * scaleFactor)
                                    .padding(.trailing, 20 * scaleFactor)
                            }
                        }
                        
                        // 📝 Title
                        Text("Add emergency contacts")
                            .font(.custom("Inter-SemiBold", size: 25 * scaleFactor))
                            .foregroundColor(.black)
                            .padding(.top, 65 * scaleFactor)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        Text("Choose a trusted person we can reach in case of Emergency")
                            .font(.custom("Inter-Regular", size: 14 * scaleFactor))
                            .foregroundColor(Color(hex: "#000000"))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .padding(.top, 2 * scaleFactor)
                        
                        // MARK: Search Bar
                        HStack(spacing: 8 * scaleFactor) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(width: 20 * scaleFactor, height: 20 * scaleFactor)
                            
                            TextField("Search contacts..", text: $searchText)
                                .font(.custom("Inter-Regular", size: 15 * scaleFactor))
                                .frame(height: 46 * scaleFactor)
                        }
                        .padding(.horizontal, 12 * scaleFactor)
                        .frame(maxWidth: .infinity, minHeight: 44 * scaleFactor)
                        .background(Color(hex: "#FFFFFF"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.systemGray), lineWidth: 1)
                        )
                        .padding(.horizontal, 25 * scaleFactor)
                        .padding(.top, 20 * scaleFactor)
                        .frame(maxWidth: .infinity, alignment: .center)

                        // MARK: Contact List
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 12 * scaleFactor) {
                                ForEach(filteredContacts) { contact in
                                    ContactCardView(contact: contact, scaleFactor: scaleFactor) {
                                        let result = manager.toggleSelection(for: contact)
                                        if !result {
                                            showAlert = true
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 20 * scaleFactor)
                            .padding(.top, 10 * scaleFactor)
                            .padding(.bottom, 80 * scaleFactor)
                        }
                        .onAppear {
                            manager.fetchContacts()
                        }

                        Spacer(minLength: 80 * scaleFactor)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                // ✅ Continue button
                Button {
                    let phones = manager.selectedContacts.map { $0.phone }
                    UserDefaults.standard.set(phones, forKey: "EmergencyContactNumbers")
                    print("📞 Saved emergency contact numbers:", phones)
                    
                    // Navigate to next screen
                    navigate = true
                    
                } label: {
                    Text("Continue")
                        .font(.custom("Inter-Regular", size: scaleFactor * 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: scaleFactor * 51)
                        .background(
                            (manager.selectedContacts.count >= 1 && manager.selectedContacts.count <= 3)
                            ? Color(hex: "#49A24E")
                            : Color.gray.opacity(0.5)
                        )
                        .cornerRadius(10)
                        .padding(.horizontal, scaleFactor * 20)
                        .padding(.bottom, scaleFactor * 10)
                }
                .disabled(!(manager.selectedContacts.count >= 1 && manager.selectedContacts.count <= 3))
                
                // Hidden NavigationLink for navigation after saving
                NavigationLink(destination: LoadingStageOne(selectedImage:selectedImage).navigationBarHidden(true),
                               isActive: $navigate) { EmptyView() }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Limit reached"),
                      message: Text("You can only select up to 3 contacts."),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}



// MARK: - Contact Card
struct ContactCardView: View {
    var contact: ContactModel
    var scaleFactor: CGFloat
    var action: () -> Void

    var body: some View {
        HStack(spacing: 12 * scaleFactor) {
            if let image = contact.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 55 * scaleFactor, height: 55 * scaleFactor)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 55 * scaleFactor, height: 55 * scaleFactor)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                    )
            }

            VStack(alignment: .leading, spacing: 3 * scaleFactor) {
                Text(contact.name)
                    .font(.custom("Inter-SemiBold", size: 16 * scaleFactor))
                    .foregroundColor(.black)
                Text(contact.phone)
                    .font(.custom("Inter-Regular", size: 14 * scaleFactor))
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: action) {
                Text(contact.isSelected ? "Remove" : "Add Contact")
                    .font(.custom("Inter-SemiBold", size: 14 * scaleFactor))
                    .foregroundColor(contact.isSelected ? .red : .black)
                    .frame(width: 110 * scaleFactor, height: 36 * scaleFactor)
                    .background(
                        contact.isSelected
                        ? Color.clear
                        : Color(hex: "#FFE5F0")
                    )
                    .cornerRadius(8)
            }
        }
        .padding(12 * scaleFactor)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray), lineWidth: 1)
        )
    }
}

// MARK: - Contact Model & Manager
struct ContactModel: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    var image: UIImage?
    var isSelected: Bool = false
}

class ContactManager: ObservableObject {
    @Published var contacts: [ContactModel] = []

    var selectedContacts: [ContactModel] {
        contacts.filter { $0.isSelected }
    }

    func fetchContacts() {
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey,
                    CNContactPhoneNumbersKey, CNContactImageDataKey] as [CNKeyDescriptor]

        store.requestAccess(for: .contacts) { granted, error in
            guard granted else {
                print("Permission denied or error: \(String(describing: error))")
                return
            }

            let request = CNContactFetchRequest(keysToFetch: keys)
            var fetchedContacts: [ContactModel] = []

            try? store.enumerateContacts(with: request) { contact, _ in
                let name = "\(contact.givenName) \(contact.familyName)"
                let phone = contact.phoneNumbers.first?.value.stringValue ?? "No Number"
                let image = contact.imageData.flatMap { UIImage(data: $0) }
                fetchedContacts.append(ContactModel(name: name, phone: phone, image: image))
            }

            DispatchQueue.main.async {
                self.contacts = fetchedContacts
            }
        }
    }

    @discardableResult
    func toggleSelection(for contact: ContactModel) -> Bool {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            if !contacts[index].isSelected && selectedContacts.count >= 3 {
                return false
            }
            contacts[index].isSelected.toggle()
        }
        return true
    }
}
