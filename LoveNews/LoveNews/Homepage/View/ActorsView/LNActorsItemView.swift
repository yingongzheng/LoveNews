//
//  LNActorsItemView.swift
//  LoveNews
//
//  Created by yingz on 2018/5/4.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import SnapKit


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
        
        headImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(self.snp.left).offset(5)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        nameCnLab.snp.makeConstraints { (make) in
            make.top.equalTo(headImg.snp.bottom).offset(5)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(130)
            make.height.equalTo(12)
        }
        
        nameEnLab.snp.makeConstraints { (make) in
            make.top.equalTo(nameCnLab.snp.bottom).offset(5)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(130)
            make.height.equalTo(12)
        }
        
        roleNameLbl.snp.makeConstraints { (make) in
            make.top.equalTo(nameEnLab.snp.bottom).offset(5)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(130)
            make.height.equalTo(12)
        }

    }
    
}
