//
//  HYHomeVC.swift
//  weibo_swift
//
//  Created by ocean on 16/6/15.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit


class HYHomeVC: HYBaseTableViewController {

    var dataArray: [HYStatuses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HYStausInfoViewModel.getStatusesInfo({ (data: NSData?, response: NSURLResponse?) -> () in
            print("成功")
            
            let tempDataArr = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.init(rawValue: 0))
            
            let modelArray = HYStatuses.mj_objectArrayWithKeyValuesArray(tempDataArr!["statuses"])
            
//            print(modelArray)
//MARK: -  Reference to property 'dataArray' in closure requires explicit 'self.' to make capture semantics explicit 在闭包内访问属性，需要添加self
            self.dataArray = modelArray as! [HYStatuses]
 
            print(self.dataArray)
            
            }) { (error: NSError?) -> () in
                
                print("失败")
                
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataArray.count
    }

 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier: String = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)

        if cell == nil {
        
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
        }
        
        cell!.textLabel?.text = "hahahhaha"
        cell!.detailTextLabel?.text = "hehhehehhe"

        return cell!
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
