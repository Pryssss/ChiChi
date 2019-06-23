//
//  MainCell.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/22/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    
    func setup(answer: String) {
        mainLabel.text = answer
    }
}
