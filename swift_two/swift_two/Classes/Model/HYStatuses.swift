//
//  HYStatuses.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit


class HYStatuses: NSObject {
    
    //字符串型的微博ID
    var idstr: String?
    
    //微博信息内容
    var text: String?

    //微博创建时间 -- Optional("Tue Jun 21 23:34:28 +0800 2016")
    var created_at: String?{
    
        didSet(oldValue){
        
            //获取这条微博的日期
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "EEE MMM dd HH:mm:ss z yyyy"
            let tempDate = dateFormatter.dateFromString(created_at!)
            
            //获取当前日期
            let currentDate = NSDate()
            
//            print(currentDate.distanceDate(tempDate!))
//            print("tempDate--\(tempDate!)")
//            print("currentDate--\(currentDate)")
            if ((tempDate?.isThisYear()) != nil) { //今年
            
                if ((tempDate?.isToday()) != nil) { // 今天
                   let timeInterval = currentDate.distanceDate(tempDate!)
                   
                    if timeInterval <= 60 { // 一分钟内   刚刚
                        
                        created_at = "刚刚"
                        
                    }else if timeInterval > 60 && timeInterval <= 60 * 60 { // 一个小时内   6分钟前
//MARK: - 格式化字符串， oc 和 swift相同，都需要使用 format,行不通？？？
                       let second = timeInterval / 60
                        
                       created_at = "\(Int(second))分钟前"
                        
                    }else { // 超过一个小时   2小时前
                    
                        let hour = timeInterval / (60 * 60)
                        created_at = "\(Int(hour))小时前"

                    }
   
                }else if ((tempDate?.isYesterday()) != nil){ // 昨天   昨天 20:12
                    
                    let calendar = NSCalendar.currentCalendar()
                    
//                    let unit = [.Minute, .Hour]
//MARK: - 这里注意oc和siwft日期分离元素的区别  oc |  -- 多项选择  swift 结构体
                    let componets = calendar.components([.Hour , .Minute], fromDate: tempDate!)
                    
                    created_at = "昨天 \(componets.hour):\(componets.minute)"
 
                }else { //  06-20
                
                    let calendar = NSCalendar.currentCalendar()
                    
                    let componets = calendar.components([.Month, .Day], fromDate: tempDate!)
                    
                    created_at = "\(componets.month)-\(componets.day)"

                }
            
            }else {//不是今年 2015-09-20
            
                let calendar = NSCalendar.currentCalendar()
                
                let componets = calendar.components([.Year, .Month, .Day], fromDate: tempDate!)
                
                created_at = "\(componets.year)-\(componets.month)-\(componets.day)"
  
            
            }
 
        }
        
    }
    
    //微博来源 -- Optional("<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>")
    var source: String?{
//MARK: - 如果需要修改属性的值，需要在didSet方法中进行修改
//        willSet(newValue){
////            print("newValue---\(newValue)")
////MARK: - 这里有时候来源为空，需要进行判断， 判断条件为 "" 不是 nil
//            if newValue != "" {
//            
//                let sourceString = newValue as NSString
////MARK: - 这里swift设置失败，转为oc尝试！
//                let rangeBegin = sourceString.rangeOfString(">")
//                
//                let rangeEnd = sourceString.rangeOfString("</")
//                
////                print(rangeBegin)
////                
////                print(rangeEnd)
//                //MARK: - oc和swiftrange初始化对比
//                //            let range = NSMakeRange(rangeBegin?.startIndex as Int , (rangeEnd?.startIndex - rangeBegin?.startIndex) as Int)
//                //            let range = Range.init(start: rangeBegin?.startIndex, end: rangeEnd?.startIndex)
//                let range = NSMakeRange(rangeBegin.location + 1, rangeEnd.location - rangeBegin.location - 1)
////MARK: - Attempting to store to property 'source' within its own willSet, which is about to be overwritten by the new value
//                self.source = sourceString.substringWithRange(range)
//   
////                print("self.source---\(self.source)")
////                print("source--\(source)")
//            }
//        }
        
        didSet(oldValue){
        
            if source != "" {
                
                let sourceString = source! as NSString
                //MARK: - 这里swift设置失败，转为oc尝试！
                let rangeBegin = sourceString.rangeOfString(">")
                
                let rangeEnd = sourceString.rangeOfString("</")
                
                //                print(rangeBegin)
                //
                //                print(rangeEnd)
                //MARK: - oc和swiftrange初始化对比
                //            let range = NSMakeRange(rangeBegin?.startIndex as Int , (rangeEnd?.startIndex - rangeBegin?.startIndex) as Int)
                //            let range = Range.init(start: rangeBegin?.startIndex, end: rangeEnd?.startIndex)
                let range = NSMakeRange(rangeBegin.location + 1, rangeEnd.location - rangeBegin.location - 1)
                //MARK: - Attempting to store to property 'source' within its own willSet, which is about to be overwritten by the new value
                self.source = sourceString.substringWithRange(range)
                
                //                print("self.source---\(self.source)")
                //                print("source--\(source)")
            }

            
//            print(source)
//            print("oldValue---\(oldValue)")
        
        }
        
    }
//MARK: - 这里会崩溃，存储属性使用了get，set，xcode崩溃
//        {
//
//        set(newValue) {
//        
//            let sourceString = newValue
//            
//            let rangeBegin = sourceString.rangeOfString(">")
//            
//            let rangeEnd = sourceString.rangeOfString("</")
////MARK: - oc和swiftrange初始化对比
////            let range = NSMakeRange(rangeBegin?.startIndex as Int , (rangeEnd?.startIndex - rangeBegin?.startIndex) as Int)
////            let range = Range.init(start: rangeBegin?.startIndex, end: rangeEnd?.startIndex)
//            let range = Range(start: rangeBegin?.startIndex as! Int, end: rangeEnd?.startIndex as! Int)
//            
//            self.source = sourceString.su
//            
//        }
//    
//    }
    
    
//MARK: - 记住！所有的存储属性都是要给定初始值的，对于类的话初始值就是在这个类之后加上一个问号
    //微博作者的用户信息字段 详细
    var user: HYUser?
    
    //被转发的原微博信息字段，当该微博为转发微博时返回 详细
    var retweeted_status: HYStatuses?
//    var retweeted_status = HYStatuses.self
    
    //转发数
    var reposts_count: Int?
    
    //评论数
    var comments_count: Int?
    
    //表态数
    var attitudes_count: Int?
    
    //微博配图地址，多图时返回多图链接。无配图返回“[]”  数组里面都是HYPhoto模型
    var pic_urls: [AnyObject] = []
    
//MARK: - 告诉这个模型中，哪个属性又是一个模型
    override static func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        
        return ["pic_urls": HYPhoto.classForCoder()]
        
    }
    
//    func statusesWithDict(dict: [String : AnyObject]) -> HYStatuses {
//    
//        let model = HYStatuses()
//        
//         model.created_at = dict["created_at"] as? String
//         model.idstr = dict["idstr"] as? String
//         model.text = dict["text"] as? String
//         model.source = dict["source"] as? String
//         model.reposts_count = dict["reposts_count"] as? Int
//         model.comments_count = dict["comments_count"] as? Int
//         model.attitudes_count = dict["attitudes_count"] as? Int
//       
//        
//        model.user = HYUser().userWithDict((dict["user"] as? [String: String])!)
////        model.retweeted_status =
//        
////        let tempDict = dict["pic_urls"] as? Array
////        
////        model.pic_urls[0] = HYPhoto().photoWithDict(tempDict[0])
//        
//        return model
//    
//    
//    }

}
