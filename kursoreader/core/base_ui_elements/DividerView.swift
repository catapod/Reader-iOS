//
//  DividerView.swift
//  kursoreader
//
//  Created by Igor Feshchun on 12.12.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit

class DividerView: UIView {

        private let dividerLayer: CALayer
        
        override init(frame: CGRect) {
            self.dividerLayer = CALayer()
            super.init(frame: frame)
            
            self.commonSetup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            self.dividerLayer = CALayer()
            super.init(coder: aDecoder)
            self.commonSetup()
        }
        
        private func commonSetup() {
            self.dividerLayer.backgroundColor = self.backgroundColor?.cgColor
            self.backgroundColor = UIColor.clear
            
            self.layer.addSublayer(self.dividerLayer)
        }
        
        override func layoutSubviews() {
            self.dividerLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 0.5)
        }

}
