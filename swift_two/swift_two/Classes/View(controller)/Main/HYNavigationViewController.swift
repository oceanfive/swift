//
//  HYNavigationViewController.swift
//  weibo_swift
//
//  Created by ocean on 16/6/15.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYNavigationViewController: UINavigationController {

    
    //MARK: - 设置主题
    override class func initialize(){
        
        let apperanceOfNavigationBar: UINavigationBar = UINavigationBar.appearance()
        apperanceOfNavigationBar.titleTextAttributes = [NSFontAttributeName: kNaviBarTitleFont, NSForegroundColorAttributeName: kNaviBarTitleColor]
    
        let appearanceOfNavigationItem = UIBarButtonItem.appearance()
        appearanceOfNavigationItem.setTitleTextAttributes([NSFontAttributeName: kNaviItemTitleFontOfNormal, NSForegroundColorAttributeName: kNaviItemTitleColorOfNormal], forState: .Normal)
        appearanceOfNavigationItem.setTitleTextAttributes([NSFontAttributeName: kNaviItemTitleFontOfHighlighted, NSForegroundColorAttributeName: kNaviItemTitleColorOfHighlighted], forState: .Highlighted)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
     //MARK: - Navigation

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    
//        print("----")
//    
//    
//    }
    

}
