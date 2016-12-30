//
//  IRouterService.swift
//  kursoreader
//
//  Created by Igor Feshchun on 19.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import Foundation
import UIKit
protocol IRouterService: class {
    
    func showWelcome() -> UIViewController
    func showMain() -> UIViewController
    
}
