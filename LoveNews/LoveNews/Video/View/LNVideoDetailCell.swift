

//
//  LNVideoDetailCell.swift
//  LoveNews
//
//  Created by yingz on 2018/5/9.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

class LNVideoDetailCell: UITableViewCell {
    
    lazy var videoImg :UIImageView = {
        let videoImg = UIImageView()
        return videoImg
    }()
    
    lazy var videoTitleLab:UILabel  = {
        let videoTitleLab = UILabel()
        videoTitleLab.font = UIFont.systemFont(ofSize:14)
        videoTitleLab.numberOfLines = 2
        videoTitleLab.lineBreakMode = NSLineBreakMode.byTruncatingTail
        videoTitleLab.textColor = UIColor.gray
        return videoTitleLab
    }()
    
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(videoTitleLab)
        self.addSubview(videoImg)
        makeConstraints()
    }
    
    
    func makeConstraints() {
        
        
        videoTitleLab.snp.makeConstraints { (make) in
//            make.top.equalTo(self.snp.top).offset(10)
            make.left.equalTo(self.snp.left).offset(10)
            make.width.equalTo(kScreenWitdh-10*2-10-100)
//            make.height.equalTo(14)
            make.centerY.equalTo(self)
        }
        
        videoImg.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-10)
//            make.top.equalTo(self.snp.top).offset(10)
            make.centerY.equalTo(self)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
       
        
    }
    
    func setValueForCell(model:LNVideoItmeModel){
        self.videoImg.af_setImage(withURL: URL(string: model.img!)!)
        videoTitleLab.text = model.title
    }
    
}

