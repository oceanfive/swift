//
//  HYHomeVC.swift
//  weibo_swift
//
//  Created by ocean on 16/6/15.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYHomeVC: HYBaseTableViewController {
//MARK: - 实例化数组 --- 两种方法！！
    var dataArray = [HYStatusesFrame]()
    
//    lazy var dataArray: NSMutableArray = {
//    
//        var tempArray = NSMutableArray()
//        
//        return tempArray
//        
//    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//MARK: - 第三方发送网络请求

//MARK: - 封装的网络请求函数
        HYStausInfoViewModel.getStatusesInfo({ (data: NSData?, response: NSURLResponse?) -> () in
            print("成功")
            
            
            let tempDataArr = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.init(rawValue: 0))
            
            let modelArray = HYStatuses.mj_objectArrayWithKeyValuesArray(tempDataArr!["statuses"])
            
            let temp = modelArray as! [HYStatuses]
            
            let statusesFrame = self.statusFrameArrayWithStatusArray(temp)
            
            self.dataArray += statusesFrame
            
            
            
//MARK: -  Reference to property 'dataArray' in closure requires explicit 'self.' to make capture semantics explicit 在闭包内访问属性，需要添加self
//MARK: - 实例化数组方法一！
//            self.dataArray.appendContentsOf(modelArray as! [HYStatuses])
//MARK: - 实例化数组方法二
//            self.dataArray.addObjectsFromArray(modelArray as [AnyObject])
            
//MARK: - 千万不要忘记刷新tableView，否则无法显示！！！！!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            self.tableView.reloadData()

            
            }) { (error: NSError?) -> () in
                
                print("失败")
                
        }
        
     
    }
    
    
//MARK: - 数据模型转为Frame数据模型
    func statusFrameArrayWithStatusArray(statusArray: [HYStatuses]) -> [HYStatusesFrame]{
    
        var statusesFrameArray = [HYStatusesFrame]()
        for temp in statusArray {
            
            let statusFrame = HYStatusesFrame()
            statusFrame.status = temp
            statusesFrameArray.append(statusFrame)
   
        }
        
        return statusesFrameArray

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.dataArray.count
    }

 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = HYHomeTableCell.homeTableCell(tableView)
        
        let frameModel = dataArray[indexPath.row]
        
        cell.statusFrame = frameModel
        
//        cell.detailTextLabel?.text = "963963"
        
        return cell
      
    }
  

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let frameModel = dataArray[indexPath.row]
        
//        print(frameModel.cellHeight)
        
        return frameModel.cellHeight!
        
    }
    

}
