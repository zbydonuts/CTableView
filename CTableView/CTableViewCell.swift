//
//  View.swift
//  CTableView
//
//  Created by 朱　冰一 on 2017/05/24.
//  Copyright © 2017年 zhu.bingyi. All rights reserved.
//
import SnapKit
import UIKit

class CTableViewCell:UITableViewCell {
    
    var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    var commentLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    var bgView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(white:1.0, alpha:0.8)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class GTableViewCell:UITableViewCell {
    
    var avatarView:UIView = {
        let view = UIView()
        return view
    }()
    
    var nameLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    var commentLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
























