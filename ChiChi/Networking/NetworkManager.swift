//
//  NetworkingManager.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/22/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import Foundation

// -------------------------------------
// MARK: - Netwrok Manager
// -------------------------------------

class NetworkManager {
    
    func getData(complition: @escaping ([Faq]) -> ()) {
        Network.shared.requestData(of: .get, as: [Faq].self) {
            switch $0 {
            case.success(let model):
                DispatchQueue.global(qos: .background).async {
                    complition(model)
                }
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
}
