//
//  HomeListCell.swift
//  LoveNews
//
//  Created by yingz on 2018/4/23.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

class HomeListCell: UITableViewCell {

    lazy var coverImageView :UIImageView = {
         let coverImageView = UIImageView()
         return coverImageView
    }()
    
    lazy var titleCnLab:UILabel  = {
        let tempTitleCn = UILabel()
        tempTitleCn.font = UIFont.boldSystemFont(ofSize: 18)
        tempTitleCn.textColor = UIColor.black
        return tempTitleCn
    }()
    
    lazy var commonSpecialLab:UILabel  = {
        let tempCommonSpecialLab = UILabel()
        tempCommonSpecialLab.textColor = UIColor(0x729A31)
        tempCommonSpecialLab.font = UIFont.systemFont(ofSize: 12)
        return tempCommonSpecialLab
    }()
    
    lazy var actorNameLab:UILabel  = {
        let tempActorNameLab = UILabel()
        tempActorNameLab.textColor = UIColor(0xA6A6A6)
        tempActorNameLab.font = UIFont.systemFont(ofSize: 12)
        return tempActorNameLab
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(coverImageView)
        self.addSubview(titleCnLab)
        self.addSubview(commonSpecialLab)
        self.addSubview(actorNameLab)
        
        makeConstraints()
    }
    
    
    func makeConstraints() {
        
        coverImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        
        titleCnLab.snp.makeConstraints { (make) in
            make.left.equalTo(coverImageView.snp.right).offset(10)
            make.top.equalTo(self.snp.top).offset(14)
            make.width.equalTo(200)
            make.height.equalTo(16)
        }
        
        commonSpecialLab.snp.makeConstraints { (make) in
            make.left.equalTo(coverImageView.snp.right).offset(10)
            make.top.equalTo(titleCnLab.snp.bottom).offset(14)
            make.width.equalTo(300)
            make.height.equalTo(16)
        }
        
        actorNameLab.snp.makeConstraints { (make) in
            make.left.equalTo(coverImageView.snp.right).offset(10)
            make.top.equalTo(commonSpecialLab.snp.bottom).offset(14)
            make.width.equalTo(kScreenWitdh-20-90)
            make.height.equalTo(16)
        }
        
    }
    
    func setValueForCell(model:movieModel){
        self.coverImageView.af_setImage(withURL: URL(string: model.img)!)
        self.titleCnLab.text = model.tCn
        
        var commonSpecialStr :String = model.commonSpecial!
        if (commonSpecialStr.isEmpty) {
            commonSpecialStr = model.movieType!
        }
        self.commonSpecialLab.text = String(format: "%@",commonSpecialStr)
        self.actorNameLab.text = String(format: "%@",model.actors!)
    }

}
