//
//  LNHomeViewController.swift
//  LoveNews
//
//  Created by yingz on 2018/4/17.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LNHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataArr:Array<MovieModel>?
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
        mockData()
        self.view.addSubview(table)
        //getData()
    }
    
    func mockData() {
        let movieModel = MovieModel()
        movieModel.img = "http://img5.mtime.cn/mt/2018/03/12/094135.36237108_1280X720X2.jpg"
        movieModel.titleCn = "狂暴巨兽"
        movieModel.actorName1 = "恩·强森"
        movieModel.directorName = "布拉德·佩顿"
        dataArr = [movieModel]

    }
    func getData() {
        //参考https://raw.githubusercontent.com/jokermonn/-Api/master/Time.md
        let requestUrl = "https://api-m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=290"
        Alamofire.request(requestUrl).responseJSON { (response) in
            //guard let守护一定有值。如果没有，直接返回。
            guard let result = response.result.value else {
                //选类型后面加一个感叹号（!）来表示它肯定有值。
                print(response.result.error!)
                return
            }
            let json = JSON(result)
            print(json)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "HomeListCell"
        var cell:HomeListCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?HomeListCell
        if cell == nil {
            cell = HomeListCell(style: .default, reuseIdentifier: indentifier)
        }
        cell.setValueForCell(model: dataArr![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00
    }
    
}
