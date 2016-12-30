//
//  FooterView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 18.11.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit
class FooterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    private var footerView: UIView!
    private var footerlabel: UILabel!
    
    private func baseInit(){
        footerView = UIView()
        footerView.backgroundColor = UIColor.blue
        footerlabel = UILabel()
        footerlabel.numberOfLines = 0
        footerlabel.textColor = UIColor.color3()
        footerlabel.font = UIFont(name: "Helvetica-Neue", size: 14)
        footerlabel.text = "Лицензия Creative Commons разрешает копировать, распространять, воспроизводить, исполнять и перерабатывать произведение, защищенное авторскими правами, при условии указания автора произведения.\n\nКурсомир – это широкомасштабный волонтерский образовательный проект. Мы – сообщество людей, переводящих лекции MIT на русский язык. Мы будем рады,  если вы захотите стать частью нашей команды. По всем вопросам пишите на почту. devteam@kursomir.ru"
        footerlabel.textAlignment = .center
        
        footerView.addSubview(footerlabel)
        
        addSubview(footerView)
        
        createConstraints()
    }
    
    func createConstraints() {
        footerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        footerlabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
        }
    }
    
    
    
}
