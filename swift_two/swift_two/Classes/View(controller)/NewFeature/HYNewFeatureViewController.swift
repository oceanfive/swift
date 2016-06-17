//
//  HYNewFeatureViewController.swift
//  weibo_swift
//
//  Created by ocean on 16/6/17.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYNewFeatureViewController: UIViewController, UIScrollViewDelegate {
    
    let countOfNewFeature = 4
    
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var sharedBtn = UIButton()
    var finishedBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
//        view.backgroundColor = UIColor.yellowColor()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - 初始化设置
    func setup(){
      
        //scrollView
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSizeMake(kScreenW * CGFloat(countOfNewFeature), 0)
        scrollView.delegate = self
        scrollView.scrollEnabled = true
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.userInteractionEnabled = true
        view.addSubview(scrollView)
        
        //滚动图片
        for var i = 0; i < countOfNewFeature; i++ {
            let imageView = UIImageView()
            imageView.frame = CGRectMake(CGFloat(i) * kScreenW, 0, kScreenW, kScreenH)
            imageView.image = UIImage(named: "new_feature_\(i + 1)")
            scrollView.addSubview(imageView)
            
            if i == countOfNewFeature - 1 {
            
                imageView.userInteractionEnabled = true
                
                //sharedBtn
                sharedBtn.frame = CGRectMake(120, 420, 150, 40)
                sharedBtn.setTitle("分享我的微博", forState: UIControlState.Normal)
                sharedBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
                sharedBtn.setImage(UIImage(named: "new_feature_share_false"), forState: UIControlState.Normal)
                sharedBtn.setImage(UIImage(named: "new_feature_share_true"), forState: UIControlState.Selected)
                sharedBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0)
                sharedBtn.addTarget(self, action: "clickSharedBtn", forControlEvents: .TouchUpInside)
                imageView.addSubview(sharedBtn)
                sharedBtn.backgroundColor = UIColor.yellowColor()
                
                //finishedBtn
                finishedBtn.frame = CGRectMake(150, 500, 100, 40)
                finishedBtn.setTitle("开启微博", forState: UIControlState.Normal)
                finishedBtn.setBackgroundImage(UIImage(named: "new_feature_finish_button"), forState: UIControlState.Normal)
                finishedBtn.setBackgroundImage(UIImage(named: "new_feature_finish_button_highlighted"), forState: UIControlState.Highlighted)
                finishedBtn.addTarget(self, action: "clickFinishedBtn", forControlEvents: .TouchUpInside)
                imageView.addSubview(finishedBtn)
            
            }
            
        }
        
        
        //pageControl
        pageControl.frame = CGRectMake(150, 600, 100, 35)
        pageControl.numberOfPages = countOfNewFeature
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.blackColor()
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        view.addSubview(pageControl)


    }
    
    //点击分享按钮
    func clickSharedBtn(){
    
        sharedBtn.selected = !sharedBtn.selected
    print("clickSharedBtn")
    
    }
    
    //点击开启微博按钮
    func clickFinishedBtn(){
    print("clickFinishedBtn")
    
        let keyWindow = UIApplication.sharedApplication().keyWindow
        
        keyWindow?.rootViewController = HYTabbarViewController()
        
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / CGFloat(kScreenW)
        pageControl.currentPage = Int(currentPage)
   
    }
    
    //MARK: - 不适用这种方法，因为按钮可能添加到最后一张图片的前一张图片上，所以把按钮添加到最后一张图片上
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        
//        let distance = CGFloat(countOfNewFeature - 1) * kScreenW - scrollView.contentOffset.x
//        
//        if distance < kScreenW {
//            sharedBtn.hidden = false
//            finishedBtn.hidden = false
//        }else {
//            sharedBtn.hidden = true
//            finishedBtn.hidden = true
//        }
//    }

}
