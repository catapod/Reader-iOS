//
//  ButtonBar.swift
//  kursoreader
//
//  Created by Igor Feshchun on 03.11.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit

enum Side {
    case left
    case right
}

protocol ButtonBarDelegate: class {
    func buttonPressed(_ sender: AnyObject)
}

class ButtonBar: UIView {
    
    //MARK: Properties
    weak open var delegate: ButtonBarDelegate?
    private var underline: UIView!
    private var stackview: UIStackView!
    private var border: UIView!
    private var count: Int = 2
    private var titlesArray = [String]()
    private var buttons = [UIButton]()
    
    //MARK: Button factory
    private func buttonFactory() -> [UIButton] {
        for i in 0..<count {
            let button = UIButton(type: .custom)
            button.configureBarButton()
            button.setTitle(titlesArray[i], for: .normal)
            button.addTarget(self, action: #selector(touched(_:)), for: .touchUpInside)
            button.tag = i
            buttons.append(button)
        }
        return buttons
    }
    

    //MARK: Init
    init(frame: CGRect, quantity: Int, titles: [String]) {
        count = quantity
        titlesArray = titles
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    //MARK: Configure UI
    private func baseInit() {
        let buttons = buttonFactory()
        for button in buttons {
            if button.tag != 0 {
                button.isEnabled = true
            } else {
                button.isEnabled = false
            }
        }

        stackview = UIStackView(arrangedSubviews: buttons)
        stackview.configureBarStack()
        addSubview(stackview)
        
        border = UIView()
        border.backgroundColor = UIColor.color3()
        
        addSubview(border)
        
        underline = UIView()
        underline.backgroundColor = UIColor.color1()
        
        addSubview(underline)
        
        createConstraints()
    }
    
    //MARK: Configure constraints
    private func createConstraints() {
        stackview.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        border.snp.makeConstraints{ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        underline.snp.remakeConstraints{ make in
            make.centerX.equalTo(buttons[0].snp.centerX)
            make.width.equalTo(buttons[0].snp.width)
            make.bottom.equalToSuperview()
            make.height.equalTo(3)
        }
    }
    
    
    //MARK: Animation
    private func animateUnderline(to position: Int) {
        
            underline.snp.remakeConstraints{ make in
                make.centerX.equalTo(buttons[position].snp.centerX)
                make.width.equalTo(buttons[position].snp.width)
                make.bottom.equalToSuperview()
                make.height.equalTo(3)
            }
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    //MARK: Delegate
    func touched(_ sender: AnyObject) {
        delegate?.buttonPressed(sender)
        updateButtons(sender.tag)
    }
    
    
    //MARK: UI Update
    private func updateButtons(_ position: Int) {
        for button in buttons {
            if button.tag == position {
                button.isEnabled = false
                animateUnderline(to: position)
            } else {
                button.isEnabled = true
            }
        }
    }
    
    
}
