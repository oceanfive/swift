//
//  HYRetweetedStatusView.swift
//  swift_two
//
//  Created by ocean on 16/6/21.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYRetweetedStatusView: UIView {

    let nameLabel = UILabel()
    
    let textLabel = UILabel()
    
    
    var retweetedStatusFrame = HYRetweetedStatusFrame(){
    
        willSet(newValue){
            let status = newValue.status
            
//MARK: - 不要忘记设置本身的frame
            self.frame = newValue.frame!

            nameLabel.frame = newValue.nameLabelFrame!
            nameLabel.text = "@\((status.retweeted_status?.user?.name)!)"
            
            textLabel.frame = newValue.textLabelFrame!
            textLabel.text = status.retweeted_status?.text
  
        }
   
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        nameLabel.font = kHomeCellRetweetedNameLabelFont
        nameLabel.textColor = kHomeCellRetweetedNameLabelColor
        
        
        addSubview(textLabel)
        textLabel.font = kHomeCellRetweetedTextLabelFont
        textLabel.textColor = kHomeCellRetweetedTextLabelColor
        textLabel.numberOfLines = 0

     
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
