//
//  LNMovieItroduceView.swift
//  影片详情 简介
//
//  Created by yingz on 2018/5/3.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Masonry


class LNMovieItroduceView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        coverImageView = UIImageView()
        self.addSubview(coverImageView!)
        
        self.addSubview(titleCnLab)
        self.addSubview(commonSpecialLab)
        self.addSubview(actorNameLab)
        
        titleCnLab.text = "titleCnLab"
        commonSpecialLab.text = "commonSpecialLab"
        actorNameLab.text = "actorNameLab"
        makeConstraints()
    }
    
    
    func refreshForView(movieModel:movieModel) {
          self.coverImageView?.af_setImage(withURL: URL(string: movieModel.img)!)
        
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
    
}
