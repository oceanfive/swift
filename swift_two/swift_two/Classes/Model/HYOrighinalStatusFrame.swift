//
//  HYOrighinalStatusFrame.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYOrighinalStatusFrame: NSObject {
    
    var iconImageViewFrame: CGRect?
    
    var nameLabelFrame: CGRect?
    
    var vipImageViewFrame: CGRect?
    
    var timeLabelFrame: CGRect?
    
    var sourceLabelFrame: CGRect?
    
    var textLabelFrame: CGRect?
    
    var photosViewFrame: CGRect?
    
    var frame: CGRect?
    
    var status = HYStatuses() {
    
        willSet(newValue) {
            
            let tempStatus = newValue
    
            //iconImageView
            let iconImageViewX: CGFloat = 10.0
            let iconImageViewY: CGFloat = 10.0
            let iconImageViewW: CGFloat = 50.0
            let iconImageViewH: CGFloat = 50.0
            iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH)
            
            
            //nameLabel
            let nameLabelText = (tempStatus.user?.name)! as NSString
//MARK: - 最大值对比： oc:  swift：
//            let size = CGSizeMake(kScreenW, CGFloat.max)
//MARK: - 枚举对比
            let nameLabelSize = nameLabelText.boundingRectWithSize(CGSizeMake(kScreenW, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: kHomeCellNameLableFont], context: nil).size
            let nameLabelX: CGFloat = CGRectGetMaxX(iconImageViewFrame!) + 10
            let nameLabelY: CGFloat = iconImageViewY
            let nameLabelW: CGFloat = nameLabelSize.width
            let nameLabelH: CGFloat = nameLabelSize.height
            nameLabelFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH)
            
            
            //vipImageViewFrame
            let vipImageViewX: CGFloat = CGRectGetMaxX(nameLabelFrame!) + 10
            let vipImageViewY: CGFloat = nameLabelY
            let vipImageViewW: CGFloat = 15
            let vipImageViewH: CGFloat = 15
            vipImageViewFrame = CGRectMake(vipImageViewX, vipImageViewY, vipImageViewW, vipImageViewH)
            
            
            //timeLabel
            let timeLabelText = tempStatus.created_at! as NSString
            let timeLabelSize = timeLabelText.boundingRectWithSize(CGSizeMake(kScreenW, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: kHomeCellTimeLableFont], context: nil).size
            let timeLabelX: CGFloat = nameLabelX
            let timeLabelY: CGFloat = CGRectGetMaxY(nameLabelFrame!) + 10
            let timeLabelW: CGFloat = timeLabelSize.width
            let timeLabelH: CGFloat = timeLabelSize.height
            timeLabelFrame = CGRectMake(timeLabelX, timeLabelY, timeLabelW, timeLabelH)
            
            
            // sourceLabel 
            let sourceLabelText = tempStatus.source! as NSString
//            print("tempStatus.source--\(tempStatus.source)")
            let sourceLabelSize = sourceLabelText.boundingRectWithSize(CGSizeMake(kScreenW, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: kHomeCellSourceLabelFont], context: nil).size
            let sourceLabelX: CGFloat = CGRectGetMaxX(timeLabelFrame!) + 10
            let sourceLabelY: CGFloat = timeLabelY
            let sourceLabelW: CGFloat = sourceLabelSize.width
            let sourceLabelH: CGFloat = sourceLabelSize.height
            sourceLabelFrame = CGRectMake(sourceLabelX, sourceLabelY, sourceLabelW, sourceLabelH)
            
            
            // textLabel
            let textLabelText = tempStatus.text! as NSString
            let textLableSize = textLabelText.boundingRectWithSize(CGSizeMake(kScreenW - 20.0, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: kHomeCellTextLabelFont], context: nil).size
            let textLabelX: CGFloat = iconImageViewX
            let textLabelY: CGFloat = CGRectGetMaxY(iconImageViewFrame!) + 10
            let textLabelW: CGFloat = textLableSize.width
            let textLabelH: CGFloat = textLableSize.height
            textLabelFrame  = CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)
            
            frame = CGRectMake(0, 0, kScreenW, CGRectGetMaxY(textLabelFrame!) + 10.0)
            
        }
        
//        didSet(oldValue) {
//        
//        
//        }
//    
//    
    }

}
