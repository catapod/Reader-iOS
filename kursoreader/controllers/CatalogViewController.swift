//
//  SecondViewController.swift
//  kursoreader
//
//  Created by Dmitrii on 29.08.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {

    private(set) var catalogView: CatalogControllerView!
    
    override func loadView() {
        catalogView = CatalogControllerView()
        view = catalogView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Каталог"
        
    }

  
}

