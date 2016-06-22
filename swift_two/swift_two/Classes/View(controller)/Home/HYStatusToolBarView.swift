//
//  HYStatusToolBarView.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

@objc protocol HYStatusToolBarViewDelegate: NSObjectProtocol {

    optional func statusToolBarRepostsButtonDidClick()
    
    optional func statusToolBarCommentsButtonDidClick()
    
    optional func statusToolBarAttitudesButtonDidClick()
    
}

class HYStatusToolBarView: UIView {
    
    weak var delegate: HYStatusToolBarViewDelegate?
    
    var repostsButton = UIButton(type: .Custom)
    
    var commentsButton = UIButton(type: .Custom)

    var attitudesButton = UIButton(type: .Custom)
    
    var status = HYStatuses(){
    
        willSet(newValue){
//            
//            repostsButton.setTitle(String(newValue.reposts_count), forState: UIControlState.Normal)
//            
//            commentsButton.setTitle(String(newValue.comments_count), forState: UIControlState.Normal)
//            
//            attitudesButton.setTitle(String(newValue.attitudes_count), forState: UIControlState.Normal)
        
            print(newValue)
            print(newValue.reposts_count)
            print(newValue.comments_count)
            print(newValue.attitudes_count)
            
        }
    
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
//        repostsButton = addButton(UIImage(named: "timeline_icon_retweet")!, tagert: self, action: "clickRepostsButton")
////        addSubview(repostsButton!)
//        
//        commentsButton = addButton(UIImage(named: "timeline_icon_comment")!, tagert: self, action: "clickCommentsButton")
////        addSubview(commentsButton!)
//        
//        attitudesButton = addButton(UIImage(named: "timeline_icon_unlike")!, tagert: self, action: "clickAttitudesButton")
////         addSubview(attitudesButton!)
        
        
        repostsButton.addTarget(self, action: "clickRepostsButton", forControlEvents: UIControlEvents.TouchUpInside)
        repostsButton.setTitle("转发", forState: .Normal)
        repostsButton.setTitleColor(kHomeCellToolBarColor, forState: .Normal)
        repostsButton.titleLabel?.font = kHomeCellToolBarFont
        repostsButton.setImage(UIImage(named: "timeline_icon_retweet"), forState: .Normal)
        repostsButton.setBackgroundImage(UIImage(named: "timeline_card_middle_background_highlighted"), forState: UIControlState.Highlighted)
        repostsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        addSubview(repostsButton)
        
        
        
        commentsButton.addTarget(self, action: "clickCommentsButton", forControlEvents: UIControlEvents.TouchUpInside)
        commentsButton.setTitle("评论", forState: .Normal)
        commentsButton.setTitleColor(kHomeCellToolBarColor, forState: .Normal)
        commentsButton.titleLabel?.font = kHomeCellToolBarFont
        commentsButton.setImage(UIImage(named: "timeline_icon_comment"), forState: .Normal)
        commentsButton.setBackgroundImage(UIImage(named: "timeline_card_middle_background_highlighted"), forState: UIControlState.Highlighted)
        commentsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        addSubview(commentsButton)


       
        attitudesButton.addTarget(self, action: "clickAttitudesButton", forControlEvents: UIControlEvents.TouchUpInside)
        attitudesButton.setTitle("赞", forState: .Normal)
        attitudesButton.setTitleColor(kHomeCellToolBarColor, forState: .Normal)
        attitudesButton.titleLabel?.font = kHomeCellToolBarFont
        attitudesButton.setImage(UIImage(named: "timeline_icon_unlike"), forState: .Normal)
        attitudesButton.setBackgroundImage(UIImage(named: "timeline_card_middle_background_highlighted"), forState: UIControlState.Highlighted)
        attitudesButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        addSubview(attitudesButton)

        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - 为什么使用这个方法就没办法再次设置title了？
    //toolbar添加按钮方法
    func addButton(image: UIImage, tagert: AnyObject?, action: Selector) -> UIButton {
        
        let btn = UIButton()
        btn.setTitleColor(UIColor.redColor(), forState: .Normal)
        btn.setTitle("100", forState: .Normal)
        btn.setImage(image, forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "timeline_card_middle_background_highlighted"), forState: .Highlighted)
        btn.addTarget(tagert, action: action, forControlEvents: .TouchUpInside)
        
        self.addSubview(btn)
        
        return btn
    }
    
    //点击转发按钮
    func clickRepostsButton(){
    
        if ((delegate?.respondsToSelector("statusToolBarRepostsButtonDidClick")) != nil) {
        
            delegate?.statusToolBarRepostsButtonDidClick!()
        
        }
    }
    
    //点击评论按钮
    func clickCommentsButton(){
        
        if ((delegate?.respondsToSelector("statusToolBarCommentsButtonDidClick")) != nil) {
            
            delegate?.statusToolBarCommentsButtonDidClick!()
            
        }
 
    }
    
    //点击赞按钮
    func clickAttitudesButton(){
        
        if ((delegate?.respondsToSelector("statusToolBarAttitudesButtonDidClick")) != nil) {
            
            delegate?.statusToolBarAttitudesButtonDidClick!()
            
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.frame.width / 3
        let height = self.frame.height
        
//MARK: - 也可以使用循环设置，拓展性更好
        repostsButton.frame = CGRectMake(0, 0, width, height)
        
        commentsButton.frame = CGRectMake(width, 0, width, height)
        
        attitudesButton.frame = CGRectMake(width * 2, 0, width, height)
        
    }
    
    
}

/*
//转发数
var reposts_count: Int?

//评论数
var comments_count: Int?

//表态数
var attitudes_count: Int?

*/