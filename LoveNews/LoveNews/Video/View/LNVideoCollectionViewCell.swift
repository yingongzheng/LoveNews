//
//  LNVideoCollectionViewCell.swift
//  LoveNews
//
//  Created by yingz on 2018/5/7.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Masonry

class LNVideoCollectionViewCell: UICollectionViewCell {
    

    lazy var label:UILabel  = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:14)
        label.textColor = UIColor.gray
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.addSubview(label)
        makeConstraints()
    }
    
    func makeConstraints() {
        
        label.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(0)
            make.top.equalTo()(self.mas_top)?.offset()(0)
            make.width.mas_equalTo()((kScreenWitdh-10)/2)
            make.height.mas_equalTo()(100)
        })
    }
}
