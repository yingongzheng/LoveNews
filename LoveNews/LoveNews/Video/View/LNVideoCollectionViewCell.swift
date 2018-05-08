//
//  LNVideoCollectionViewCell.swift
//  LoveNews
//
//  Created by yingz on 2018/5/7.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit

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
        
        contentImg.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.top.equalTo(self.snp.top)
            make.width.equalTo(kScreenWitdh/2-5*2)
            make.height.equalTo(120)
        }
        
        tilteLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.top.equalTo(contentImg.snp.bottom).offset(10)
            make.width.equalTo(kScreenWitdh/2-5)
        }
        
        statisticLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.width.equalTo(kScreenWitdh/2-5)
            make.height.equalTo(12)
        }
        
    }
    
    
    func setValueForCell(model:LNItemModel){
        self.contentImg.af_setImage(withURL: URL(string: model.image!)!)
        tilteLab.text = model.title
        statisticLab.text = String(format: "%.0f%@",model.statistic,"人已经观看")
    }
    
}
