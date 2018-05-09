//
//  LNVideosView.swift
//  LoveNews
//
//  Created by yingz on 2018/5/9.
//  Copyright © 2018年 ygz. All rights reserved.
//

import Foundation
import UIKit


class LNVideosView: UIView {
    

    lazy var sepView:LNSepView = {
        let sepView = LNSepView(frame: CGRect(x:0, y:5, width:kScreenWitdh-10, height: 30))
        return sepView
    }()
    
    lazy var scrollview:UIScrollView = {
        let tempScrollview = UIScrollView(frame: CGRect(x:10, y:5+sepView.bottom, width:kScreenWitdh-10, height: 180))
        tempScrollview.showsHorizontalScrollIndicator = false
        return tempScrollview
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(sepView)
        self.addSubview(scrollview)
    }
    
    func refreshForView(datas:Array<LNVideoItmeModel> ) {
        
        let scrollViewWidth :CGFloat = kScreenWitdh - 10
        let distance:CGFloat = 10
        let itemViewWidth:CGFloat = (scrollViewWidth - distance*2)/(7/3)
            for i in 0..<datas.count {
                let itemView = LNVideosItemView(frame: CGRect(x: CGFloat (i)*itemViewWidth+distance*CGFloat(i),y: 0, width:itemViewWidth, height:180))
                let videoModel  = datas[i]
                itemView.refreshForView(videoModel: videoModel)
                scrollview.addSubview(itemView)
            }
            //设置内容区域
            scrollview.contentSize = CGSize(width:(itemViewWidth+10)*CGFloat(datas.count), height: scrollview.height)
        let title:String = String(format: "%@(%d)","相关视频",datas.count)
        sepView.refreshForView(titleValue:title )
    }
    

}
