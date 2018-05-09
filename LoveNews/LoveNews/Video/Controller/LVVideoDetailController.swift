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


class LVVideoDetailController :LNBaseViewController{
   

    var player = VGPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let url = URL(string: "https://vfx.mtime.cn/Video/2018/04/24/mp4/180424224506970938_480.mp4")!
        self.player.replaceVideo(url)
        view.addSubview(self.player.displayView)
        
        self.player.play()
        self.player.delegate = self
        self.player.displayView.delegate = self
        self.player.displayView.titleLabel.text = "China NO.1"
        self.player.displayView.snp.makeConstraints { [weak self] (make) in
            guard let strongSelf = self else { return }
            make.top.equalTo(strongSelf.view.snp.top)
            make.left.equalTo(strongSelf.view.snp.left)
            make.right.equalTo(strongSelf.view.snp.right)
            make.height.equalTo(strongSelf.view.snp.width).multipliedBy(3.0/4.0)
        }
        
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


