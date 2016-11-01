//
//  FirstViewController.swift
//  kursoreader
//
//  Created by Dmitrii on 29.08.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, FirstControllerViewDelegate {
    //MARK: Properties
    private(set) var mainView: FirstControllerView!

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = self.view as! FirstControllerView
        mainView.collectionView.dataSource = self
        mainView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    //MARK: FirstControllerViewDelegate
    func touchLeftButton() {
        print("touched left")
    }
    
    func touchRightButton() {
        print("touched right")
    }
    

    
}


extension FirstViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RedCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.configureCell()
        return cell
    }
    
    
}

