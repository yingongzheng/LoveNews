//
//  LNBaseViewController.swift
//  LoveNews
//
//  Created by yingz on 2018/5/3.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit


class LNBaseViewController :UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backToPrevious))
         leftBarBtn.image = UIImage(named: "navBar_back_normal")
        self.navigationItem.leftBarButtonItem = leftBarBtn
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white;
    }
    
    @objc func  backToPrevious() {
        
        self.navigationController?.popViewController(animated: true)
    }
}


