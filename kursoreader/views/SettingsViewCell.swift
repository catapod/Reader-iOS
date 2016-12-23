//
//  SettingsViewCell.swift
//  kursoreader
//
//  Created by Igor Feshchun on 12.11.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit

protocol SettingsCellButtonDelegate: class {
    func clearButtonTapped(_ sender: AnyObject)
}

class SettingsViewCell: UITableViewCell {
    
    //MARK: Properties
    weak var delegate: SettingsCellButtonDelegate?
    
    private lazy var label: UILabel = {
        $0.text = "Уведомления"
        $0.textColor = UIColor.black
        return $0
    }(UILabel())
    
    private lazy var switcher: UISwitch = {
        $0.isOn = false
        return $0
    }(UISwitch())
    
    private lazy var clearButton: UIButton = {
        $0.configureBarButton()
        $0.setTitle("Очистить историю", for: .normal)
        $0.addTarget(self, action: #selector(clearButtonTap(_:)), for: .touchUpInside)
        return $0
    }(UIButton(type: .custom))
    
    private lazy var footerText: UILabel = {
        $0.numberOfLines = 0
        $0.textColor = UIColor.color3()
        $0.font = UIFont(name: "Helvetica-Neue", size: 14)
        $0.text = "Лицензия Creative Commons разрешает копировать, распространять, воспроизводить, исполнять и перерабатывать произведение, защищенное авторскими правами, при условии указания автора произведения.\n\nКурсомир – это широкомасштабный волонтерский образовательный проект. Мы – сообщество людей, переводящих лекции MIT на русский язык. Мы будем рады,  если вы захотите стать частью нашей команды. По всем вопросам пишите на почту. devteam@kursomir.ru"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var logo: UIImageView = {
        $0.image = #imageLiteral(resourceName: "kursomir")
        return $0
    }(UIImageView())
    
    private lazy var icons: UIImageView = {
        $0.image = #imageLiteral(resourceName: "icons")
        return $0
    }(UIImageView())
    
    private lazy var bottomSeparator: DividerView = {
        $0.backgroundColor = UIColor.color3()
        return $0 as! DividerView
    }(DividerView())
    
    private lazy var topSeparator: UIView = {
        $0.backgroundColor = UIColor.color3()
        return $0
    }(UIView())
    
    //MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Configure cell methods
    
    //Method configure cell with label and switch
    func configureWithSwitcher() {
        addSubview(label)
        addSubview(switcher)
        addSubview(bottomSeparator)
        addSubview(topSeparator)
        
        createConstraints()
        
    }
    //Method configure cell with clear button
    func configureWithButton() {
        addSubview(clearButton)
        addSubview(bottomSeparator)
        createButtonConstraints()
    }
    
    //Method configure cell with privacy text and logos
    func configureWithText(){
        backgroundColor = UIColor.clear
        addSubview(footerText)
        addSubview(logo)
        addSubview(icons)
        createFooterTextConstraints()
    }
    
    //MARK: Configure constraints methods
    private func createConstraints(){
        label.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
        
        switcher.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
        
        topSeparator.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        createSeparatorConstraints()
        
        
    }

    private func createFooterTextConstraints() {
        footerText.snp.makeConstraints{
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(16)
        }
        
        logo.snp.makeConstraints{
            $0.top.equalTo(footerText.snp.bottom).offset(32)
            $0.height.equalTo(34)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
        }
        
        icons.snp.makeConstraints{
            $0.top.equalTo(logo.snp.bottom).offset(32)
            $0.height.equalTo(24)
            $0.width.equalTo(180)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        }
        
    }
    
    
    private func createSeparatorConstraints() {
        bottomSeparator.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    
    private func createButtonConstraints(){
        clearButton.snp.makeConstraints{
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        createSeparatorConstraints()
    }
    
    //MARK: Cell delegate
    @IBAction func clearButtonTap(_ sender: AnyObject) {
        delegate?.clearButtonTapped(sender)
    }
    
    
}
