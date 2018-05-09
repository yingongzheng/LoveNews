//
//  LNVideosItemView.swift
//  LoveNews
//
//  Created by yingz on 2018/5/9.
//  Copyright © 2018年 ygz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


protocol LNVideosItemViewDelegate:NSObjectProtocol
{

    func clickVideo(model:LNVideoItmeModel)
}


class LNVideosItemView: UIView,UIGestureRecognizerDelegate {
    
    weak var delegate:LNVideosItemViewDelegate?
    var videoModel:LNVideoItmeModel?
    lazy var videoImg:UIImageView  = {
        let videoImg = UIImageView()
        return videoImg
    }()
    
    
    lazy var videoTitleLab:UILabel  = {
        let videoTitleLab = UILabel()
        videoTitleLab.font = UIFont.boldSystemFont(ofSize: 14)
        videoTitleLab.textAlignment = NSTextAlignment.center
        videoTitleLab.numberOfLines = 2
        videoTitleLab.lineBreakMode = NSLineBreakMode.byTruncatingTail
        videoTitleLab.textColor = UIColor(0x4c4c4c)
        return videoTitleLab
    }()
    
    lazy var button:UIButton = {
        let button:UIButton = UIButton(type:.custom)
        button.addTarget(self, action:#selector(clicked), for:.touchUpInside)
        return button
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.isUserInteractionEnabled = true
        self.addSubview(videoImg)
        self.addSubview(videoTitleLab)
        self.addSubview(button)
        makeConstraints()
        
    }
    
    @objc func clicked(){
        //调用代理方法
        if delegate != nil {
            delegate?.clickVideo(model: self.videoModel!)
        }
    }
    

    func refreshForView(videoModel:LNVideoItmeModel ) {
        self.videoModel = videoModel
        videoImg.af_setImage(withURL: URL(string: videoModel.img!)!)
        videoTitleLab.text = videoModel.title
        
    }
    
    
    func makeConstraints() {
        
        let scrollViewWidth :CGFloat = kScreenWitdh - 5
        let distance:CGFloat = 10
        let imageWidth:CGFloat = (scrollViewWidth - distance*2)/(7/3)
        
        videoImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(self.snp.left).offset(0)
            make.width.equalTo(imageWidth)
            make.height.equalTo(100)
        }
        
        videoTitleLab.snp.makeConstraints { (make) in
            make.top.equalTo(videoImg.snp.bottom).offset(5)
            make.left.equalTo(videoImg.snp.left)
            make.width.equalTo(imageWidth)
        }
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(self)
            make.height.equalTo(self)
        }
        
        
    }
    
}
