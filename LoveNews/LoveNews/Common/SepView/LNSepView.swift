
//
//  LNSepView.swift
//  LoveNews
//
//  Created by yingz on 2018/5/9.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit


class LNSepView: UIView {
    
    lazy var titleLab:UILabel  = {
        let titleLab = UILabel()
        titleLab.font = UIFont.boldSystemFont(ofSize: 12)
        return titleLab
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(titleLab)
        makeConstraints()
        
    }
    
    func refreshForView(titleValue:String ) {
        titleLab.text = titleValue
    }
    
    func makeConstraints() {
        
        titleLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self.snp.left).offset(10)
            make.width.equalTo(kScreenWitdh-10)
            make.height.equalTo(12)
        }
        
    }
    
}
