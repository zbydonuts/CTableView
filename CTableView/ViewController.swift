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
        self.view.backgroundColor = .blue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addData(){
        
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
        //cell.nameLabel.text = self.data[indexPath.row]
        //cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
    
    

}

