//
//  DumbData.swift
//  kursoreader
//
//  Created by Igor Feshchun on 05.11.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import RealmSwift

class DumbData: Object {
    
    dynamic var title = ""
    dynamic var id = ""
    override static func primaryKey() -> String? {
        return "id"
        
    }
    
}
