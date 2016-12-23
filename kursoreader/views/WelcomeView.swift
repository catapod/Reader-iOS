//
//  WelcomeView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 29.09.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

protocol WelcomeViewDelegate : class {
    func didTapButton(sender: AnyObject)
}

class WelcomeView: UIView {
    
    //MARK: Properties
    weak var delegate: WelcomeViewDelegate?

    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "robot")
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "background")
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let signButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.clear
        button.setTitle("Перейти к приложению", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Привет!"
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Мы рады, \nчто ты присоединился к нам"
        label.textAlignment = .center
        label.font = label.font.withSize(24)
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        return label
    }()
    
    
    //MARK: Init methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseSetup()
    }
    

    
    func baseSetup() {
        addSubview(backgroundImage)
        addSubview(logo)
        addSubview(welcomeLabel)
        addSubview(messageLabel)
        signButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        addSubview(signButton)
        configureBackgroundImage()
        configureLogo()
        configureWelcomeLabel()
        configureMessageLabel()
        configureSignButton()
    }
    
    //MARK: Configuration
    func configureBackgroundImage() {
        backgroundImage.snp.makeConstraints{ make in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)

        }
    }
    
    func configureLogo(){
        logo.snp.makeConstraints{ make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-90)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
    }
    
    func configureWelcomeLabel() {
        welcomeLabel.snp.makeConstraints{ make in
            make.top.equalTo(logo.snp.bottom).offset(16)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(30)
        }
    }
    func configureMessageLabel() {
        messageLabel.snp.makeConstraints{ make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(8)
        }
    }
    
    func configureSignButton(){
        signButton.snp.makeConstraints{ make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
            make.height.equalTo(48)
        }
    }
    
    
    //MARK: Delegate
    @IBAction func buttonPressed(sender: AnyObject) {
        delegate?.didTapButton(sender: sender)
    }
    
}
