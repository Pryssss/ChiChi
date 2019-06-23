//
//  Chexbox.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/23/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    let checkedImage = UIImage(named: "check")! as UIImage
    
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
                
            } else {
                self.setImage(nil, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
