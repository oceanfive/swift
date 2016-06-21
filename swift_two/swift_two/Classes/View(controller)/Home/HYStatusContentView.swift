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
    //    let retweetedView = HYRetweetedStatusView()

    
    var contentViewFrame = HYStatusContentFrame(){
    
        
        willSet(newValue){
            
            self.frame = newValue.frame!
        
            originalView.originalStatusFrame = newValue.originalStatusFrame!
            
            
//            setNeedsLayout()
            
        }
        
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(originalView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
