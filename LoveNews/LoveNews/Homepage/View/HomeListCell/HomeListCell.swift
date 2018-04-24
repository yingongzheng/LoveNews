//
//  HomeListCell.swift
//  LoveNews
//
//  Created by yingz on 2018/4/23.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import Masonry
import Alamofire
import AlamofireImage

class HomeListCell: UITableViewCell {

    var coverImageView:UIImageView?
    var titleCn:UILabel?
    var actorNameLab:UILabel?
    var directorNameLab:UILabel?

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        coverImageView = UIImageView()
        self.addSubview(coverImageView!)
        
        titleCn = UILabel()
        self.addSubview(titleCn!)

        actorNameLab = UILabel()
        self.addSubview(actorNameLab!)

        directorNameLab = UILabel()
        self.addSubview(directorNameLab!)
        
        makeConstraints()
    
    }
    
    func makeConstraints() {
        
        coverImageView!.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(self.mas_left)?.offset()(0)
            make.top.equalTo()(self.mas_top)?.offset()(0)
            make.width.mas_equalTo()(100)
            make.height.mas_equalTo()(100)
        })
        
        titleCn!.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(self.mas_top)?.offset()(13)
            make.width.mas_equalTo()(200)
            make.height.mas_equalTo()(16)
        })

        actorNameLab!.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(titleCn?.mas_bottom)?.offset()(13)
            make.width.mas_equalTo()(100)
            make.height.mas_equalTo()(16)
        })

        directorNameLab!.mas_makeConstraints({ (make : MASConstraintMaker!) in
            make.left.equalTo()(coverImageView?.mas_right)?.offset()(10)
            make.top.equalTo()(actorNameLab?.mas_bottom)?.offset()(13)
            make.width.mas_equalTo()(100)
            make.height.mas_equalTo()(16)
        })
    }
    
    func setValueForCell(model:movieModel){
        self.coverImageView?.af_setImage(withURL: URL(string: model.img)!)
        self.titleCn?.text = String(format: "%@%@","电影名:",model.titleCn!)
        self.actorNameLab?.text = model.actorName1
        self.directorNameLab?.text = model.directorName
    }

}
