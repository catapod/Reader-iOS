//
//  AppDelegate.swift
//  kursoreader
//
//  Created by Dmitrii on 29.08.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            window.backgroundColor = UIColor.white
            window.rootViewController = checkFirstLaunch()
            window.makeKeyAndVisible()
        }
        
        return true
    }
    
    
    //MARK: Router services
    func checkFirstLaunch() -> UIViewController {
        if WelcomeService.shared.isFirstTime() {
            return RouterService.shared.showWelcome()
        } else {
            return RouterService.shared.showMain()
        }
        
    }
}
