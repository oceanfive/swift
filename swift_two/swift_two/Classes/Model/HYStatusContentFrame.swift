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
    
    var frame: CGRect?
    
    var status = HYStatuses(){
    
        willSet(newValue){
        
            originalStatusFrame = HYOrighinalStatusFrame()
            
            originalStatusFrame!.status = newValue
            
            
//            let retweetedFrame = HYRetweetedStatusFrame()
//            
//            retweetedFrame.status = newValue
   
            frame = CGRectMake(0, 10, kScreenW, CGRectGetMaxY((originalStatusFrame?.frame)!) + 10 )
        
        
        }
        
        didSet(oldValue){
        
        
        }
    
    }
    

    

}
