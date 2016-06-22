//
//  HYStatuses.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit


class HYStatuses: NSObject {
    
    //微博创建时间 -- Optional("Tue Jun 21 23:34:28 +0800 2016")
    var created_at: String?
    
    //字符串型的微博ID
    var idstr: String?
    
    //微博信息内容
    var text: String?
    
    //微博来源 -- Optional("<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>")
    var source: String?
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
