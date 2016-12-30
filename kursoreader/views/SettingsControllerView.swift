//
//  ThirdControllerView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 08.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit


@IBDesignable
class SettingsControllerView: UIView{
    
    //MARK: Properties
    lazy var tableView: UITableView = {
        $0.register(SettingsViewCell.self, forCellReuseIdentifier: "cell")
        $0.estimatedRowHeight = 44
        $0.allowsSelection = false
        $0.rowHeight = UITableViewAutomaticDimension
        return $0
    }(UITableView(frame: self.frame, style: .grouped))
    
    let firstCell: SettingsViewCell = {
        $0.configureWithSwitcher()
        return $0
    }(SettingsViewCell())
    
    let secondCell: SettingsViewCell = {
        $0.configureWithButton()
        return $0
    }(SettingsViewCell())
    
    let thirdCell: SettingsViewCell = {
        $0.configureWithText()
        return $0
    }(SettingsViewCell())
    
    
    //MARK: Init methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    
    //MARK: Configure UI
    private func baseInit() {
        addSubview(tableView)
        createConstraints()
        
    }
    //MARK: Configure constraints
    private func createConstraints(){
        tableView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
