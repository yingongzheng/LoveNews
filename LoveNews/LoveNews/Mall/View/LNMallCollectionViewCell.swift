//
//  LNMallCollectionViewCell.swift
//  LoveNews
//
//  Created by yingz on 2018/5/24.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit

class LNMallCollectionViewCell: UICollectionViewCell {
    
    lazy var contentImg :UIImageView = {
        let contentImg = UIImageView()
        return contentImg
    }()
    
    lazy var nameLab:UILabel  = {
        let nameLab = UILabel()
        nameLab.textColor = UIColor.black
        nameLab.numberOfLines = 2
        nameLab.font = UIFont.systemFont(ofSize: 14)
        nameLab.textAlignment = NSTextAlignment.left
        return nameLab
    }()
    
    lazy var priceLab:UILabel  = {
        let priceLab = UILabel()
        priceLab.font = UIFont.boldSystemFont(ofSize:14)
        priceLab.textColor = UIColor(0xEF8934)
        priceLab.textAlignment = NSTextAlignment.left
        return priceLab
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(contentImg)
        self.addSubview(nameLab)
        self.addSubview(priceLab)
        makeConstraints()
    }
    
    func makeConstraints() {
        
        contentImg.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(0)
            make.top.equalTo(self.snp.top)
            make.width.equalTo((kScreenWitdh-10*3)/2)
            make.height.equalTo(150)
        }
        
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.top.equalTo(contentImg.snp.bottom).offset(10)
            make.width.equalTo((kScreenWitdh-10*3)/2)
        }
        
        priceLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.width.equalTo((kScreenWitdh-10*3)/2)
            make.height.equalTo(14)
        }
        
    }
    
    func setValueForCell(model:LNMallItemModel){
        self.contentImg.af_setImage(withURL: URL(string: model.image!)!)
        nameLab.text = model.name
        priceLab.text = String(format: "¥%.0f",model.marketPrice/100)
    }
    
}
