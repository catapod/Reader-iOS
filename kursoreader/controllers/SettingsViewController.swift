//
//  ThirdViewController.swift
//  kursoreader
//
//  Created by Igor Feshchun on 08.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsCellButtonDelegate {
    
    //MARK: Properties
    private(set) var settingsView: SettingsControllerView!
    
    //MARK: Lifecycle
    override func loadView() {
        settingsView = SettingsControllerView()
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        
        settingsView.tableView.dataSource = self
        settingsView.secondCell.delegate = self
    }
    
    //MARK: Delegate
    func clearButtonTapped(_ sender: AnyObject) {
        if let asd = sender as? UIButton {
            print(asd.tag)
        }
    }
    
}


extension SettingsViewController: UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorColor = UIColor.clear
        switch indexPath.row {
        case 0:
            return settingsView.firstCell
        case 1:
            return settingsView.secondCell
        case 2:
            return settingsView.thirdCell
        default:
            fatalError("no cells")
        }
    }
}
    
