//
//  HYVistorView.swift
//  weibo_swift
//
//  Created by ocean on 16/6/16.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit




@objc protocol HYVistorViewDelegate: NSObjectProtocol{
    
    optional func registerBtnDidClick()
    
    optional func loginBtnDidClick()
}


class HYVistorView: UIView {
    
   weak var vistorViewDelegate: HYVistorViewDelegate?
    
    var imageView: UIImageView?
    var imageViewCanAnimation: UIImageView?
    var infoLabel: UILabel?
   private var registerBtn: UIButton?
   private var loginBtn: UIButton?
//    var insertBtn: UIButton?
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 在函数中声明的属性，外部不可以访问，即使是在同一个文件中
    //MARK: - 初始化方法中，进行子控件的实例化，并设置一些初始属性，如自动换行，字体大小，颜色等等  ---- 和oc一样
    private func setup(){
    
        imageView = UIImageView()
//        imageView?.image = UIImage(named: "visitordiscover_feed_image_house")
        imageView?.backgroundColor = UIColor.redColor()
        addSubview(imageView!)
        
        imageViewCanAnimation = UIImageView()
        imageViewCanAnimation?.backgroundColor = UIColor.orangeColor()
        addSubview(imageViewCanAnimation!)
        
        infoLabel = UILabel()
        infoLabel?.textColor = UIColor.lightGrayColor()
        infoLabel?.textAlignment = NSTextAlignment.Center
        infoLabel?.numberOfLines = 0
        infoLabel?.backgroundColor = UIColor.yellowColor()
        addSubview(infoLabel!)
        
        registerBtn = UIButton()
        registerBtn?.setTitle("注册", forState: UIControlState.Normal)
        registerBtn?.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        registerBtn?.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        registerBtn?.addTarget(self, action: "clickRegisterBtn", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(registerBtn!)
//        registerBtn?.setAttributedTitle([NSFontAttributeName: UIFont.systemFontOfSize(15.0), NSForegroundColorAttributeName: UIColor.orangeColor()], forState: UIControlState.Normal)
        
        loginBtn = UIButton()
        loginBtn?.setTitle("登录", forState: UIControlState.Normal)
        loginBtn?.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        loginBtn?.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        loginBtn?.addTarget(self, action: "clickloginBtn", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(loginBtn!)
        
        
//        print(self.center)

    }
    
// 
    //MARK: - 这里不能设置为私有的方法
    //点击注册按钮
     func clickRegisterBtn(){
    
//        print("clickRegisterBtn")
        if ((vistorViewDelegate?.respondsToSelector("registerBtnDidClick")) != nil){
        
            vistorViewDelegate?.registerBtnDidClick!()
        }
        
    }
    
     //MARK: - 这里不能设置为私有的方法
    //点击登录按钮
     func clickloginBtn(){
        
        print("clickloginBtn")
//
        if ((vistorViewDelegate?.respondsToSelector("loginBtnDidClick")) != nil) {
        
            vistorViewDelegate?.loginBtnDidClick!()
        }
    
    }
     
    
    //MARK: - 还可以通过设置约束来产生frame
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame = CGRectMake(110, 175, 150, 150)
        
        imageViewCanAnimation?.center = (imageView?.center)!
        imageViewCanAnimation?.frame.size.width = 175.0
        imageViewCanAnimation?.frame.size.height = 175.0
        
        
        let infoLabelX: CGFloat = 35.0
        let infoLabelY: CGFloat = CGRectGetMaxY((imageViewCanAnimation?.frame)!) + 20.0
        let infoLabelW: CGFloat = 300.0
        let infoLabelH: CGFloat = 40.0
        infoLabel?.frame = CGRectMake(infoLabelX, infoLabelY, infoLabelW, infoLabelH)
        
        let registerBtnX: CGFloat = 30.0
        let registerBtnY: CGFloat = CGRectGetMaxY((infoLabel?.frame)!) + 20.0
        let registerBtnW: CGFloat = 150.0
        let registerBtnH: CGFloat = 35.0
        registerBtn?.frame = CGRectMake(registerBtnX, registerBtnY, registerBtnW, registerBtnH)
        
        let loginBtnX: CGFloat = CGRectGetMaxX((registerBtn?.frame)!) + 15.0
        let loginBtnY: CGFloat = registerBtnY
        let loginBtnW: CGFloat = registerBtnW
        let loginBtnH: CGFloat = registerBtnH
        loginBtn?.frame = CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH)
  
    }


}
