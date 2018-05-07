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
    
    lazy var contentImg :UIImageView = {
        let contentImg = UIImageView()
        return contentImg
    }()
    
    lazy var tilteLab:UILabel  = {
        let tilteLab = UILabel()
        tilteLab.textColor = UIColor.black
        tilteLab.numberOfLines = 2
        tilteLab.font = UIFont.systemFont(ofSize: 14)
        return tilteLab
    }()
    
    lazy var statisticLab:UILabel  = {
        let statisticLab = UILabel()
        statisticLab.font = UIFont.systemFont(ofSize:12)
        statisticLab.textColor = UIColor.gray
        return statisticLab
    }()
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(contentImg)
        self.addSubview(tilteLab)
        self.addSubview(statisticLab)
        makeConstraints()
    }
    
    func makeConstraints() {
        
        contentImg.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(5)
            make.top.equalTo()(self.mas_top)?.offset()(0)
            make.width.mas_equalTo()(kScreenWitdh/2-5*2)
            make.height.mas_equalTo()(120)
        })
        
        tilteLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(5)
            make.top.equalTo()(contentImg.mas_bottom)?.offset()(10)
            make.width.mas_equalTo()(kScreenWitdh/2-5)
        })
        
        statisticLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(5)
            make.bottom.equalTo()(self.mas_bottom)?.offset()(-5)
            make.width.mas_equalTo()(kScreenWitdh/2-5)
            make.height.mas_equalTo()(12)
        })
    }
    
    
    func setValueForCell(model:LNItemModel){
        self.contentImg.af_setImage(withURL: URL(string: model.image!)!)
        tilteLab.text = model.title
        statisticLab.text = String(format: "%.0f%@",model.statistic,"人已经观看")
    }
    
}
