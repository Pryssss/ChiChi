//
//  MainCell.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/22/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import UIKit
import MessageUI

protocol SectionCellDelegate: class {
    func toggleSection(cell: SectionCell)
}

class SectionCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var downButton: UIButton!
    
    weak var delegate: SectionCellDelegate?
    
    func setup(faq: Faq) {
        questionLabel.text = faq.question
    }
    
    @IBAction func downButtonTapped(_ sender: UIButton) {
        delegate?.toggleSection(cell: self)
        
    }
}
