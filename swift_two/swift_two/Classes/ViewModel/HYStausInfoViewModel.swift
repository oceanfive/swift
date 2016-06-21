//
//  HYStausInfoViewModel.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

//MARK: - 这个类中的数组传递不出去，总是出错，因而采用闭包的形式把结果传递出去
class HYStausInfoViewModel: NSObject {


//    static var dataArrary: NSMutableArray! = []
    
//MARK: - 闭包的定义以及初始化，还可以给闭包设置别名
//    var success: (NSData?, NSURLResponse?) -> () = {_,_ in }
//   typealias success = (Int, Int) -> ()

//MARK: - 获取微博数据
//MARK: - 如果设置返回值，第一次为nil？？？？
//MARK: - 这里需要注意闭包的写法和oc的区别：oc中需要给block定义别名，然后把block作为参数传递，swift中不需要定义别名，可以直接把闭包作为参数传递
//MARK: - 这里的参数列表success: (NSData?, NSURLResponse?) -> (), fail: (NSError?) -> ()作为回调
    class func getStatusesInfo(success: (NSData?, NSURLResponse?) -> (), failure: (NSError?) -> ()) {
        
        //获取access_token
        let model: HYAccessTokenModel? = HYAccountTool.getAccount()
        
        if model != nil { //取到access_token值
            
//MARK: - 这里账号工具类的属性access_token为String？需要进行强制解包！这里进行两次强制解包！否则会崩溃
            let urlString = kHome_timelineString + "?" + "access_token=\(model!.access_token!)"
            
            let url = NSURL(string: urlString)
            
            let request = NSURLRequest(URL: url!)
   
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                
                if error == nil && data != nil {
//MARK: - 相应成功，闭包传递参数, 这里是闭包的名称success，然后给闭包传递参数data和response
                   success(data, response)
    
//MARK: - swift中的NSJSONReadingOptions是一个结构体，但是oc中的是一个枚举类型
//MARK: - 这里的方法JSONObjectWithData有肯能 throw，需要用try
//                    let dictData = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.init(rawValue: 0))
//MARK: - 字典通过key值statuses取出来的是一个数组，即字典数组，通过第三方框架把字典数组转为模型数组
//                    let modelArray = HYStatuses.mj_objectArrayWithKeyValuesArray(dictData!["statuses"])
////                    dataArray = modelArray
                    
//MARK: - 这里return会报错？？？？！！！解决方法？？？？？！！！
//MARK: - oc和swift类型转换 用as （）®
//                    let modelone: HYStatuses = modelArray.firstObject! as! (HYStatuses)
//                    
//                    print(modelone.text!)
//                  let dataArrary = modelArray as ([AnyObject])
//                  
//                    print(modelArray)
//                    
//                    print(dataArrary)
//                    print(response)
                
                
                }else {
                
                    failure(error)
                
                }
//MARK: - 这里resume是个函数，不是属性，所以需要加上（）
            }).resume()

        }else {
        
            print("未取得到access_token值")
        
        }
//MARK: - 这里函数有返回值第一次为nil
//        return dataArray
    }
    
}


