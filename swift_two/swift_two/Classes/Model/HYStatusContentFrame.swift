//
//  HYStatusContentFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYStatusContentFrame: NSObject {
    
    var originalStatusFrame: HYOrighinalStatusFrame?
    
    var retweetedStatusFrame: HYRetweetedStatusFrame?
    
    var frame: CGRect?
    
    var status = HYStatuses(){
    
        willSet(newValue){
        
            originalStatusFrame = HYOrighinalStatusFrame()
            
            originalStatusFrame!.status = newValue
            
            if newValue.retweeted_status != nil { //有转发微博

//MARK: - 因为转发微博的frame需要修改，所以先存一个临时变量，临时的变量的值最终确定后再，赋值给retweetedStatusFrame
                let tempRetweetedStatusFrame = HYRetweetedStatusFrame()
//                retweetedStatusFrame = HYRetweetedStatusFrame()
                
                tempRetweetedStatusFrame.status = newValue
//MARK: - 这里修改转发微博的frame
                var tempFrame = tempRetweetedStatusFrame.frame
                
                tempFrame?.origin.y = CGRectGetMaxY((originalStatusFrame?.frame)!) + 10.0
                
                tempRetweetedStatusFrame.frame = tempFrame
                
                retweetedStatusFrame = tempRetweetedStatusFrame
                
                frame = CGRectMake(0, 10, kScreenW, CGRectGetMaxY((tempRetweetedStatusFrame.frame)!))
                
                
            }else { //没有转发微博
            
                frame = CGRectMake(0, 10, kScreenW, CGRectGetMaxY((originalStatusFrame?.frame)!))

            }
        
        }
        
//        didSet(oldValue){
//        
//        
//        }
    
    }
    

    

}
