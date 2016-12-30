//
//  FristControllerView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 19.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit

protocol MyControllerViewDelegate: class {
    func touchButton(_ sender: AnyObject)
}
@IBDesignable
class MyControllerView: UIView, ButtonBarDelegate {
    
    //MARK: Properties
    weak open var delegate:MyControllerViewDelegate?;
    
    var offset: Int = 20 {
        didSet {
            configureBtnStack(with: offset)
        }
    }
    
    var tableView: UITableView!
    
    private var collectionFlowLayout: UICollectionViewFlowLayout!
    private var btnStack: ButtonBar!
    
    
    //MARK: Init methods
    override init(frame: CGRect){
        super.init(frame: frame)
        baseInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    
    
    func baseInit() {
        
        btnStack = ButtonBar(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 44), quantity: 2, titles: ["Последние", "Избранное"])
        btnStack.delegate = self
        addSubview(btnStack)
        
        configureBtnStack(with: offset)
        
        tableView = UITableView(frame: frame)
        tableView.backgroundColor = UIColor.color4()
        tableView.register(MyViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        addSubview(tableView)
        
        configureTable()
        
    }
    
    
    
    
    private func configureBtnStack(with offset: Int) {
        let height = offset > 0 ? 44 : 32
        btnStack.snp.remakeConstraints{ make in
            make.top.equalToSuperview().offset(offset)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(height)
        }
    }
    

    private func configureTable(){
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(btnStack.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    
    func buttonPressed(_ sender: AnyObject) {
        delegate?.touchButton(sender)
    }
    
}
