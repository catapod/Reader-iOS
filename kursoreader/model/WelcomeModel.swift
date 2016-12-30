//
//  WelcomeModel.swift
//  kursoreader
//
//  Created by Igor Feshchun on 19.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import RealmSwift

class WelcomeModel: Object {
    dynamic var id = 0
    dynamic var isFirstTime = true
    
    override static func primaryKey() -> String? {
        return "id"
        
    }
}
