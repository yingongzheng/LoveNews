//
//  LNCommentCell.swift
//  LoveNews
//
//  Created by yingz on 2018/5/4.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Masonry
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
        
        headImg.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(10)
            make.top.equalTo()(self.mas_top)?.offset()(10)
            make.width.mas_equalTo()(30)
            make.height.mas_equalTo()(30)
        })
        
        nickNameLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(headImg.mas_right)?.offset()(10)
            make.top.equalTo()(self.mas_top)?.offset()(10)
            make.width.mas_equalTo()(200)
            make.height.mas_equalTo()(14)
        })
        
        contentLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(nickNameLab.mas_left)
            make.top.equalTo()(nickNameLab.mas_bottom)?.offset()(10)
            make.width.mas_equalTo()(kScreenWitdh-20-20-10)
        })
        
        areaLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.top.equalTo()(contentLab.mas_bottom)?.offset()(10)
            make.left.equalTo()(nickNameLab.mas_left)
            make.width.mas_equalTo()(kScreenWitdh-20-90)
            make.height.mas_equalTo()(10)
        })
    }
    
    func setValueForCell(model:LNCommentModel){
        self.headImg.af_setImage(withURL: URL(string: model.caimg!)!)
        nickNameLab.text = model.ca
        contentLab.text = model.ce
        areaLab.text = String(format: "%@%@",model.cal!,"网友")
    }
    
}
