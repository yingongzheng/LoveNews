//
//  LNActorsView.swift
//  LoveNews
//
//  Created by yingz on 2018/5/4.
//  Copyright © 2018年 ygz. All rights reserved.
//

import Foundation
import UIKit


class LNActorsView: UIView {

    lazy var scrollview:UIScrollView = {
        let tempScrollview = UIScrollView(frame: CGRect(x:5, y:5, width:kScreenWitdh-5*2, height: 180))
        tempScrollview.showsHorizontalScrollIndicator = false
        return tempScrollview
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(scrollview)
    }
  
    func refreshForView(detailModel:LNHomeDetailModel ) {
        
        if let actorsArr = detailModel.data?.basic?.actors {
            for i in 0..<actorsArr.count {
                let itemView = LNActorsItemView(frame: CGRect(x: CGFloat (i)*130+5*CGFloat(i),y: 0, width:130, height:180))
                let actorModel  = actorsArr[i]
                itemView.refreshForView(actorModel: actorModel)
                scrollview.addSubview(itemView)
            }
            //设置内容区域
            scrollview.contentSize = CGSize(width:135*CGFloat(actorsArr.count), height: scrollview.height)
        }
    }
}
