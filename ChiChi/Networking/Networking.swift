//
//  Networking.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/22/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import Foundation
import Alamofire

// -------------------------------------
// MARK: - Network Errors
// -------------------------------------

enum NetworkError: Error {
    case decodeError(Error)
    case serverError(Error)
    case unknown
}

// -------------------------------------
// MARK: - NetworkResut
// -------------------------------------

enum NetworkResult<T: Codable> {
    case success(T)
    case failure(NetworkError)
}

// -------------------------------------
// MARK: - Network
// -------------------------------------

class Network {
    
    /// sigelton
    private init() {}
    static let shared = Network()
    
    func requestData<T: Codable>(of request: ChiChiRouter<T>,
                                 as type: T.Type, completion: @escaping (NetworkResult<T>) -> ()) {
        Alamofire.request(request).validate(statusCode: 200..<300).responseData {
            switch $0.result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(T.self, from: value)
                    completion(.success(model))
                } catch {
                    completion(.failure(.decodeError(error)))
                }
            case .failure(let error):
                completion(.failure(.serverError(error)))
            }
        }
    }
}
