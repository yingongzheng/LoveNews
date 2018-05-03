//
//  LNHomeDetailController.swift
//  LoveNews
//
//  Created by yingz on 2018/5/3.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit

//https://ticket-api-m.mtime.cn/movie/detail.api?locationId=290&movieId=253823
//https://ticket-api-m.mtime.cn/movie/hotComment.api?movieId=253823

class LNHomeDetailController :UIViewController {
    
    lazy var storyView:UIView  = {
        let tempStoryView = UIView (frame:CGRect(x: 0, y:64, width:kScreenWitdh, height:100))
        tempStoryView.backgroundColor = UIColor.white
        return tempStoryView
    }()
    
    
    lazy var storyLab:UILabel  = {
        let storyLab = UILabel(frame: CGRect(x: 0, y:0, width:kScreenWitdh, height:100))
        storyLab.textColor = UIColor(0x729A31)
        storyLab.font = UIFont.systemFont(ofSize: 12)
        return storyLab
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //影片简介
        storyView.addSubview(storyLab)
        self.view.addSubview(storyView)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
}


