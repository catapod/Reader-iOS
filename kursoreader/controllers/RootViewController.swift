//
//  RootViewController.swift
//  kursoreader
//
//  Created by Igor Feshchun on 12.11.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
    
    
    private lazy var myNavigationController: UINavigationController = {
        let vc = MyViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem = UITabBarItem(title: "Моё", image: #imageLiteral(resourceName: "my"), tag: 0)
        navVC.navigationBar.isTranslucent = false
        return navVC
    }()
    
    private lazy var catalogNavigationController: UINavigationController = {
        let vc = CatalogViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem = UITabBarItem(title: "Каталог", image: #imageLiteral(resourceName: "search"), tag: 1)
        
        navVC.navigationBar.isTranslucent = false
        return navVC
    }()
    
    private lazy var settingsNavigationController: UINavigationController = {
        let vc = SettingsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem = UITabBarItem(title: "Настройки", image: #imageLiteral(resourceName: "settings_icon"), tag: 2)
        navVC.navigationBar.isTranslucent = false
        return navVC
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        tabBar.tintColor = UIColor.color1()
        viewControllers = [myNavigationController, catalogNavigationController, settingsNavigationController]
        
    }
}




