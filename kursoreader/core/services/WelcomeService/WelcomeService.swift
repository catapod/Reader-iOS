//
//  WelcomeService.swift
//  kursoreader
//
//  Created by Igor Feshchun on 19.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import RealmSwift

class WelcomeService: IWelcomeService {
    static let shared = WelcomeService()
    private init() {}
    
    
    func isFirstTime() -> Bool {
        guard let value = try! Realm().objects(WelcomeModel.self).first else {
            return true
        }
        
        return value.isFirstTime
    }
    
}
