//
//  HYAccountTool.swift
//  weibo_swift
//
//  Created by ocean on 16/6/17.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit
import MJExtension

class HYAccountTool: NSObject {

    
//    var fileName: String?
    
    
    //MARK: - 数据存储，第一种，先把字典写入文件，然后读取的时候转换为模型；第二种，先把字典转为模型，在归档存入文件
    class func saveAccount(account: [String: AnyObject]){
    
        //MARK: - swift中的字符串转为oc字符串
        let filePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! as (NSString)
        
        let fileName = filePath.stringByAppendingPathComponent("account.plist")
    
        //MARK: - swift中的字典转换为oc中的字典
        let temp = account as (NSDictionary)
        
        temp.writeToFile(fileName, atomically: true)
        
    }
    
    
    class func getAccount() ->HYAccessTokenModel?{
        
        //MARK: - swift中的字符串转为oc字符串
        let filePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! as (NSString)
        
        let fileName = filePath.stringByAppendingPathComponent("account.plist")
        
        //MARK: - 这里需要加上取出来的数据是否为空的判断,-----不用加在这里，对返回结果进行判断就可以了
        return HYAccessTokenModel.mj_objectWithFile(fileName)
        
    }
    
}
