//
//  SecondViewController.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/23/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var textFiled: UITextView!
    @IBOutlet weak var checkBoxButton: CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        textFiled.layer.cornerRadius = 10
        checkBoxButton.layer.cornerRadius = 5
        checkBoxButton.layer.borderWidth = 1
        checkBoxButton.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
    
}
