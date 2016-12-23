//
//  DetailControllerView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 03.12.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit

class DetailControllerView: UIView {
    
    var someView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        someView = UIView()
        someView.backgroundColor = UIColor.gray
        addSubview(someView)
        
        createConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createConstraints() {
        someView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    
    
}
