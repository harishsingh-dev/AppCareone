//
//  APIManager.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 01/11/25.
//

//import Foundation
//
//
//import Foundation
//import Combine
//
//final class APIManager {
//    static let shared = APIManager()
//    private init() {}
//
//    /// Generic API GET request function that decodes JSON into a Codable model.
//    func getMethod<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
//        print("get URL:", url)
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//        // ✅ Get token from UserDefaultsManager
//        if let token = UserDefaultsManager.shared.getUserToken() {
//            print("token:", token)
//            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
//        
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .tryMap { output in
//                guard let response = output.response as? HTTPURLResponse,
//                      (200...299).contains(response.statusCode) else {
//                    throw URLError(.badServerResponse)
//                }
//                return output.data
//            }
//            .decode(type: T.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//    
// //-----------------------------------------------------------------------------------------------------
//
//    
//    func postMethod<T: Decodable, U: Encodable>(
//            url: URL,
//            body: U
//        ) -> AnyPublisher<T, Error> {
//            print(url)
//            
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//            do {
//                request.httpBody = try JSONEncoder().encode(body)
//            } catch {
//                return Fail(error: error).eraseToAnyPublisher()
//            }
//
//            return URLSession.shared.dataTaskPublisher(for: request)
//                .tryMap { output in
//                    guard let response = output.response as? HTTPURLResponse,
//                          (200...299).contains(response.statusCode) else {
//                        throw URLError(.badServerResponse)
//                    }
//                    return output.data
//                }
//                .decode(type: T.self, decoder: JSONDecoder())
//                .receive(on: DispatchQueue.main)
//                .eraseToAnyPublisher()
//        }
//    
// //------------------------------------------------------------------------------------------------
//    
//    
//    func postMethodBarrerToken<T: Decodable, U: Encodable>(
//           url: URL,
//           body: U
//       ) -> AnyPublisher<T, Error> {
//           print("POST URL:", url)
//
//           var request = URLRequest(url: url)
//           request.httpMethod = "POST"
//           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//           // ✅ Add Authorization Token (if available)
//           if let token = UserDefaultsManager.shared.getUserToken() {
//               print("token:", token)
//               request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//           }
//
//           // ✅ Encode body
//           do {
//               request.httpBody = try JSONEncoder().encode(body)
//           } catch {
//               return Fail(error: error).eraseToAnyPublisher()
//           }
//
//           // ✅ Perform request
//           return URLSession.shared.dataTaskPublisher(for: request)
//               .tryMap { output in
//                   guard let response = output.response as? HTTPURLResponse else {
//                       throw URLError(.badServerResponse)
//                   }
//
//                   // Optional: Debug logs
//                   print("Status code:", response.statusCode)
//
//                   guard (200...299).contains(response.statusCode) else {
//                       throw URLError(.init(rawValue: response.statusCode))
//                   }
//
//                   return output.data
//               }
//               .decode(type: T.self, decoder: JSONDecoder())
//               .receive(on: DispatchQueue.main)
//               .eraseToAnyPublisher()
//       }
//}




import Foundation
import Combine
import UIKit

// ✅ Define APIError enum
enum APIError: Error {
    case encodingFailed
    case invalidResponse
    case invalidData
    case unauthorized
    case serverError(statusCode: Int)
}

final class APIManager {
    static let shared = APIManager()
    private init() {}

    /// Generic API GET request function that decodes JSON into a Codable model.
    func getMethod<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        print("get URL:", url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // ✅ Get token from UserDefaultsManager
        if let token = UserDefaultsManager.shared.getUserToken() {
            print("token:", token)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                guard (200...299).contains(response.statusCode) else {
                    throw APIError.serverError(statusCode: response.statusCode)
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    //-----------------------------------------------------------------------------------------------------
    
    func postMethod<T: Decodable, U: Encodable>(
        url: URL,
        body: U
    ) -> AnyPublisher<T, Error> {
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            return Fail(error: APIError.encodingFailed).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                guard (200...299).contains(response.statusCode) else {
                    throw APIError.serverError(statusCode: response.statusCode)
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    //------------------------------------------------------------------------------------------------
    
    func postMethodBarrerToken<T: Decodable, U: Encodable>(
        url: URL,
        body: U
    ) -> AnyPublisher<T, Error> {
        print("POST URL:", url)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // ✅ Add Authorization Token (if available)
        if let token = UserDefaultsManager.shared.getUserToken() {
            print("token:", token)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        // ✅ Encode body
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            return Fail(error: APIError.encodingFailed).eraseToAnyPublisher()
        }

        // ✅ Perform request
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }

                // Optional: Debug logs
                print("Status code:", response.statusCode)

                guard (200...299).contains(response.statusCode) else {
                    throw APIError.serverError(statusCode: response.statusCode)
                }

                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // --------------------------------------------------------------------------------------------
    // 🟢 NEW: POST JSON + Bearer Token + Base64 image support
    // ----------------------------------------------------------------------------------------
    func postMethodBarrerTokenWithImage<T: Decodable, U: Encodable>(
        url: URL,
        body: U,
        base64Image: String
    ) -> AnyPublisher<T, Error> {
        print("POST URL (with base64 image):", url)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // ✅ Add Authorization Token
        if let token = UserDefaultsManager.shared.getUserToken() {
            print("token:", token)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        // 🟢 Convert body struct to JSON + manually inject "image"
        var jsonBody = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(body)) as? [String: Any]
        jsonBody?["image"] = base64Image

        guard let finalBody = jsonBody,
              let bodyData = try? JSONSerialization.data(withJSONObject: finalBody) else {
            return Fail(error: APIError.encodingFailed).eraseToAnyPublisher()
        }

        request.httpBody = bodyData

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                guard (200...299).contains(response.statusCode) else {
                    throw APIError.serverError(statusCode: response.statusCode)
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func uploadMultipartData(endpoint: String, parameters: [String: Any], image: UIImage?, token: String, completion: @escaping (Result<Any, Error>) -> Void) {
        guard let url = URL(string: "http://172.104.206.4:5000/api/register") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        var body = Data()
        
        for (key, value) in parameters {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
        }
        
        if let image = image, let imageData = image.jpegData(compressionQuality: 0.5) {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(imageData)
            body.append("\r\n".data(using: .utf8)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                completion(.success(json))
            } catch let parsingError {
                completion(.failure(parsingError))
            }
        }
        
        task.resume()
    }
    
}


enum NetworkError: Error {
    case invalidURL
    case noData
}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
}

