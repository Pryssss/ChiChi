//
//  ViewController.swift
//  ChiChi
//
//  Created by Markiyan Prysiazhniuk on 6/22/19.
//  Copyright © 2019 Markiyan Prysiazhniuk. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var connectButton: UIButton!
    
    let networkManager = NetworkManager()
    var myData: [Faq] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        removeSeperators()
        setupButton()
        registerCell(nibName: "MainCell", bundle: nil, forCellReuseIdentifier: "MainCell")
        networkManager.getData { (data) in
            self.myData = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    @IBAction func showEmail(_ sender: Any) {
        showMailComposer()
    }
}

extension ViewController {
    func removeSeperators() {
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }
    
    func setupButton() {
        connectButton.layer.cornerRadius = 20
    }
    
    func registerCell(nibName: String, bundle: Bundle?, forCellReuseIdentifier: String) {
        tableView.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: forCellReuseIdentifier)
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["pryssiaznuk12@gmail.com"])
        composer.setSubject("Help")
        present(composer, animated: true)
        
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
        }
        controller.dismiss(animated: true)
    }
}

extension ViewController: SectionCellDelegate {
    func toggleSection(cell: SectionCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
       
        if myData[indexPath.section].opened == true {
            myData[indexPath.section].opened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .automatic)
        } else {
            myData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .automatic)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if myData[section].opened == true {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionCell.self)) as! SectionCell
            cell.delegate = self
            cell.setup(faq: self.myData[indexPath.section])
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainCell.self)) as! MainCell
            cell.selectionStyle = .none
            
            cell.setup(answer: self.myData[indexPath.section].answer)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if myData[indexPath.section].opened == true {
            myData[indexPath.section].opened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .automatic)
        } else {
            myData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .automatic)
        }
    }
}

