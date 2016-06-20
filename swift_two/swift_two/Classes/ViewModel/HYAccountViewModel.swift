//
//  HYAccountViewModel.swift
//  swift_two
//
//  Created by ocean on 16/6/18.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit
import AFNetworking

class HYAccountViewModel: NSObject {

    //获取accessToken - 使用第三方框架
    class func getAccessToken(code: String){
        
        let manager = AFHTTPSessionManager()
        //MARK: - 如果AFN提示不接受文件类型，那么需要自己手动添加
        manager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        let dict = ["client_id": client_id, "client_secret": client_secret, "grant_type": grant_type, "code": code, "redirect_uri": redirect_uri]
        
        manager.POST(accessTokenURLString, parameters: dict, success: { (task, response) -> Void in
            
            //保存用户账号信息
            HYAccountTool.saveAccount(response! as! [String : AnyObject])

//MARK: - 设置用户登录标记为真
            HYLoginViewController.loginFlag = true
            
            //切换窗口到新特性窗口
            let keyWindow = UIApplication.sharedApplication().keyWindow
            
            keyWindow?.rootViewController = HYNewFeatureViewController()
     
            
            //MARK: - 用MJ第三方框架转模型时，如果为nil会崩溃，这时需要添加一个判断，是否为空的判断
            /*
            Optional({
                "access_token" = "2.00dBcfVDtOFu4E6c7ef71c44GliulB";
                "expires_in" = 157679999;
                "remind_in" = 157679999;
                uid = 3216382533;
            })
            */
            }) { (errorTask, error) -> Void in
                
                print("error---\(error)")
                
        }
        
    }
 
}
