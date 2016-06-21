//
//  HYRetweetedStatusFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYRetweetedStatusFrame: NSObject {

   var status = HYStatuses() {
    
        willSet(newValue){
        
            let tempStatus = newValue
            
            //textFrame
            let tempString = (tempStatus.retweeted_status?.text)! as NSString
            
            let tempSize = CGSizeMake(kScreenW - 10.0, CGFloat.max)
            
            let size = tempString.boundingRectWithSize(tempSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15.0), NSForegroundColorAttributeName: UIColor.blackColor()], context: nil)
            
            let textLabelX: CGFloat = 10.0
            let textLabelY: CGFloat = 10.0
            let textLabelW: CGFloat = size.width
            let textLabelH: CGFloat = size.height
            
            textLabelFrame = CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)
//MARK: - 待确定？？！！
            frame = CGRectMake(0, CGRectGetMaxY(HYOrighinalStatusFrame().frame!), kScreenW, CGRectGetMaxY(textLabelFrame!) + 10.0)
        
        }
        
        didSet(oldValue){
            
        
        }
    
    
    }
    
    
    var textLabelFrame: CGRect?
    
    var frame: CGRect?
    
}
