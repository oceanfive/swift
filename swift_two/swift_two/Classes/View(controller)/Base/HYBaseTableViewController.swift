//
//  HYBaseTableViewController.swift
//  weibo_swift
//
//  Created by ocean on 16/6/16.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYBaseTableViewController: UITableViewController, HYVistorViewDelegate {

    
    //记录用户登录情况
    private var isLogin: Bool = {
        //MARK: - 进行界面跳转判断，
        let account: HYAccessTokenModel? = HYAccountTool.getAccount()
        if account == nil {
            
            return false
        }else {
            
            return true
        }
        
    }()
    private var vistorView: HYVistorView?
    
    //MARK: - 在这个方法中实现访客界面（不调用函数super.loadView()）还是已注册用户界面（调用函数super.loadView()）
    //MARK: - 这个方案是可行的，不要被颜色迷惑了自己，
    override func loadView() {
        isLogin ? super.loadView() : loadVistorView()
    }
    
    
    private func loadVistorView(){
        
        vistorView = HYVistorView()
        vistorView?.vistorViewDelegate = self
        view = vistorView
        
        vistorView?.backgroundColor = UIColor.whiteColor()

//MARK: - 因为在HYHomeVC的viewDidLoad函数里面设置了背景颜色为红色，那么这里无论你怎么设置，颜色都是红色的，因为viewDidLoad实在视图加载完毕后界面显示的颜色，可以反过来设置就不一样了
//        myView.backgroundColor = UIColor.redColor()
        
    }
    
    //MARK: - HYVistorViewDelegate
    func registerBtnDidClick() {
        
        print("跳转到注册界面")
        
    }
    
    func loginBtnDidClick() {
   
        //MARK: - 弹出授权登录界面
        let oauthVC: HYNavigationViewController = HYNavigationViewController(rootViewController: HYOAuthViewController())
        
        presentViewController(oauthVC, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
