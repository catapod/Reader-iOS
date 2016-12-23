//
//  Design.swift
//  kursoreader
//
//  Created by Igor Feshchun on 29.09.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func color1() -> UIColor{
        return UIColor(red: 238.0 / 255, green: 65.0 / 255, blue: 54.0 / 255, alpha: 1.0)
    }
    
    class func color2() -> UIColor{
        return UIColor(red: 241.0 / 255, green: 103.0 / 255, blue: 94.0 / 255, alpha: 1.0)
    }
    
    class func color3() -> UIColor{
        return UIColor(red: 200.0 / 255, green: 199.0 / 255, blue: 204.0 / 255, alpha: 1.0)
    } // grey separator
    
    class func color4() -> UIColor{
        return UIColor(red: 247.0 / 255, green: 247.0 / 255, blue: 247.0 / 255, alpha: 1.0)
    } // grey background
    
    class func color5() -> UIColor{
        return UIColor(red: 132.0 / 255, green: 132.0 / 255, blue: 132.0 / 255, alpha: 1.0)
    } // grey label
    
    class func color6() -> UIColor {
        return UIColor(red: 0.0 / 255, green: 122.0  / 255, blue: 255.0 / 255, alpha: 1.0)
    }
    
    class func separatorColor() -> UIColor {
        return UIColor(red: 224.0 / 255, green: 224.0  / 255, blue: 224.0 / 255, alpha: 1.0)

    }
    
}

extension UIImageView {
    func configureImageView(with image: UIImage){
        
    }
}

extension UIButton {
    func configureBarButton(){
        isUserInteractionEnabled = true
        setTitleColor(UIColor.color3(), for: .normal)
        setTitleColor(UIColor.color1(), for: .highlighted)
        setTitleColor(UIColor.color1(), for: .disabled)
    }
}

extension UIStackView {
    func configureBarStack() {
        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
    }
}
extension UINavigationController {
    func configure(with navTitle: String) {
        navigationBar.isTranslucent = false
        navigationItem.title = navTitle
        
    }
}
