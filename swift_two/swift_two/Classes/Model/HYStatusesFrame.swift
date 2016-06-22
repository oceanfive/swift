//
//  HYStatusesFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYStatusesFrame: NSObject {

    var contentFrame: HYStatusContentFrame?
    var toolBarFrame: CGRect?
//    var frame: CGRect?
    var cellHeight: CGFloat?
    
    var status = HYStatuses(){
    
        willSet(newValue){
        
            let tempStatus = newValue
            
            contentFrame = HYStatusContentFrame()
            
            contentFrame!.status = tempStatus
            
            toolBarFrame = CGRectMake(0, CGRectGetMaxY((contentFrame?.frame!)!) + 10.0, kScreenW, 30)
            
            cellHeight = CGRectGetMaxY(toolBarFrame!) + 10.0
            
        
        }
        
//        didSet(oldValue){
//        
//        
//        }

    }
    


}
