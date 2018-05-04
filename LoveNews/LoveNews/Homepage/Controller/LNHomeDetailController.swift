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


class LNHomeDetailController :LNBaseViewController {
    
    var actorsArr:Array<LNActorsModel> = []
    var StageImgsArr:Array<LNStageImgModel> = []
    var detailModel :LNHomeDetailModel?
    var passMovieModel :movieModel?
    
    
    lazy var movieItroduceView: LNMovieItroduceView = {
        let tempMovieItroduceView  = LNMovieItroduceView(frame: CGRect(x: 0, y:64+10, width:kScreenWitdh, height:130))
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(0xEBEBEB)
        self.title = self.passMovieModel?.tCn
        self.getData()
        
    }
    

    func getData() {
        
        let movieId = self.passMovieModel?.movieId
        let requestUrl:String = String(format: "%@%.0f", homeDetailUrl,movieId!)
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
          self.refreshData()
     }
}
    
    
    func refreshData() {
        //影片简介
        self.view.addSubview(movieItroduceView)
        movieItroduceView.refreshForView(movieModel:passMovieModel!, detailModel:detailModel!)
    
        //影片剧情
        self.view.addSubview(storyView)
        storyView.refreshForView(detailModel:detailModel!)
        
        //演员图片集
        self.view.addSubview(actorsView)
        actorsView.refreshForView(detailModel: detailModel!)
        
//        UIView.animate(withDuration: 0.4) {
//            self.storyView.frame.size.height = 200
//        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
}


