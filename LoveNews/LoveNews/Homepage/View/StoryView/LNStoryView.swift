//
//  LNStoryView.swift
//  LoveNews
//
//  Created by yingz on 2018/5/4.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit


class LNStoryView: UIView {
    
    lazy var storyLab:UILabel  = {
        let storyLab = UILabel(frame: CGRect(x: 5, y:5, width:kScreenWitdh-5*2, height:90))
        storyLab.textColor = UIColor(0x4c4c4c)
        storyLab.numberOfLines = 8
        storyLab.font = UIFont.systemFont(ofSize: 14)
        return storyLab
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(storyLab)
    }
    
    func refreshForView(detailModel:LNHomeDetailModel ) {
        storyLab.text = detailModel.data?.basic?.story
    }
    
    
    
}
