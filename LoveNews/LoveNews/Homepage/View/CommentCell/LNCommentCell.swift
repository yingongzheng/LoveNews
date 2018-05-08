//
//  LNCommentCell.swift
//  LoveNews
//
//  Created by yingz on 2018/5/4.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

class LNCommentCell: UITableViewCell {
    
    lazy var headImg :UIImageView = {
        let headImg = UIImageView()
        headImg.layer.cornerRadius = 15.0
        headImg.layer.masksToBounds = true
        return headImg
    }()
    
    lazy var nickNameLab:UILabel  = {
        let nickNameLab = UILabel()
        nickNameLab.font = UIFont.systemFont(ofSize:14)
        nickNameLab.textColor = UIColor.gray
        return nickNameLab
    }()
    
    lazy var contentLab:UILabel  = {
        let contentLab = UILabel()
        contentLab.textColor = UIColor.black
        contentLab.numberOfLines = 2
        contentLab.font = UIFont.systemFont(ofSize: 14)
        return contentLab
    }()
    
    lazy var areaLab:UILabel  = {
        let areaLab = UILabel()
        areaLab.textColor = UIColor.gray
        areaLab.font = UIFont.systemFont(ofSize: 10)
        return areaLab
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(headImg)
        self.addSubview(nickNameLab)
        self.addSubview(contentLab)
        self.addSubview(areaLab)
        makeConstraints()
    }
    
    
    func makeConstraints() {
        
        
        headImg.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.top.equalTo(self.snp.top).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        nickNameLab.snp.makeConstraints { (make) in
            make.left.equalTo(headImg.snp.right).offset(10)
            make.top.equalTo(self.snp.top).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(14)
        }
        
        contentLab.snp.makeConstraints { (make) in
            make.left.equalTo(nickNameLab.snp.left)
            make.top.equalTo(nickNameLab.snp.bottom).offset(10)
            make.width.equalTo(kScreenWitdh-20-20-10)
        }
        
        areaLab.snp.makeConstraints { (make) in
            make.top.equalTo(contentLab.snp.bottom).offset(10)
            make.left.equalTo(nickNameLab.snp.left)
            make.width.equalTo(kScreenWitdh-20-90)
            make.height.equalTo(10)
        }
        
        
    }
    
    func setValueForCell(model:LNCommentModel){
        self.headImg.af_setImage(withURL: URL(string: model.caimg!)!)
        nickNameLab.text = model.ca
        contentLab.text = model.ce
        var area = model.cal
        if (area?.isEmpty)! {
            area = "火星"
        }
        areaLab.text = String(format: "%@%@",area!,"网友")
    }
    
}
