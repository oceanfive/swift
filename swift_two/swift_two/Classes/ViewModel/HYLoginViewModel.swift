//
//  HYLoginViewModel.swift
//  swift_two
//
//  Created by ocean on 16/6/18.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYLoginViewModel: NSObject {

    //登录结果状态判断
    enum LoginResult: Int {

       case UserNameError = 0
       case PasswordError
       case Sucess
        
    }
    
    
    class func login(username: String, password: String) ->LoginResult {
        
        //MARK: - 发送网络请求，用户输入的用户名和密码和服务器的保存的进行判断
        //MARK: - 假定用户名称为： one  用户密码为： 123456
    
        if username == "one" && password == "123456" {
        
            return LoginResult.Sucess
        }else if username != "one" {
        
            return LoginResult.UserNameError
        }else {
        
            return LoginResult.PasswordError
        }
        
    
    }
    
    
}
