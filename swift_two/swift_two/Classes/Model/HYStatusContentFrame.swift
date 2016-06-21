//
//  HYStatusContentFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYStatusContentFrame: NSObject {
    
    var status = HYStatuses(){
    
        willSet(newValue){
        
            let originalFrame = HYOrighinalStatusFrame()
            
            originalFrame.status = newValue
            
//            let retweetedFrame = HYRetweetedStatusFrame()
//            
//            retweetedFrame.status = newValue
   
            frame = CGRectMake(0, 0, kScreenW, CGRectGetMaxY(originalFrame.frame!) + 10.0 )
        
        
        }
        
        didSet(oldValue){
        
        
        }
    
    }
    
    var frame: CGRect?
    

}
