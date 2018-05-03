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
    
    lazy var storyView:UIView  = {
        let tempStoryView = UIView (frame:CGRect(x: 0, y:64+130+10+10, width:kScreenWitdh, height:100))
        tempStoryView.backgroundColor = UIColor.white
        return tempStoryView
    }()
    
    
    lazy var storyLab:UILabel  = {
        let storyLab = UILabel(frame: CGRect(x: 5, y:5, width:kScreenWitdh-5*2, height:90))
        storyLab.textColor = UIColor(0x4c4c4c)
        storyLab.numberOfLines = 8
        storyLab.font = UIFont.systemFont(ofSize: 14)
        return storyLab
    }()
    
    lazy var movieItroduceView: LNMovieItroduceView = {
         let tempMovieItroduceView  = LNMovieItroduceView(frame: CGRect(x: 0, y:64+10, width:kScreenWitdh, height:130))
        return tempMovieItroduceView
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
        storyLab.text = self.detailModel?.data?.basic?.story
        
        //影片剧情
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


