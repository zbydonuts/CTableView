//
//  ViewController.swift
//  CTableView
//
//  Created by 朱　冰一 on 2017/05/24.
//  Copyright © 2017年 zhu.bingyi. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Result
import ReactiveSwift
import SnapKit

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
    
    var tempView:UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(tempView)
        
        tempView.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.right.equalTo(-5)
        
        }
        tempView.layer.cornerRadius = 5
        
        
        tempView.backgroundColor = UIColor(white:1.0, alpha:0.6)
        contentView.backgroundColor = .black
        
        
        tempView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(100)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var data = [String]()
    var tableView:UITableView!
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame:.zero)
        self.view.addSubview(self.tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(300)
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.tableView.register(CTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.black
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(addData), userInfo: nil, repeats: true)
        timer.fire()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addData(){
        
        var random = Int(arc4random_uniform(3))
        var indexList = [IndexPath]()
        var row = 0
        for i in 0...random {
            count += 1
            row += 1
            data.insert(String(describing:count), at: 0)
            let indexPath = IndexPath(row:row, section:0)
            indexList.insert(indexPath, at: 0)
        }
        self.tableView.insertRows(at: indexList, with: .bottom)
        //self.tableView.reloadData()
    }
    
    
    
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CTableViewCell
        cell.nameLabel.text = self.data[indexPath.row]
        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
    
    

}

