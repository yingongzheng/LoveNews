//
//  HomeListCell.swift
//  LoveNews
//
//  Created by yingz on 2018/4/23.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Masonry
import Alamofire
import AlamofireImage

class HomeListCell: UITableViewCell {

    var coverImageView:UIImageView?
    
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
        
        coverImageView = UIImageView()
        self.addSubview(coverImageView!)
        
        self.addSubview(titleCnLab)
        self.addSubview(commonSpecialLab)
        self.addSubview(actorNameLab)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        
        coverImageView!.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(10)
            make.top.equalTo()(self.mas_top)?.offset()(5)
            make.width.mas_equalTo()(90)
            make.height.mas_equalTo()(90)
        })
        
        titleCnLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(self.mas_top)?.offset()(14)
            make.width.mas_equalTo()(200)
            make.height.mas_equalTo()(16)
        })

        commonSpecialLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(titleCnLab.mas_bottom)?.offset()(14)
            make.width.mas_equalTo()(300)
            make.height.mas_equalTo()(16)
        })

        actorNameLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(commonSpecialLab.mas_bottom)?.offset()(14)
            make.width.mas_equalTo()(kScreenWitdh-20-90)
            make.height.mas_equalTo()(16)
        })
    }
    
    func setValueForCell(model:movieModel){
        self.coverImageView?.af_setImage(withURL: URL(string: model.img)!)
        self.titleCnLab.text = model.tCn
        
        var commonSpecialStr :String = model.commonSpecial!
        if (commonSpecialStr.isEmpty) {
            commonSpecialStr = model.movieType!
        }
        self.commonSpecialLab.text = String(format: "%@",commonSpecialStr)
        self.actorNameLab.text = String(format: "%@",model.actors!)
    }

}
