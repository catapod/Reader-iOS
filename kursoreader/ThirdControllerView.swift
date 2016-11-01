//
//  ThirdControllerView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 08.10.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit

protocol ThirdControllerViewDelegate: class {
    func touchedClearBtn()
}

class ThirdControllerView: UIView {
    //MARK: Properties
    weak var delegate: ThirdControllerViewDelegate!
    
    private let kTopBoxHeight = 100
    
    private let topBox: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private let bottomBox: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color4()
        return view
    }()
    
    
    private let centerSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color3()
        return view
    }()
    
    private let bottomSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color3()
        return view
    }()
    
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Уведомления"
        return label
    }()
    
    private let switcher: UISwitch = {
        let element = UISwitch()
        element.isOn = false
        return element
    }()
    
    private let clearBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Очистить историю", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private let descr1: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.color5()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Лицензия Creative Commons разрешает копировать, распространять, воспроизводить, исполнять и перерабатывать произведение, защищенное авторскими правами, при условии указания автора произведения."
        return label
    }()
    
    private let descr2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.color5()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Курсомир – это широкомасштабный волонтерский образовательный проект. Мы – сообщество людей, переводящих лекции MIT на русский язык. Мы будем рады,  если вы захотите стать частью нашей команды. По всем вопросам пишите на почту. devteam@kursomir.ru"
        return label
    }()
    
    //MARK: Init methods
    override init(frame: CGRect){
        super.init(frame: frame)
        baseInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    private func baseInit() {
        addSubview(topBox)
        addSubview(bottomBox)
        topBox.addSubview(centerSeparator)
        topBox.addSubview(bottomSeparator)
        topBox.addSubview(title)
        topBox.addSubview(switcher)
        clearBtn.addTarget(self, action: #selector(didTapClearBtn(sender:)), for: .touchUpInside)
        topBox.addSubview(clearBtn)
        bottomBox.addSubview(descr1)
        bottomBox.addSubview(descr2)
        configureTopBox()
        configureBottomBox()
        configureCenterSeparator()
        configureBottomSeparator()
        configureTitle()
        configureSwitcher()
        configureClearButton()
        configureDescr2()
        configureDescr1()
        
    }
    
    //MARK: Configuration
    private func configureTopBox() {
        topBox.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.height.equalTo(kTopBoxHeight)
        }
        
    }
    
    private func configureBottomBox() {
        bottomBox.snp.makeConstraints { make in
            make.top.equalTo(topBox.snp.bottom)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.height.equalTo(snp.height)
        }
    }
    
    private func configureCenterSeparator() {
        centerSeparator.snp.makeConstraints{ make in
            make.right.equalTo(snp.right)
            make.left.equalTo(snp.left)
            make.centerY.equalTo(topBox)
            make.height.equalTo(0.5)
        }
    }
    
    private func configureBottomSeparator() {
        bottomSeparator.snp.makeConstraints{ make in
            make.right.equalTo(snp.right)
            make.left.equalTo(snp.left)
            make.bottom.equalTo(topBox)
            make.height.equalTo(0.5)
        }
    }
    
    private func configureTitle(){
        title.snp.makeConstraints { make in
            make.left.equalTo(topBox.snp.left).offset(32)
            make.centerY.equalTo(kTopBoxHeight/2 - kTopBoxHeight/4)
            
        }
    }
    
    private func configureSwitcher() {
        switcher.snp.makeConstraints{ make in
            make.right.equalTo(topBox.snp.right).offset(-16)
            make.centerY.equalTo(kTopBoxHeight/2 - kTopBoxHeight/4)
            
        }
    }
    
    private func configureClearButton() {
        clearBtn.snp.makeConstraints{ make in
            make.left.equalTo(topBox.snp.left).offset(32)
            make.centerY.equalTo(kTopBoxHeight/2 + kTopBoxHeight/4)
        }
    }
    
    private func configureDescr1() {
        descr1.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.lessThanOrEqualTo(150)
        }
    }
    
    private func configureDescr2() {
        descr2.snp.makeConstraints{ make in
            make.top.equalTo(descr1.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            
        }
    }
    
    @IBAction func didTapClearBtn(sender: AnyObject) {
        delegate?.touchedClearBtn()
    }
    
    
    
    
}
