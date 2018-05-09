//
//  LVVideoDetailController.swift
//  LoveNews
//
//  Created by yingz on 2018/5/7.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import VGPlayer
import SnapKit


class LVVideoDetailController :LNBaseViewController,UITableViewDelegate,UITableViewDataSource
                                ,LNVideosViewDelegate{
   

    var player = VGPlayer()
    var dataArr:Array<LNVideoItmeModel> = []
    var liveId:Double = 0
    let CellIdentifierClass = "LNVideoDetailCell"
    
    lazy var table:UITableView  = {
        let tempTableView = UITableView()
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor = UIColor.white
        tempTableView.separatorStyle = .singleLine
        tempTableView.tableFooterView = UIView()
        tempTableView.register(LNVideoDetailCell.self, forCellReuseIdentifier: CellIdentifierClass)
        return tempTableView
    }()
    
    lazy var videosView:LNVideosView = {
        let videosView  = LNVideosView()
        return videosView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initPlayer()
        
    }
    
    
    func initPlayer () {
        
        view.addSubview(self.player.displayView)
        
        self.player.delegate = self
        self.player.displayView.delegate = self
       
        self.view.addSubview(videosView)
//        self.view.addSubview(table)
        videosView.delegate = self
        makeConstraints()
        getVideoDetail()
    }
    
    func passModel(model:LNVideoItmeModel) {
        self.playVideo(model)
    }
    
    func playVideo(_ model:LNVideoItmeModel)  {
        
        let url = URL(string: model.url!)!
        self.player.replaceVideo(url)
        self.player.displayView.titleLabel.text = model.title
        self.player.play()
    }
    
    
    func makeConstraints() {
        
        player.displayView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.height.equalTo(self.view.snp.width).multipliedBy(3.0/4.0)
        }
        
        videosView.snp.makeConstraints { (make) in
            make.top.equalTo(self.player.displayView.snp.bottom).offset(10)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.width.equalTo(kScreenWitdh)
            make.bottom.equalTo(130)
        }
        
//        table.snp.makeConstraints { (make) in
//            make.top.equalTo(videosView.snp.bottom).offset(10)
//            make.left.equalTo(self.view.snp.left).offset(0)
//            make.width.equalTo(kScreenWitdh)
//            make.bottom.equalTo(self.view.snp.bottom)
//        }
        
    }
    
    
    func getVideoDetail() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let url = "https://live-api-m.mtime.cn/live/detail?clientId=iOS_25df2c6a3aed4b73a58a7c03689d5780_580&liveId=757&locationId=290"
        Alamofire.request(url).responseObject { (response: DataResponse<LNVideoDetailModel>) in
            let responseValue = response.result.value
            self.dataArr.removeAll()
            //视频集
            if let Arr = responseValue?.data?.video {
                for item in Arr {
                    self.dataArr.append(item)
                }
            }
            hud.mode = MBProgressHUDMode.determinate;
            MBProgressHUD .hide(for: self.view, animated: true)
//            self.table.reloadData()
            self.refreshData(self.dataArr)

        }
    }
    
    
    func refreshData(_ datas:Array<LNVideoItmeModel>) {
        //视频集
        videosView.refreshForView(datas:dataArr)
       //默认播放第一个视频
        if !datas.isEmpty {
            let videoModel = datas[0]
            self.playVideo(videoModel)
        }
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell:LNVideoDetailCell! = tableView.dequeueReusableCell(withIdentifier: CellIdentifierClass)as?LNVideoDetailCell
        if cell == nil {
            cell =  LNVideoDetailCell(style: .default, reuseIdentifier: CellIdentifierClass)
        }
        cell.setValueForCell(model: dataArr[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.00
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        self.player.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.tabBarController?.tabBar.isHidden = false
        self.player.pause()
    }
    
}



extension LVVideoDetailController: VGPlayerDelegate {
    func vgPlayer(_ player: VGPlayer, playerFailed error: VGPlayerError) {
        print(error)
    }
    func vgPlayer(_ player: VGPlayer, stateDidChange state: VGPlayerState) {
        print("player State ",state)
    }
    func vgPlayer(_ player: VGPlayer, bufferStateDidChange state: VGPlayerBufferstate) {
        print("buffer State", state)
    }
    
}

extension LVVideoDetailController: VGPlayerViewDelegate {
    
    func vgPlayerView(_ playerView: VGPlayerView, willFullscreen fullscreen: Bool) {
        
    }
    func vgPlayerView(didTappedClose playerView: VGPlayerView) {
        if playerView.isFullScreen {
            playerView.exitFullscreen()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}


