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
import Player


class LVVideoDetailController :LNBaseViewController,PlayerDelegate,PlayerPlaybackDelegate{
    
    func playerCurrentTimeDidChange(_ player: Player) {

    }
    
    func playerReady(_ player: Player) {
        
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {


    }
    
    func playerPlaybackDidEnd(_ player: Player) {

    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        
    }
    

    var player:Player  = Player()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.view.frame = self.view.bounds
        
        self.addChildViewController(self.player)
        self.view.addSubview(self.player.view)
        
        
        self.player.didMove(toParentViewController: self)

        
        let videoUrl: URL = URL(string: "https://vfx.mtime.cn/Video/2018/04/24/mp4/180424224506970938_480.mp4")!
            self.player.url = videoUrl
        
         self.player.playFromBeginning()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }

    
    
 


}


