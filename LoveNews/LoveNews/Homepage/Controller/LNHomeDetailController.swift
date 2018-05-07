//
//  LNHomeDetailController.swift
//  LoveNews
//
//  Created by yingz on 2018/5/3.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


class LNHomeDetailController :LNBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var actorsArr:Array<LNActorsModel> = []
    var StageImgsArr:Array<LNStageImgModel> = []
    var detailModel :LNHomeDetailModel?
    var passMovieModel :movieModel?
    var dataArr:Array<LNCommentModel> = []
    
    
    lazy var movieItroduceView: LNMovieItroduceView = {
        let tempMovieItroduceView  = LNMovieItroduceView(frame: CGRect(x: 0, y:10, width:kScreenWitdh, height:130))
        return tempMovieItroduceView
    }()
    
    lazy var storyView:LNStoryView = {
        let storyView  = LNStoryView(frame: CGRect(x: 0, y:movieItroduceView.bottom+10, width:kScreenWitdh, height:100))
        return storyView
    }()
    

    lazy var actorsView:LNActorsView = {
        let actorsView  = LNActorsView(frame: CGRect(x: 0, y:storyView.bottom+10, width:kScreenWitdh, height:190))
        return actorsView
    }()
    
    
    let CellIdentifierClass = "commentList"
    lazy var table:UITableView  = {
        let tempTableView = UITableView (frame:CGRect(x: 0, y:actorsView.bottom+10, width: kScreenWitdh, height: 1000))
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor = UIColor.white
        tempTableView.separatorStyle = .singleLine
        tempTableView.tableFooterView = UIView()
        tempTableView.isScrollEnabled = false
        tempTableView.register(LNCommentCell.self, forCellReuseIdentifier: CellIdentifierClass)
        return tempTableView
    }()
    
    lazy var scrollview:UIScrollView = {
        let tempScrollview = UIScrollView(frame: CGRect(x:0, y:64, width:kScreenWitdh, height: kScreenHeight-64))
        tempScrollview.showsVerticalScrollIndicator = true
        return tempScrollview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(0xEBEBEB)
        self.title = self.passMovieModel?.tCn
        self.getDetail()
        self.getCommentData()
    }
    
    func getDetail() {
        
        let movieId = self.passMovieModel?.movieId
        let requestUrl:String = String(format: "%@%.0f", KHomeDetailUrl,movieId!)
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request(requestUrl).responseObject { (response: DataResponse<LNHomeDetailModel>) in
            let responseValue = response.result.value
            self.detailModel = responseValue
            if let tempActorsArr = responseValue?.data?.basic?.actors {
                for actor in tempActorsArr {
                self.actorsArr.append(actor)
             }
            }
            if let tempStageImgsArr = responseValue?.data?.basic?.stageImg?.list {
            for stage in tempStageImgsArr {
                self.StageImgsArr.append(stage)
            }
          }
        hud.mode = MBProgressHUDMode.determinate;
        MBProgressHUD .hide(for: self.view, animated: true)
        self.refreshData()
     }
}
    
    func getCommentData() {
        
        let movieId = self.passMovieModel?.movieId
        let requestUrl:String = String(format: "%@%.0f%@", KHotCommentUrl,movieId!,"&pageIndex=1")
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request(requestUrl).responseObject { (response: DataResponse<LNHotCommentModel>) in
            let responseValue = response.result.value
            self.dataArr.removeAll()
            if let Arr = responseValue?.data?.cts {
                for comment in Arr {
                    self.dataArr.append(comment)
                }
            }
            hud.mode = MBProgressHUDMode.determinate;
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
        let indentifier = "LNCommentCell"
        var cell:LNCommentCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?LNCommentCell
        if cell == nil {
            cell =  LNCommentCell(style: .default, reuseIdentifier: indentifier)
        }
        cell.setValueForCell(model: dataArr[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00
    }
    
    
    func refreshData() {
        
        self.view.addSubview(scrollview)
        //影片简介
        scrollview.addSubview(movieItroduceView)
        movieItroduceView.refreshForView(movieModel:passMovieModel!, detailModel:detailModel!)

        //影片剧情
        scrollview.addSubview(storyView)
        storyView.refreshForView(detailModel:detailModel!)

        //演员图片集
        scrollview.addSubview(actorsView)
        actorsView.refreshForView(detailModel: detailModel!)

        //热门评论
        scrollview.addSubview(table)

        scrollview.contentSize = CGSize(width:kScreenWitdh, height:movieItroduceView.height+storyView.height+actorsView.height+table.height+5*10)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
}


