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
    
    lazy var timeLab:UILabel  = {
        let temptimeLab = UILabel()
        temptimeLab.font = UIFont.boldSystemFont(ofSize: 14)
        temptimeLab.textColor = UIColor(0x4B4B4B)
        return temptimeLab
    }()
    
    lazy var typeLab:UILabel  = {
        let temptypeLab = UILabel()
        temptypeLab.textColor = UIColor(0x4B4B4B)
        temptypeLab.font = UIFont.systemFont(ofSize: 14)
        return temptypeLab
    }()
    
    lazy var relDateLab:UILabel  = {
        let temprelDateLab = UILabel()
        temprelDateLab.textColor = UIColor(0x4B4B4B)
        temprelDateLab.font = UIFont.systemFont(ofSize: 14)
        return temprelDateLab
    }()
    
    
    lazy var quoteImg:UIImageView  = {
        let temquoteImg = UIImageView()
        return temquoteImg
    }()
    
    
    lazy var topicLab:UILabel  = {
        let tempTopicLab = UILabel()
        tempTopicLab.textColor = UIColor(0xF19648)
        tempTopicLab.font = UIFont.systemFont(ofSize: 14)
        return tempTopicLab
    }()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        coverImageView = UIImageView()
        self.addSubview(coverImageView!)
        
        self.addSubview(timeLab)
        self.addSubview(typeLab)
        self.addSubview(relDateLab)
        self.addSubview(quoteImg)
        self.addSubview(topicLab)
        
        makeConstraints()
        
    }
    
    func refreshForView(movieModel:movieModel,detailModel:LNHomeDetailModel ) {
        
        self.coverImageView?.af_setImage(withURL: URL(string: movieModel.img)!)
        timeLab.text = detailModel.data?.basic?.mins
        var typeStr = ""
        if let Arr = detailModel.data?.basic?.type {
            for movieType in Arr {
                typeStr+=movieType
            }
        }
        typeLab.text = typeStr
        
        let date = detailModel.data?.basic?.releaseDate
        let year = date?.subString(start:0, length: 4)
        let month = date?.subString(start:4, length: 2)
        let day = date?.subString(start:6, length: 2)
    
        relDateLab.text = String(format: "%@年%@月%@日%@",year!,month!,day!,"上映")
        topicLab.text = detailModel.data?.basic?.commentSpecial
        quoteImg.image = UIImage(named: "icon_quote")
        
    }
   
    func makeConstraints() {
        
        coverImageView!.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(10)
            make.top.equalTo()(self.mas_top)?.offset()(5)
            make.width.mas_equalTo()(90)
            make.height.mas_equalTo()(110)
        })
        
        timeLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(self.mas_top)?.offset()(14)
            make.width.mas_equalTo()(200)
            make.height.mas_equalTo()(14)
        })
        
        typeLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(timeLab.mas_bottom)?.offset()(14)
            make.width.mas_equalTo()(300)
            make.height.mas_equalTo()(14)
        })
        
        relDateLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(typeLab.mas_bottom)?.offset()(14)
            make.width.mas_equalTo()(kScreenWitdh-20-90)
            make.height.mas_equalTo()(14)
        })
        
        quoteImg.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(relDateLab.mas_bottom)?.offset()(14)
            make.width.mas_equalTo()(14)
            make.height.mas_equalTo()(12)
        })
        
        topicLab.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(quoteImg.mas_right)?.offset()(5)
            make.top.equalTo()(relDateLab.mas_bottom)?.offset()(14)
            make.width.mas_equalTo()(kScreenWitdh-20-90)
            make.height.mas_equalTo()(14)
        })
    }
    
}
