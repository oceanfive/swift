//
//  HYOrighinalStatusFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYOrighinalStatusFrame: NSObject {
    
    
    var status = HYStatuses() {
    
        willSet(newValue) {
            
            let tempStatus = newValue
    
            //iconImageView
            let iconImageViewX: CGFloat = 10.0
            let iconImageViewY: CGFloat = 10.0
            let iconImageViewW: CGFloat = 80.0
            let iconImageViewH: CGFloat = 80.0
            iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH)
            
            
            //nameLabel
            let nameLabelText = (tempStatus.user?.name)! as NSString
//MARK: - 最大值对比： oc:  swift：
            let size = CGSizeMake(kScreenW, CGFloat.max)
//MARK: - 枚举对比
            let nameLabelSize = nameLabelText.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(12.0), NSForegroundColorAttributeName: UIColor.orangeColor()], context: nil).size
            
            let nameLabelX: CGFloat = CGRectGetMaxX(iconImageViewFrame!) + 10
            let nameLabelY: CGFloat = iconImageViewY
            let nameLabelW: CGFloat = nameLabelSize.width
            let nameLabelH: CGFloat = nameLabelSize.height
            
            nameLabelFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH)
            
            
            //timeLabel 
            let timeLabelX: CGFloat = nameLabelX
            let timeLabelY: CGFloat = CGRectGetMaxY(nameLabelFrame!) + 10
            let timeLabelW: CGFloat = 120.0
            let timeLabelH: CGFloat = 25.0
            
            timeLabelFrame = CGRectMake(timeLabelX, timeLabelY, timeLabelW, timeLabelH)
            
            // sourceLabel 
            let sourceLabelX: CGFloat = CGRectGetMaxX(timeLabelFrame!) + 10
            let sourceLabelY: CGFloat = timeLabelY
            let sourceLabelW: CGFloat = 120.0
            let sourceLabelH: CGFloat = 25.0
            
            sourceLabelFrame = CGRectMake(sourceLabelX, sourceLabelY, sourceLabelW, sourceLabelH)
            
            // textLabel
            
            let textLabelText = tempStatus.text! as NSString
            
            let sizeTwo = CGSizeMake(kScreenW - 10.0, CGFloat.max)
            
            let textLableSize = textLabelText.boundingRectWithSize(sizeTwo, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15.0), NSForegroundColorAttributeName: UIColor.blackColor()], context: nil).size
            
            let textLabelX: CGFloat = iconImageViewX
            let textLabelY: CGFloat = CGRectGetMaxY(iconImageViewFrame!) + 10
            let textLabelW: CGFloat = textLableSize.width
            let textLabelH: CGFloat = textLableSize.height
            
            textLabelFrame  = CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)
            
            
            frame = CGRectMake(0, 0, kScreenW, CGRectGetMaxY(textLabelFrame!) + 10.0)
            
        }
        
        didSet(oldValue) {
        
        
        }
    
    
    }
    
    var iconImageViewFrame: CGRect?
    
    var nameLabelFrame: CGRect?
    
    var timeLabelFrame: CGRect?
    
    var sourceLabelFrame: CGRect?
    
    var textLabelFrame: CGRect?
    
    var photosViewFrame: CGRect?
    
    var frame: CGRect?

}
