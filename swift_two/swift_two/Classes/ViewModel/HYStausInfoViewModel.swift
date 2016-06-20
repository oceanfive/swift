//
//  HYStausInfoViewModel.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit
import AFNetworking

//MARK: - 这个类中的数组传递不出去，总是出错，因而采用闭包的形式把结果传递出去
class HYStausInfoViewModel: NSObject {
    
//    static var dataArrary: NSMutableArray! = []
    
//MARK: - 闭包的定义以及初始化，还可以给闭包设置别名
//    var success: (NSData?, NSURLResponse?) -> () = {_,_ in }
//   typealias success = (Int, Int) -> ()

    
    
    
//    var failed: (error: NSError?) -> ()
//MARK: - 获取微博数据
//MARK: - 如果设置返回值，第一次为nil？？？？
//MARK: - 这里需要注意闭包的写法和oc的区别：oc中需要给block定义别名，然后把block作为参数传递，swift中不需要定义别名，可以直接把闭包作为参数传递
//MARK: - 这里的参数列表success: (NSData?, NSURLResponse?) -> (), fail: (NSError?) -> ()作为回调
    class func getStatusesInfo(success: (NSData?, NSURLResponse?) -> (), failure: (NSError?) -> ()) {
   
//        var dataArray: NSMutableArray!
        
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

/*
//            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
//
//
//            })

//            let manager = AFHTTPSessionManager()
//
//            let paramter: Dictionary = ["access_token": model!.access_token]

///Users/ocean/Desktop/项目/weibo_swift_two/swift_two/swift_two/Classes/ViewModel/HYStausInfoViewModel.swift:24:59: Cannot convert value of type '[String : String?]' to expected argument type 'AnyObject?'
//            manager.GET(kHome_timelineString, parameters: paramter, success: { (dataTask: NSURLSessionDataTask, data: AnyObject?) -> Void in
//
//
//                }, failure: { (_, error: NSError) -> Void in
//
//
//            })
//

*/

/*
Optional({
ad =     (
);
advertises =     (
);
"has_unread" = 0;
hasvisible = 0;
interval = 2000;
"max_id" = 3988503202780029;
"next_cursor" = 3988503202780029;
"previous_cursor" = 0;
"since_id" = 3988514788225010;
statuses =     (
{
"attitudes_count" = 0;
"biz_feature" = 0;
cardid = "star_067";
"comments_count" = 0;
"created_at" = "Mon Jun 20 18:44:51 +0800 2016";
"darwin_tags" =             (
);
favorited = 0;
geo = "<null>";
"hot_weibo_tags" =             (
);
id = 3988514788225010;
idstr = 3988514788225010;
"in_reply_to_screen_name" = "";
"in_reply_to_status_id" = "";
"in_reply_to_user_id" = "";
isLongText = 0;
mid = 3988514788225010;
mlevel = 0;
"pic_urls" =             (
);
"positive_recom_flag" = 0;
"reposts_count" = 0;
"retweeted_status" =             {
annotations =                 (
{
"client_mblogid" = "iPhone-EC20D7A3-2475-4D44-A3A2-4E27E3B901E7";
shooting = 1;
},
{
"mapi_request" = 1;
}
);
"attitudes_count" = 0;
"biz_feature" = 0;
cardid = "star_067";
"comments_count" = 2;
"created_at" = "Mon Jun 20 18:42:47 +0800 2016";
"darwin_tags" =                 (
);
favorited = 0;
geo = "<null>";
"hot_weibo_tags" =                 (
);
id = 3988514272128892;
idstr = 3988514272128892;
"in_reply_to_screen_name" = "";
"in_reply_to_status_id" = "";
"in_reply_to_user_id" = "";
isLongText = 0;
mid = 3988514272128892;
mlevel = 0;
"pic_urls" =                 (
);
"positive_recom_flag" = 0;
"reposts_count" = 2;
source = "<a href=\"http://app.weibo.com/t/feed/5B6hUc\" rel=\"nofollow\">iPhone 6s Plus</a>";
"source_allowclick" = 0;
"source_type" = 1;
text = "\U8fd9\U4e2a\U5723\U57f9\U9732 \U51c9\U7740\U559d \U5e38\U6e29\U90fd\U884c \U6211\U7528\U5b83\U6ce1\U4e86\U4e00\U58f6\U8336 \U5a18\U7684\U628a\U6211\U8336\U53f6\U6bc1\U4e86";
textLength = 60;
"text_tag_tips" =                 (
);
truncated = 0;
user =                 {
"ability_tags" = "\U5f00\U53d1\U8005,\U4e92\U8054\U7f51\U6280\U672f,\U82f9\U679c";
"allow_all_act_msg" = 0;
"allow_all_comment" = 0;
"avatar_hd" = "http://tva1.sinaimg.cn/crop.0.0.640.640.1024/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"avatar_large" = "http://tva1.sinaimg.cn/crop.0.0.640.640.180/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"bi_followers_count" = 856;
"block_app" = 1;
"block_word" = 1;
cardid = "star_067";
city = 8;
class = 1;
"cover_image" = "http://ww4.sinaimg.cn/crop.0.0.920.300/6645b821gw1eyeotsl2xbj20pk08cn08.jpg";
"cover_image_phone" = "http://ww4.sinaimg.cn/crop.0.0.640.640.640/6ce2240djw1e8iktk4ohij20hs0hsmz6.jpg";
"created_at" = "Tue Oct 12 11:01:46 +0800 2010";
"credit_score" = 80;
description = "\U4e0a\U7684\U5385\U5802\Uff0c\U4e0b\U7684\U53a8\U623f\Uff0c\U5199\U7684\U4e86\U4ee3\U7801\Uff0c\U4fee\U7684\U4e86\U6ce2\U7bb1\Uff0c\U641e\U5f97\U5b9aMac\Uff0c\U6ce1\U5f97\U4e86\U59d1\U5a18\U3002\U53e6\U5916\Uff0c\U5c4c\U4e1d\Uff0cAndroid\Uff0c\U5c0f\U7c73\Uff0c\U9b45\U65cf\U9524\U5b50\U90fd\U662f\U81ed\U50bb\U903c\Uff01\U786c\U6838\U6b7b\U5fe0\Uff0c\U53cd\U5c4c\U4e1d\U4eba\U58eb\U3002";
domain = ibuick;
"favourites_count" = 196;
"follow_me" = 0;
"followers_count" = 105424;
following = 1;
"friends_count" = 974;
gender = m;
"geo_enabled" = 0;
id = 1715845153;
idstr = 1715845153;
lang = en;
location = "\U5317\U4eac \U6d77\U6dc0\U533a";
mbrank = 6;
mbtype = 11;
name = ibuick;
"online_status" = 0;
"pagefriends_count" = 2;
"profile_image_url" = "http://tva1.sinaimg.cn/crop.0.0.640.640.50/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"profile_url" = ibuick;
province = 11;
ptype = 0;
remark = "";
"screen_name" = ibuick;
star = 0;
"statuses_count" = 95534;
urank = 39;
url = "http://ibuick.com";
"user_ability" = 12;
verified = 1;
"verified_contact_email" = "";
"verified_contact_mobile" = "";
"verified_contact_name" = "";
"verified_level" = 2;
"verified_reason" = "\U300aOS X Mountain Lion\U9ad8\U624b\U8fdb\U9636\U300b\U300a\U82f9\U679c\U8fbe\U4ebaMacOSX\U73a9\U5bb6\U79d8\U6280\U300b\U4f5c\U8005";
"verified_reason_modified" = "";
"verified_reason_url" = "";
"verified_source" = "";
"verified_source_url" = "";
"verified_state" = 0;
"verified_trade" = 1178;
"verified_type" = 0;
"verified_type_ext" = 0;
weihao = "";
};
userType = 0;
visible =                 {
"list_id" = 0;
type = 0;
};
};
rid = "0_0_1_2666870444037110862";
source = "<a href=\"http://weibo.com/\" rel=\"nofollow\">\U5fae\U535a weibo.com</a>";
"source_allowclick" = 0;
"source_type" = 1;
text = "Reply@Devil\U4e0dcute\U4e86:\U716e\U5f00\U4e86\Uff0c\U4e8c\U6c27\U5316\U78b3\U80af\U5b9a\U90fd\U98de\U4e86\Uff0c\U6ca1\U6709\U4e8c\U6c27\U5316\U78b3\U52a0\U6301\Uff0c\U8fd9\U5723\U57f9\U9732\U6ce1\U8336\Uff0c\U6bd4\U519c\U592b\U5c71\U6cc9\U4e2d\U95f4\U9694\U7740100\U591a\U4e2a\U4f9d\U4e91\Uff0c //@Devil\U4e0dcute\U4e86:\U559c\U95fb\U4e50\U89c1\U554a\Ud83d\Ude02\U6c14\U6ce1\U6c34\U4e0d\U662f\U4e0d\U592a\U597d\U6ce1\U8336\U5417";
"text_tag_tips" =             (
);
truncated = 0;
user =             {
"ability_tags" = "\U5f00\U53d1\U8005,\U4e92\U8054\U7f51\U6280\U672f,\U82f9\U679c";
"allow_all_act_msg" = 0;
"allow_all_comment" = 0;
"avatar_hd" = "http://tva1.sinaimg.cn/crop.0.0.640.640.1024/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"avatar_large" = "http://tva1.sinaimg.cn/crop.0.0.640.640.180/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"bi_followers_count" = 856;
"block_app" = 1;
"block_word" = 1;
cardid = "star_067";
city = 8;
class = 1;
"cover_image" = "http://ww4.sinaimg.cn/crop.0.0.920.300/6645b821gw1eyeotsl2xbj20pk08cn08.jpg";
"cover_image_phone" = "http://ww4.sinaimg.cn/crop.0.0.640.640.640/6ce2240djw1e8iktk4ohij20hs0hsmz6.jpg";
"created_at" = "Tue Oct 12 11:01:46 +0800 2010";
"credit_score" = 80;
description = "\U4e0a\U7684\U5385\U5802\Uff0c\U4e0b\U7684\U53a8\U623f\Uff0c\U5199\U7684\U4e86\U4ee3\U7801\Uff0c\U4fee\U7684\U4e86\U6ce2\U7bb1\Uff0c\U641e\U5f97\U5b9aMac\Uff0c\U6ce1\U5f97\U4e86\U59d1\U5a18\U3002\U53e6\U5916\Uff0c\U5c4c\U4e1d\Uff0cAndroid\Uff0c\U5c0f\U7c73\Uff0c\U9b45\U65cf\U9524\U5b50\U90fd\U662f\U81ed\U50bb\U903c\Uff01\U786c\U6838\U6b7b\U5fe0\Uff0c\U53cd\U5c4c\U4e1d\U4eba\U58eb\U3002";
domain = ibuick;
"favourites_count" = 196;
"follow_me" = 0;
"followers_count" = 105424;
following = 1;
"friends_count" = 974;
gender = m;Optional({
ad =     (
);
advertises =     (
);
"has_unread" = 0;
hasvisible = 0;
interval = 2000;
"max_id" = 3988503202780029;
"next_cursor" = 3988503202780029;
"previous_cursor" = 0;
"since_id" = 3988514788225010;
statuses =     (
{
"attitudes_count" = 0;
"biz_feature" = 0;
cardid = "star_067";
"comments_count" = 0;
"created_at" = "Mon Jun 20 18:44:51 +0800 2016";
"darwin_tags" =             (
);
favorited = 0;
geo = "<null>";
"hot_weibo_tags" =             (
);
id = 3988514788225010;
idstr = 3988514788225010;
"in_reply_to_screen_name" = "";
"in_reply_to_status_id" = "";
"in_reply_to_user_id" = "";
isLongText = 0;
mid = 3988514788225010;
mlevel = 0;
"pic_urls" =             (
);
"positive_recom_flag" = 0;
"reposts_count" = 0;
"retweeted_status" =             {
annotations =                 (
{
"client_mblogid" = "iPhone-EC20D7A3-2475-4D44-A3A2-4E27E3B901E7";
shooting = 1;
},
{
"mapi_request" = 1;
}
);
"attitudes_count" = 0;
"biz_feature" = 0;
cardid = "star_067";
"comments_count" = 2;
"created_at" = "Mon Jun 20 18:42:47 +0800 2016";
"darwin_tags" =                 (
);
favorited = 0;
geo = "<null>";
"hot_weibo_tags" =                 (
);
id = 3988514272128892;
idstr = 3988514272128892;
"in_reply_to_screen_name" = "";
"in_reply_to_status_id" = "";
"in_reply_to_user_id" = "";
isLongText = 0;
mid = 3988514272128892;
mlevel = 0;
"pic_urls" =                 (
);
"positive_recom_flag" = 0;
"reposts_count" = 2;
source = "<a href=\"http://app.weibo.com/t/feed/5B6hUc\" rel=\"nofollow\">iPhone 6s Plus</a>";
"source_allowclick" = 0;
"source_type" = 1;
text = "\U8fd9\U4e2a\U5723\U57f9\U9732 \U51c9\U7740\U559d \U5e38\U6e29\U90fd\U884c \U6211\U7528\U5b83\U6ce1\U4e86\U4e00\U58f6\U8336 \U5a18\U7684\U628a\U6211\U8336\U53f6\U6bc1\U4e86";
textLength = 60;
"text_tag_tips" =                 (
);
truncated = 0;
user =                 {
"ability_tags" = "\U5f00\U53d1\U8005,\U4e92\U8054\U7f51\U6280\U672f,\U82f9\U679c";
"allow_all_act_msg" = 0;
"allow_all_comment" = 0;
"avatar_hd" = "http://tva1.sinaimg.cn/crop.0.0.640.640.1024/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"avatar_large" = "http://tva1.sinaimg.cn/crop.0.0.640.640.180/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"bi_followers_count" = 856;
"block_app" = 1;
"block_word" = 1;
cardid = "star_067";
city = 8;
class = 1;
"cover_image" = "http://ww4.sinaimg.cn/crop.0.0.920.300/6645b821gw1eyeotsl2xbj20pk08cn08.jpg";
"cover_image_phone" = "http://ww4.sinaimg.cn/crop.0.0.640.640.640/6ce2240djw1e8iktk4ohij20hs0hsmz6.jpg";
"created_at" = "Tue Oct 12 11:01:46 +0800 2010";
"credit_score" = 80;
description = "\U4e0a\U7684\U5385\U5802\Uff0c\U4e0b\U7684\U53a8\U623f\Uff0c\U5199\U7684\U4e86\U4ee3\U7801\Uff0c\U4fee\U7684\U4e86\U6ce2\U7bb1\Uff0c\U641e\U5f97\U5b9aMac\Uff0c\U6ce1\U5f97\U4e86\U59d1\U5a18\U3002\U53e6\U5916\Uff0c\U5c4c\U4e1d\Uff0cAndroid\Uff0c\U5c0f\U7c73\Uff0c\U9b45\U65cf\U9524\U5b50\U90fd\U662f\U81ed\U50bb\U903c\Uff01\U786c\U6838\U6b7b\U5fe0\Uff0c\U53cd\U5c4c\U4e1d\U4eba\U58eb\U3002";
domain = ibuick;
"favourites_count" = 196;
"follow_me" = 0;
"followers_count" = 105424;
following = 1;
"friends_count" = 974;
gender = m;
"geo_enabled" = 0;
id = 1715845153;
idstr = 1715845153;
lang = en;
location = "\U5317\U4eac \U6d77\U6dc0\U533a";
mbrank = 6;
mbtype = 11;
name = ibuick;
"online_status" = 0;
"pagefriends_count" = 2;
"profile_image_url" = "http://tva1.sinaimg.cn/crop.0.0.640.640.50/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"profile_url" = ibuick;
province = 11;
ptype = 0;
remark = "";
"screen_name" = ibuick;
star = 0;
"statuses_count" = 95534;
urank = 39;
url = "http://ibuick.com";
"user_ability" = 12;
verified = 1;
"verified_contact_email" = "";
"verified_contact_mobile" = "";
"verified_contact_name" = "";
"verified_level" = 2;
"verified_reason" = "\U300aOS X Mountain Lion\U9ad8\U624b\U8fdb\U9636\U300b\U300a\U82f9\U679c\U8fbe\U4ebaMacOSX\U73a9\U5bb6\U79d8\U6280\U300b\U4f5c\U8005";
"verified_reason_modified" = "";
"verified_reason_url" = "";
"verified_source" = "";
"verified_source_url" = "";
"verified_state" = 0;
"verified_trade" = 1178;
"verified_type" = 0;
"verified_type_ext" = 0;
weihao = "";
};
userType = 0;
visible =                 {
"list_id" = 0;
type = 0;
};
};
rid = "0_0_1_2666870444037110862";
source = "<a href=\"http://weibo.com/\" rel=\"nofollow\">\U5fae\U535a weibo.com</a>";
"source_allowclick" = 0;
"source_type" = 1;
text = "Reply@Devil\U4e0dcute\U4e86:\U716e\U5f00\U4e86\Uff0c\U4e8c\U6c27\U5316\U78b3\U80af\U5b9a\U90fd\U98de\U4e86\Uff0c\U6ca1\U6709\U4e8c\U6c27\U5316\U78b3\U52a0\U6301\Uff0c\U8fd9\U5723\U57f9\U9732\U6ce1\U8336\Uff0c\U6bd4\U519c\U592b\U5c71\U6cc9\U4e2d\U95f4\U9694\U7740100\U591a\U4e2a\U4f9d\U4e91\Uff0c //@Devil\U4e0dcute\U4e86:\U559c\U95fb\U4e50\U89c1\U554a\Ud83d\Ude02\U6c14\U6ce1\U6c34\U4e0d\U662f\U4e0d\U592a\U597d\U6ce1\U8336\U5417";
"text_tag_tips" =             (
);
truncated = 0;
user =             {
"ability_tags" = "\U5f00\U53d1\U8005,\U4e92\U8054\U7f51\U6280\U672f,\U82f9\U679c";
"allow_all_act_msg" = 0;
"allow_all_comment" = 0;
"avatar_hd" = "http://tva1.sinaimg.cn/crop.0.0.640.640.1024/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"avatar_large" = "http://tva1.sinaimg.cn/crop.0.0.640.640.180/6645b821jw8eze4qjct8oj20hs0huwgl.jpg";
"bi_followers_count" = 856;
"block_app" = 1;
"block_word" = 1;
cardid = "star_067";
city = 8;
class = 1;
"cover_image" = "http://ww4.sinaimg.cn/crop.0.0.920.300/6645b821gw1eyeotsl2xbj20pk08cn08.jpg";
"cover_image_phone" = "http://ww4.sinaimg.cn/crop.0.0.640.640.640/6ce2240djw1e8iktk4ohij20hs0hsmz6.jpg";
"created_at" = "Tue Oct 12 11:01:46 +0800 2010";
"credit_score" = 80;
description = "\U4e0a\U7684\U5385\U5802\Uff0c\U4e0b\U7684\U53a8\U623f\Uff0c\U5199\U7684\U4e86\U4ee3\U7801\Uff0c\U4fee\U7684\U4e86\U6ce2\U7bb1\Uff0c\U641e\U5f97\U5b9aMac\Uff0c\U6ce1\U5f97\U4e86\U59d1\U5a18\U3002\U53e6\U5916\Uff0c\U5c4c\U4e1d\Uff0cAndroid\Uff0c\U5c0f\U7c73\Uff0c\U9b45\U65cf\U9524\U5b50\U90fd\U662f\U81ed\U50bb\U903c\Uff01\U786c\U6838\U6b7b\U5fe0\Uff0c\U53cd\U5c4c\U4e1d\U4eba\U58eb\U3002";
domain = ibuick;
"favourites_count" = 196;
"follow_me" = 0;
"followers_count" = 105424;
following = 1;
"friends_count" = 974;
gender = m;


*/



