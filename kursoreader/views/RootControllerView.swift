//
//  RootControllerView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 24.11.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit

class RootControllerView: UIView {
    
    var tabBar: UITabBar!
    private var tabOne: UITabBarItem!
    private var tabTwo: UITabBarItem!
    private var tabThree: UITabBarItem!
    private var controllers = [UIViewController]()
    
    private let topSeparator: UIView = {
        $0.backgroundColor = UIColor.color3()
        return $0
    }(UIView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    private func baseInit() {
        tabBar = UITabBar()
        tabOne = UITabBarItem(title: "Моё", image: nil, tag: 0)
        tabTwo = UITabBarItem(title: "Каталог", image: nil, tag: 1)
        tabThree = UITabBarItem(title: "Настройки", image: nil, tag: 2)
        tabBar.items = [tabOne, tabTwo, tabThree]
        tabBar.selectedItem = tabBar.items?[0]
        addSubview(tabBar)
        tabBar.addSubview(topSeparator)
        createConstraints()
    }
    
    private func createConstraints() {
        tabBar.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(49)
        }
        
        topSeparator.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalToSuperview()
        }
        
        
    }
    
    
        
    
    
    

}
