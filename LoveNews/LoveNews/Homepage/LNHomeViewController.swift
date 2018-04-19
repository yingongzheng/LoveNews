//
//  LNHomeViewController.swift
//  LoveNews
//
//  Created by yingz on 2018/4/17.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit

class LNHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let  arry:[String] = ["我是谁", "我从哪里来", "要到哪里去"]
    lazy var table:UITableView  = {
        let tempTableView = UITableView (frame: self.view.frame)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor = UIColor.white
        tempTableView.separatorStyle = .singleLine
        tempTableView.tableFooterView = UIView()
        return tempTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(table)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (table.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as UITableViewCell
        cell.textLabel?.text = arry[indexPath.row]
        return cell
    }

}
