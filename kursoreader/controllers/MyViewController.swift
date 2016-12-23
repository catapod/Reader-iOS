//
//  FirstViewController.swift
//  kursoreader
//
//  Created by Dmitrii on 29.08.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit


class MyViewController: UIViewController, MyControllerViewDelegate {
    
    
    //MARK: Properties
    private(set) var mainView: MyControllerView!
    fileprivate var count = 10
    
    var dummyData = ["var", "aldksjbvlksbdvlsbdvlsbdvlkjsDV", "MNMNMNMNMNSMNMNMNSMNMNMNSMNMNMNSMNMNMNSMNMNMNSMNS", "SDKJCBSKJDVBSJDVHBASDJHVBASDHBVLAHSDVBASLD"]
    //MARK: Lifecycle
    
    override func loadView() {
        mainView = MyControllerView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.delegate = self
        count = 3
        mainView.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            mainView.offset = 0
        } else {
            mainView.offset = 20
        }
    }
    
    func touchButton(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            mainView.tableView.reloadData()
        default:
            mainView.tableView.reloadData()
        }
    }
    
}


extension MyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        
        if indexPath.row == 0 {
            cell.textLabel!.text = dummyData[0]
            cell.textLabel!.numberOfLines = 0
//            cell?.detailTextLabel?.text = dummyData[1]
            return cell
        } else {
            cell.accessoryView = UIImageView(image: #imageLiteral(resourceName: "detail"))
            cell.textLabel?.text = dummyData[2]
            cell.textLabel?.numberOfLines = 0
//            cell?.detailTextLabel?.text = dummyData[3]

           return cell
        }
    }
    
}

extension MyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

