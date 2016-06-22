//
//  HYStatusContentView.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYStatusContentView: UIView {

    let originalView = HYOriginalStatusView()
    
    let retweetedView = HYRetweetedStatusView()

    
    var contentViewFrame = HYStatusContentFrame(){
    
        
        willSet(newValue){
            
            self.frame = newValue.frame!
        
            originalView.originalStatusFrame = newValue.originalStatusFrame!
            
//MARK: - 这种方法会崩溃
//            retweetedView.retweetedStatusFrame = newValue.retweetedStatusFrame!
            
//MARK: - 这里可以不需要再次进行判断，因为在frame模型中已经判断过了
            if newValue.status.retweeted_status != nil {
            
                retweetedView.retweetedStatusFrame = newValue.retweetedStatusFrame!
//MARK: - 在frame模型里面已经说明
                
                retweetedView.hidden = false
            
            }else {
            
                retweetedView.hidden = true
            
            }
            
            
//            setNeedsLayout()
            
        }
        
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(originalView)
        
        addSubview(retweetedView)
     
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
