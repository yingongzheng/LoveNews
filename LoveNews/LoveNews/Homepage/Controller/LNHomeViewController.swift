//
//  LNHomeViewController.swift
//  LoveNews
//
//  Created by yingz on 2018/4/17.
//  Copyright © 2018年 ygz. All rights reserved.
//

/*
 * 接口请求地址 https://raw.githubusercontent.com/jokermonn/-Api/master/Time.md
 */


import UIKit
import Alamofire
import AlamofireObjectMapper

class LNHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let CellIdentifierClass = "HomeList"
    var dataArr:Array<movieModel> = []
    lazy var table:UITableView  = {
        let tempTableView = UITableView (frame:CGRect(x: 0, y:64, width: self.view.bounds.width, height: self.view.bounds.height-64))
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor = UIColor.white
        tempTableView.separatorStyle = .singleLine
        tempTableView.tableFooterView = UIView()
        tempTableView.register(HomeListCell.self, forCellReuseIdentifier: CellIdentifierClass)
        return tempTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(table)
        self.table.es.addPullToRefresh {
            [weak self] in
            self?.getData()
            self?.table.es.stopPullToRefresh(ignoreDate: true)
        }
        self.table.es.startPullToRefresh()
        
    }
        
    func getData() {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDMode.determinate;
        Alamofire.request(homeUrl).responseObject { (response: DataResponse<HotPlayModel>) in
            let responseValue = response.result.value
            self.dataArr.removeAll()
            if let Arr = responseValue?.ms {
                for movie in Arr {
                    self.dataArr.append(movie)
                }
            }
            MBProgressHUD .hide(for: self.view, animated: true)
            self.table .reloadData()
        }
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "HomeListCell"
        var cell:HomeListCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?HomeListCell
        if cell == nil {
         cell =  HomeListCell(style: .default, reuseIdentifier: indentifier)
        }
        cell.setValueForCell(model: dataArr[indexPath.row])
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = LNHomeDetailController()
        let movieModel = dataArr[indexPath.row]
        detailVC.passMovieModel  = movieModel
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
