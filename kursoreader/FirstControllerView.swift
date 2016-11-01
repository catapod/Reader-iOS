//
//  FristControllerView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 19.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit


protocol FirstControllerViewDelegate: class {
    func touchLeftButton()
    func touchRightButton()
}

class FirstControllerView: UIView {
    
    //MARK: Properties
    weak var delegate:FirstControllerViewDelegate?;
    
    var collectionView: UICollectionView!
    private var collectionFlowLayout: UICollectionViewFlowLayout!
    private var btn1: UIButton!
    private var btn2: UIButton!
    private var stackView: UIStackView!
    private var btnArray =  [UIButton]()
    
    
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
        collectionFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: collectionFlowLayout)
        collectionView.backgroundColor = UIColor.color4()
        collectionFlowLayout.minimumLineSpacing = 0
        collectionFlowLayout.minimumInteritemSpacing = 0
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(RedCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionFlowLayout.itemSize = CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/2)
        collectionView.backgroundColor = UIColor.white
        
        
        btn1 = UIButton(type: .custom)
        btn1.isUserInteractionEnabled = true
        btn1.setTitle("Последние", for: .normal)
        btn1.setTitleColor(UIColor.color1(), for: .normal)
        btn1.setTitleColor(UIColor.gray, for: .highlighted)
        btn1.addTarget(self, action: #selector(leftButtonPressed(sender:)), for: .touchUpInside)
        
        btn2 = UIButton(type: .custom)
        btn2.isUserInteractionEnabled = true
        btn2.setTitle("Избранные", for: .normal)
        btn2.setTitleColor(UIColor.color3(), for: .normal)
        btn2.setTitleColor(UIColor.gray, for: .highlighted)
        btn2.addTarget(self, action: #selector(rightButtonPressed(sender:)), for: .touchUpInside)

        btnArray.append(btn1)
        btnArray.append(btn2)
        
        stackView = UIStackView(arrangedSubviews: btnArray)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(stackView)
        addSubview(collectionView)
        configureStackView()
        configureCollection()
    }
    
    //MARK: Configuration
    private func configureStackView(){
        stackView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(64)
        }
    }
    
    private func configureCollection(){
        collectionView.snp.makeConstraints{ make in
            make.top.equalTo(stackView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @IBAction func leftButtonPressed(sender: AnyObject) {
        delegate?.touchLeftButton()
    }
    
    @IBAction func rightButtonPressed(sender: AnyObject) {
       delegate?.touchRightButton()
    }
}
