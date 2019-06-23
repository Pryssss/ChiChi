//
//  Router.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/22/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import Foundation
import Alamofire

// -------------------------------------
// MARK: - Router
// -------------------------------------
protocol Router: URLRequestConvertible {
    
    var baseURLString: String { get }
    var method: HTTPMethod { get }
    var path: String { get }

    func asURLRequest() throws -> URLRequest
}

// -------------------------------------
// MARK: - ChiChi Router
// -------------------------------------

enum ChiChiRouter<T: Codable>: Router {
    
    case get
    
    var baseURLString: String { return "https://chichi-backend.herokuapp.com/" }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    var path: String {
        switch self {
        case .get:
             let path = "\(Constans.config)/\(Constans.faq)"
            return path
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}

// -------------------------------------
// MARK: - Constants
// -------------------------------------

enum Constans {
    static let config: String = "config"
    static let faq: String = "faq"
}
