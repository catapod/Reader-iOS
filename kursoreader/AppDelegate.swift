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
        // Override point for customization after application launch.
        checkFirstLaunch()
        return true
    }
    
    
    //MARK: Router services
    func checkFirstLaunch() {
        if WelcomeService.shared.isFirstTime() {
            RouterService.shared.showWelcome()
        } else {
            RouterService.shared.showMain()
        }
        
    }
}
