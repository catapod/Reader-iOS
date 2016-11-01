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
    
    func showWelcome()  {
        guard let firstController = UIStoryboard(name: "Welcome", bundle: nil).instantiateInitialViewController() else {
            return
        }
        
        appDelegate.window?.rootViewController = firstController
    }
    
    
    func showMain() {
        guard let  mainController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else {
            return
        }
        
        appDelegate.window?.rootViewController = mainController
        
    }
    
}
