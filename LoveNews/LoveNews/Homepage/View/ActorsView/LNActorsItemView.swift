//
//  LNActorsItemView.swift
//  LoveNews
//
//  Created by yingz on 2018/5/4.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Masonry


class LNActorsItemView: UIView {
    
    lazy var headImg:UIImageView  = {
        let tempHeadImg = UIImageView()
        return tempHeadImg
    }()
    
    
    lazy var nameCnLab:UILabel  = {
        let tempNameCnLab = UILabel()
        tempNameCnLab.font = UIFont.boldSystemFont(ofSize: 12)
        tempNameCnLab.textAlignment = NSTextAlignment.center
        tempNameCnLab.lineBreakMode = NSLineBreakMode.byTruncatingTail
        tempNameCnLab.textColor = UIColor(0x4c4c4c)
        return tempNameCnLab
    }()
    
    lazy var nameEnLab:UILabel  = {
        let tempNameEnLab = UILabel()
        tempNameEnLab.textColor = UIColor(0x4c4c4c)
        tempNameEnLab.textAlignment = NSTextAlignment.center
        tempNameEnLab.lineBreakMode = NSLineBreakMode.byTruncatingTail
        tempNameEnLab.font = UIFont.systemFont(ofSize: 12)
        return tempNameEnLab
    }()
    
    lazy var roleNameLbl:UILabel  = {
        let tempRoleNameb = UILabel()
        tempRoleNameb.textColor = UIColor(0x4c4c4c)
        tempRoleNameb.textAlignment = NSTextAlignment.center
        tempRoleNameb.lineBreakMode = NSLineBreakMode.byTruncatingTail
        tempRoleNameb.font = UIFont.systemFont(ofSize: 12)
        return tempRoleNameb
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.isUserInteractionEnabled = true
        
        self.addSubview(headImg)
        self.addSubview(nameCnLab)
        self.addSubview(nameEnLab)
        self.addSubview(roleNameLbl)
        makeConstraints()
        
    }
    
    func refreshForView(actorModel:LNActorsModel ) {
        
        headImg.af_setImage(withURL: URL(string: actorModel.img!)!)
        nameCnLab.text = actorModel.name
        nameEnLab.text = actorModel.nameEn
        roleNameLbl.text = actorModel.roleName
        
    }
    
    func makeConstraints() {
        
        headImg.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.top.equalTo()(self.mas_top)?.offset()(5)
            make.left.equalTo()(self.mas_left)?.offset()(5)
            make.width.mas_equalTo()(120)
            make.height.mas_equalTo()(120)
        })
        
        nameCnLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.top.equalTo()(headImg.mas_bottom)?.offset()(5)
            make.left.equalTo()(self.mas_left)?.offset()(0)
            make.width.mas_equalTo()(130)
            make.height.mas_equalTo()(12)
        })
        
        nameEnLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.top.equalTo()(nameCnLab.mas_bottom)?.offset()(5)
            make.left.equalTo()(self.mas_left)?.offset()(0)
            make.width.mas_equalTo()(130)
            make.height.mas_equalTo()(12)
        })
        
        roleNameLbl.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.top.equalTo()(nameEnLab.mas_bottom)?.offset()(5)
            make.left.equalTo()(self.mas_left)?.offset()(0)
            make.width.mas_equalTo()(130)
            make.height.mas_equalTo()(12)
        })
    }
    
}
