//
//  HYOriginalStatusView.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit
import SDWebImage

class HYOriginalStatusView: UIView {

    let iconImageView = UIImageView()
    
    let nameLabel = UILabel()
    
    let vipImageView = UIImageView()
    
    let timeLabel = UILabel()
    
    let sourceLabel = UILabel()
    
    let textLabel = UILabel()
    
    
    var originalStatusFrame = HYOrighinalStatusFrame(){
    
        willSet(newValue){
        
            let status = newValue.status
            
            //iconImageView
            iconImageView.frame = newValue.iconImageViewFrame!
            iconImageView.sd_setImageWithURL(NSURL(string: (status.user?.profile_image_url)!), placeholderImage: UIImage(named: ""))
            
            //nameLabel
            nameLabel.frame = newValue.nameLabelFrame!
            nameLabel.text = status.user?.name
            
            //vipImageView
            vipImageView.frame = newValue.vipImageViewFrame!
            vipImageView.image = UIImage(named: "common_icon_membership_level1")
            
            //timeLabel
            timeLabel.frame = newValue.timeLabelFrame!
            timeLabel.text = status.created_at
//            print("created_at---\(status.created_at)")
            //sourceLabel
            sourceLabel.frame = newValue.sourceLabelFrame!
            sourceLabel.text = status.source!
//            print("created_at---\(status.source)")
            //textLabel
            textLabel.frame = newValue.textLabelFrame!
            textLabel.text = status.text
 

        
        }
    
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let status = originalStatusFrame.status
        
        addSubview(iconImageView)
        
        addSubview(nameLabel)
        nameLabel.font = kHomeCellNameLableFont
        nameLabel.textColor = kHomeCellNameLableColorVip
        
        addSubview(vipImageView)
        
        addSubview(timeLabel)
        timeLabel.font = kHomeCellTimeLableFont
        timeLabel.textColor = kHomeCellTimeLableColor
        
        addSubview(sourceLabel)
        sourceLabel.font = kHomeCellSourceLabelFont
        sourceLabel.textColor = kHomeCellSourceLabelColor
        
        addSubview(textLabel)
        textLabel.font = kHomeCellTextLabelFont
        textLabel.textColor = kHomeCellTextLabelColor
        textLabel.numberOfLines = 0
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
