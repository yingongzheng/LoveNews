//
//  LNTabBarController.swift
//  LoveNews
//
//  Created by yingz on 2018/4/17.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit

class LNTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //首页
        let homeVC = LNHomeViewController()
        self.addChildViewController(childerVC: homeVC, title: "首页", normalImg: "tabbar03_normal", selectedImg: "tabbar03_selected")
        
        //视频
        let myShowVC = LNVideoViewController()
        self.addChildViewController(childerVC: myShowVC, title: "视频", normalImg: "tabbar02_normal", selectedImg: "tabbar02_selected")
        
        //会员中心
        let memberCenterVc = LNPersonalCenterViewController()
        self.addChildViewController(childerVC: memberCenterVc, title: "会员中心", normalImg: "tabbar04_normal", selectedImg: "tabbar04_selected")
        
        self.selectedIndex = 0
    }

    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,
                                selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
        let color = UIColor.black
        self.tabBar.tintColor = color
        
        childerVC.title = title as String
        
        var norImg = UIImage(named:normalImg as String)
        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        var selImg = UIImage(named:selectedImg as String)
        selImg = selImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let tabItem = UITabBarItem(title: title as String, image: norImg,selectedImage: selImg)
        
//        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -5.0)
        
        let naVc = UINavigationController()
        naVc.tabBarItem = tabItem
        naVc.addChildViewController(childerVC)
        self.addChildViewController(naVc)
        
    }
}
