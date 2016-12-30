//
//  DetailViewController.swift
//  kursoreader
//
//  Created by Igor Feshchun on 03.12.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private(set) var detailView: DetailControllerView!
    
    override func loadView() {
        detailView = DetailControllerView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = UIColor.white
    }
}
