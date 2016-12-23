//
//  RedCollectionViewCell.swift
//  kursoreader
//
//  Created by Igor Feshchun on 08.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit


enum Offset {
    static let smallOffset = 8.0
    static let mediumOffset = 16.0
    static let bigOffset = 24.0
    static let extraBigOffset = 32.0
}


class RedCollectionViewCell: UICollectionViewCell {
    
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Биология"
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        return label
    }()
    
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private let descr: UILabel = {
        let label = UILabel()
        label.text = "150 lection courses"
        label.textColor = UIColor.white
        return label
    }()
    
    private let smallOffset: CGFloat = 8
    private let mediumOffset: CGFloat = 16
    private let bigOffset: CGFloat = 24
    private let extraOffset: CGFloat = 32
    
    
    private var leftX: CGFloat {
        return contentView.frame.origin.x
    }
    private var leftY: CGFloat {
        return contentView.frame.origin.y
    }
    
    private var rightX: CGFloat {
        return contentView.frame.width
    }
    private var rightY: CGFloat {
        return contentView.frame.height
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        redShape()
        redTriangle()
    }
    
    private func redShape(){
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: leftX + smallOffset, y: leftY + smallOffset))
        path.addLine(to: CGPoint(x: rightX - extraOffset, y: leftY + smallOffset))
        path.addLine(to: CGPoint(x: rightX - smallOffset, y: leftY + extraOffset))
        path.addLine(to: CGPoint(x: rightX - smallOffset, y: rightY - smallOffset))
        path.addLine(to: CGPoint(x: leftX + smallOffset, y: rightY - smallOffset))
        path.close()
        UIColor.color1().setFill()
        
        path.fill()
    }
    
    private func redTriangle(){
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rightX - extraOffset, y: leftY + smallOffset))
        path.addLine(to: CGPoint(x: rightX - smallOffset, y: leftY + extraOffset))
        path.addLine(to: CGPoint(x: rightX - extraOffset, y: leftY + extraOffset))
        path.addLine(to: CGPoint(x: rightX - extraOffset, y: leftY - extraOffset))
        path.close()
        UIColor.color2().setFill()
        
        path.fill()
        
    }
    
    func configureCell() {
        
        addSubview(title)
        addSubview(descr)
        addSubview(line)
        
        configureTitle()
        configureDescr()
        configureLine()
        
    }
    
    //MARK: Configuration
    func configureTitle() {
        title.snp.makeConstraints{ make in
            make.right.equalTo(-extraOffset)
            make.top.equalTo(contentView).offset(bigOffset)
            make.bottom.equalTo(line).offset(-smallOffset)
            make.left.equalTo(bigOffset)
        }
    }
    func configureLine() {
        line.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.right.equalTo(-bigOffset)
            make.top.equalTo(descr).offset(-smallOffset)
            make.left.equalTo(bigOffset)
        }
    }
    func configureDescr() {
        descr.snp.makeConstraints { make in
            make.right.equalTo(-bigOffset)
            make.bottom.equalTo(contentView).offset(-bigOffset)
            make.left.equalTo(bigOffset)
        }
    }

}
