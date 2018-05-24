//
//  LNMallViewController.swift
//  LoveNews
//
//  Created by yingz on 2018/4/17.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import UIKit
import Alamofire
import AlamofireObjectMapper



class LNMallViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var dataArr:Array<LNMallItemModel> = []
    let identifier = "LNMallCollectionViewCell"
    lazy var collectionView :UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 10, y:64+10, width:kScreenWitdh-10*2, height: kScreenHeight-64-10), collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        //设置单元格宽度和高度
        layout.itemSize = CGSize(width:(kScreenWitdh-10*3)/2, height:220)
        collectionView.register(LNMallCollectionViewCell.self, forCellWithReuseIdentifier:identifier)
        collectionView.backgroundColor = UIColor(0xEAEAEA)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(0xEAEAEA)
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.es.addPullToRefresh {
            [weak self] in
            self?.getData()
            self?.collectionView.es.stopPullToRefresh(ignoreDate: true)
        }
        collectionView.es.startPullToRefresh()
        
    }
    
    func getData() {
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request(KMallUrl).responseObject { (response: DataResponse<LNMallListDetailModel>) in
            let responseValue = response.result.value
            self.dataArr.removeAll()
            //回放
            if let Arr = responseValue?.goodsList {
                for item in Arr {
                    self.dataArr.append(item)
                }
            }
            hud.mode = MBProgressHUDMode.determinate;
            MBProgressHUD .hide(for: self.view, animated: true)
            self.collectionView.reloadData()
            
        }
    }
    
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! LNMallCollectionViewCell
        cell.setValueForCell(model: dataArr[indexPath.row])
        
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let row = indexPath.row
//        print("click \(row)")
//
//        let detailVC = LVVideoDetailController()
//        let videoModel:LNItemModel = dataArr[indexPath.row]
//        detailVC.liveId = videoModel.liveId
//        self.navigationController?.pushViewController(detailVC, animated: true)
//    }

   


}
