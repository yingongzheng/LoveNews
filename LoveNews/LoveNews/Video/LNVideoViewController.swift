//
//  LNVideoViewController.swift
//  LoveNews
//
//  Created by yingz on 2018/4/28.
//  Copyright © 2018年 ygz. All rights reserved.
//


import UIKit

class LNVideoViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    //声明存放字符串的数组
    var nowClassName = [String]()
    
    lazy var collectionView :UICollectionView  = {
          let layout = UICollectionViewFlowLayout()
          let collectionView = UICollectionView(frame: CGRect(x: 0, y:64, width:kScreenWitdh, height: kScreenHeight-64), collectionViewLayout: layout)
          layout.minimumInteritemSpacing = 10
          layout.minimumLineSpacing = 10
        //设置单元格宽度和高度
         layout.itemSize = CGSize(width:(kScreenWitdh-10)/2, height:100)
          collectionView.register(LNVideoCollectionViewCell.self, forCellWithReuseIdentifier:"LNVideoCollectionViewCell")
          return collectionView
    }()
    
    //添加数据
    private func saveData() {
        nowClassName += ["A-1","A-2","A-3","A-4","A-5","A-6","A-7","A-8","A-9","A-10","A-11"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.saveData()
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
       
    }
    
    
    // MARK: 代理
    //每个区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowClassName.count
    }
    
    //分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    
    //自定义cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LNVideoCollectionViewCell", for: indexPath) as! LNVideoCollectionViewCell
        cell.backgroundColor = UIColor.red
        cell.label.text = nowClassName[indexPath.item]
        return cell
    }
    

}
