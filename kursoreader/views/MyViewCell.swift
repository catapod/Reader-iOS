//
//  MyViewCell.swift
//  kursoreader
//
//  Created by Igor Feshchun on 23.11.16.
//  Copyright © 2016 Kursomir. All rights reserved.
//

import UIKit
import SnapKit
class MyViewCell: UITableViewCell {
    
    private var detail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(){
        accessoryView = detail
        
    }
    
    func createConstraints() {
        detail.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.width.equalTo(6)
            make.height.equalTo(30)
        }
    }
}
