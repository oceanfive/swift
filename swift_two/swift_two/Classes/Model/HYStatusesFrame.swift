//
//  HYStatusesFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYStatusesFrame: NSObject {

    var status = HYStatuses(){
    
        willSet(newValue){
        
            let tempStatus = newValue
            
            let contentViewFrame = HYStatusContentFrame()
            
            contentViewFrame.status = tempStatus
            
            contentFrame = contentViewFrame.frame
            
            toolBarFrame = CGRectMake(0, CGRectGetMaxY(contentFrame!) + 10.0, kScreenW, 50)
            
            cellHeight = CGRectGetMaxY(toolBarFrame!) + 10.0
            
        
        }
        
        didSet(oldValue){
        
        
        }

    }
    
    var contentFrame: CGRect?
    var toolBarFrame: CGRect?
    var cellHeight: CGFloat?

}
