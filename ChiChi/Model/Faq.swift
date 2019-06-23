//
//  File.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/22/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import Foundation

struct Faq: Codable {
    let question: String
    let answer: String
    var opened: Bool? = false
}
