//
//  ThirdViewController.swift
//  kursoreader
//
//  Created by Igor Feshchun on 08.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, ThirdControllerViewDelegate {
    
    private(set) var thirdView: ThirdControllerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdView = self.view as! ThirdControllerView
        thirdView.delegate = self
    }
    
    func touchedClearBtn() {
        print("clear")
    }

}
