//
//  RouterService.swift
//  kursoreader
//
//  Created by Igor Feshchun on 19.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//
import UIKit


class RouterService: IRouterService {
    
    private lazy var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let shared = RouterService()

    private init() {}
    
    func showWelcome() -> UIViewController {
        let welcomeController = WelcomeViewController()
        return welcomeController
    }
    
    
    func showMain() -> UIViewController{
        let rootController = RootViewController()
        return rootController
        
    }
    
}
