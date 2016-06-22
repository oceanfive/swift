//
//  HYRetweetedStatusFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYRetweetedStatusFrame: NSObject {

    var nameLabelFrame: CGRect?
    
    var textLabelFrame: CGRect?
    
    var frame: CGRect?
    
    var status = HYStatuses() {
    
        willSet(newValue){
        
            let tempStatus = newValue
            
            //nameLabelFrame
            let tempNameText = "@\((tempStatus.retweeted_status?.user?.name)!)" as NSString
            
            let nameLabelSize = tempNameText.boundingRectWithSize(CGSizeMake(kScreenW, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:kHomeCellRetweetedNameLabelFont], context: nil).size
            
            let nameLabelX: CGFloat = 10.0
            let nameLabelY: CGFloat = 10.0
            let nameLabelW: CGFloat = nameLabelSize.width
            let nameLabelH: CGFloat = nameLabelSize.height
            
            nameLabelFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH)
            
            //textFrame
            let tempString = (tempStatus.retweeted_status?.text)! as NSString
            
            let size = tempString.boundingRectWithSize(CGSizeMake(kScreenW - 20.0, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: kHomeCellRetweetedTextLabelFont], context: nil).size
            
            let textLabelX: CGFloat = nameLabelX
            let textLabelY: CGFloat = CGRectGetMaxY(nameLabelFrame!) + 10.0
            let textLabelW: CGFloat = size.width
            let textLabelH: CGFloat = size.height
            
            textLabelFrame = CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)
//MARK: - 待确定？？！！这里先设置为0，通过父控件来修改尺寸
            frame = CGRectMake(0, 0, kScreenW, CGRectGetMaxY(textLabelFrame!) + 10.0)
        
        }
        
//        didSet(oldValue){
//            
//        
//        }
//    
    
    }
    
    

    
}
