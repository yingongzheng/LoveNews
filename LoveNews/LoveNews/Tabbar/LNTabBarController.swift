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
        self.addChildViewController(childerVC: homeVC, title: "热映", normalImg: "home", selectedImg: "home_on")
        
        //视频
        let liveVC = LNVideoViewController()
        self.addChildViewController(childerVC: liveVC, title: "视频", normalImg: "live", selectedImg: "live_on")
    
        //商城
        let mallVC = LNMallViewController()
        self.addChildViewController(childerVC: mallVC, title: "商城", normalImg: "store", selectedImg: "store_on")
        
        //会员中心
        let memberCenterVc = LNPersonalCenterViewController()
        self.addChildViewController(childerVC: memberCenterVc, title: "我的", normalImg: "myinfo", selectedImg: "myinfo_on")
        
        self.selectedIndex = 0
    }

    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,
                                selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
//         UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0,-5)
        
        let color = UIColor.black
        self.tabBar.tintColor = color
        
        childerVC.title = title as String
        
        var norImg = UIImage(named:normalImg as String)
        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        var selImg = UIImage(named:selectedImg as String)
        selImg = selImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let tabItem = UITabBarItem(title: title as String, image: norImg,selectedImage: selImg)
        
        let naVc = UINavigationController()
        naVc.tabBarItem = tabItem
        naVc.addChildViewController(childerVC)
        self.addChildViewController(naVc)
        
    }
}
