
//  PreferenceViewModel.swift
//  AppCare

//  Created by Harish Kumar Singh on 04/11/25.


import Foundation
import Combine

final class CategoriesViewModel: ObservableObject {
    @Published var categories: [CategoryItem] = []
    @Published var errorMessage: String?
    @Published var hobbiess: UserHobbies?
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Fetch Categories (GET)
    func fetchCategories() {
        APIManager.shared.getMethod(url: APIEndpoint.getCategory)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("❌ GET Error:", error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { (response: CategoriesResponse) in
                self.categories = response.categories ?? []
                print("✅ Loaded \(self.categories.count) categories")
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Convert selected IDs → Names
    
    func selectedNames(from selectedIDs: Set<UUID>) -> [String] {
        hobbiess?.hobbies?
            .filter { hobby in
                // Match using a UUID reference you control (idd), or by name if you’re tracking selected names
                selectedIDs.contains(hobby.idd)
            }
            .compactMap { $0.name } ?? []
    }

    
    // MARK: - Send POST Request with selected hobbies
    func fetchPostCategories(selectedNames: [String]) {
        let parameters = HobbiesRequest(userHobbie: selectedNames)
        
        APIManager.shared.postMethodBarrerToken(url: APIEndpoint.postHobbies, body: parameters)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("❌ POST Error:", error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { (result: HobbiesResponse) in
                print("✅ POST Success:", result.message ?? "")
                self.hobbiess = result.hobbies
            }
            .store(in: &cancellables)
    }

}



