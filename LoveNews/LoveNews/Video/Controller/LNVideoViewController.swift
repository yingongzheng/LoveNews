//
//  LNVideoViewController.swift
//  LoveNews
//
//  Created by yingz on 2018/4/28.
//  Copyright © 2018年 ygz. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireObjectMapper

class LNVideoViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var dataArr:Array<LNItemModel> = []
    
    lazy var collectionView :UICollectionView  = {
          let layout = UICollectionViewFlowLayout()
          let collectionView = UICollectionView(frame: CGRect(x: 0, y:64+10, width:kScreenWitdh, height: kScreenHeight-64-10), collectionViewLayout: layout)
          layout.minimumInteritemSpacing = 0
          layout.minimumLineSpacing = 10
        //设置单元格宽度和高度
         layout.itemSize = CGSize(width:kScreenWitdh/2, height:185)
         collectionView.register(LNVideoCollectionViewCell.self, forCellWithReuseIdentifier:"LNVideoCollectionViewCell")
          return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
        collectionView.es.addPullToRefresh {
            [weak self] in
            self?.getLiveData()
            self?.collectionView.es.stopPullToRefresh(ignoreDate: true)
        }
        collectionView.es.startPullToRefresh()
       
    }
    
    func getLiveData() {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request(KLiveUrl).responseObject { (response: DataResponse<LNVideoListDetailModel>) in
            let responseValue = response.result.value
            self.dataArr.removeAll()
            //回放
            if let Arr = responseValue?.data?.wonderVods {
                for item in Arr {
                    self.dataArr.append(item)
                }
            }
            hud.mode = MBProgressHUDMode.determinate;
            MBProgressHUD .hide(for: self.view, animated: true)
            self.collectionView.reloadData()
            
        }
    }
    
    // MARK: 代理
    //每个区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    //分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    
    //自定义cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LNVideoCollectionViewCell", for: indexPath) as! LNVideoCollectionViewCell
        cell.setValueForCell(model: dataArr[indexPath.row])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        print("click \(row)")
        
        let detailVC = LVVideoDetailController()
        let videoModel:LNItemModel = dataArr[indexPath.row]
        detailVC.liveId = videoModel.liveId
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
