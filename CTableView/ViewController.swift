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
    var shouleFirstAnimate = false
    
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
        //self.tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.black
        self.view.backgroundColor = .white
        
        let timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(addData), userInfo: nil, repeats: true)
        timer.fire()
        
        print("hahaha")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addData() {
        self.tableView.beginUpdates()
        self.data.insert("test", at: 0)
        self.shouleFirstAnimate = true
        self.tableView.insertRows(at: [IndexPath(row:0,section:0)], with: .none)
        self.tableView.endUpdates()
    }
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.data[indexPath.row]
        //cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
            print("animate called")
            cell.transform = cell.transform.translatedBy(x: -cell.frame.width, y: 0)
            
            UIView.animate(withDuration: 2.5, animations: {
                cell.transform = cell.transform.translatedBy(x: cell.frame.width, y: 0)
                cell.backgroundColor = .red
                self.tableView.transform = self.tableView.transform.translatedBy(x: 0, y: -100)
            })
            self.shouleFirstAnimate = false
        }
    }
    
    private func customInsertCell() {
        
    }
    
    

}

