//
//  HYLoginViewController.swift
//  swift_two
//
//  Created by ocean on 16/6/18.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit
import Masonry
import SVProgressHUD

class HYLoginViewController: UIViewController {

    private let iconImageView = UIImageView()
    
    private let usernameTextField = UITextField()
    private let leftViewOfusername = UIButton()
    
    private let passwordTextField = UITextField()
    private let leftViewOfpassword = UIButton()
    
    private let loginBtn = UIButton()
    private let othersLoginBtn = UIButton()
    
    private let sharedBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        setup()

        
        registerNotification()
    }

    //MARK: - 初始化界面
    private func setup(){
        
        //usernameTextField
        usernameTextField.frame = CGRectMake(0, 250, kScreenW, 55)
        usernameTextField.placeholder = "邮箱/手机号"
        usernameTextField.leftViewMode = UITextFieldViewMode.Always
        view.addSubview(usernameTextField)
        
        
        //leftViewOfusername
        leftViewOfusername.frame = CGRectMake(0, 0, 35, 35)
        leftViewOfusername.backgroundColor = UIColor.orangeColor()
        leftViewOfusername.enabled = false
        usernameTextField.leftView = leftViewOfusername
        
 
        
        //passwordTextField
        passwordTextField.frame = CGRectMake(0, CGRectGetMaxY(usernameTextField.frame), kScreenW, 55)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.clearButtonMode = UITextFieldViewMode.WhileEditing
        passwordTextField.leftViewMode = UITextFieldViewMode.Always
        view.addSubview(passwordTextField)
        
        
        //leftViewOfpassword
        leftViewOfpassword.frame = CGRectMake(0, 0, 35, 35)
        leftViewOfpassword.backgroundColor = UIColor.orangeColor()
        leftViewOfpassword.enabled = false
        passwordTextField.leftView = leftViewOfpassword
        

        //loginBtn
        loginBtn.frame = CGRectMake(10, CGRectGetMaxY(passwordTextField.frame) + 20.0, kScreenW - 20.0, 50)
        loginBtn.backgroundColor = UIColor.blueColor()
        loginBtn.setTitle("登录", forState: UIControlState.Normal)
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        loginBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
        loginBtn.backgroundColor = UIColor.orangeColor()
        loginBtn.addTarget(self, action: "clickloginBtn", forControlEvents: UIControlEvents.TouchUpInside)
        loginBtn.enabled = false
        view.addSubview(loginBtn)
        
        
        //iconImageView
        iconImageView.frame = CGRectMake(140, 120, 100, 100)
        iconImageView.backgroundColor = UIColor.orangeColor()
        view.addSubview(iconImageView)
        
        
        //othersLoginBtn
        othersLoginBtn.frame = CGRectMake(140, 80, 100, 50)
        othersLoginBtn.setTitle("第三方登录", forState: UIControlState.Normal)
        othersLoginBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        othersLoginBtn.addTarget(self, action: "jumpToOthers", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(othersLoginBtn)
        
        
        //sharedBtn
        sharedBtn.frame = CGRectMake(50, 80, 100, 50)
        sharedBtn.setTitle("分享", forState: UIControlState.Normal)
        sharedBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        sharedBtn.addTarget(self, action: "sharedBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(sharedBtn)
        
        
    }
    
    //MARK: - 继承第三方分享
    func sharedBtnClick(){
        
        print("sharedBtnClick")
        // 1.创建分享参数
        let shareParames = NSMutableDictionary()
        
        shareParames.SSDKSetupShareParamsByText("我要分享东西了！哈哈！",
            images : UIImage(named: "preview_like_icon"),
            url : NSURL(string:"http://www.baidu.com"),
            title : "分享",
            type : SSDKContentType.Image)
        
        //MARK: - 分享菜单UI调整
        // 设置分享菜单的背景颜色 -- 后面调用方法中的view的背景颜色
//        SSUIShareActionSheetStyle.setActionSheetBackgroundColor(UIColor.orangeColor())
        // 设置分享菜单颜色
        SSUIShareActionSheetStyle.setActionSheetColor(UIColor.whiteColor())
        // 设置分享菜单－取消按钮背景颜色
        SSUIShareActionSheetStyle.setCancelButtonBackgroundColor(UIColor.whiteColor())
        // 设置分享菜单－取消按钮的文本颜色
        SSUIShareActionSheetStyle.setCancelButtonLabelColor(UIColor.redColor())
        // 设置分享菜单－社交平台文本颜色
        SSUIShareActionSheetStyle.setItemNameColor(UIColor.blackColor())
        // 设置分享菜单－社交平台文本字体
        SSUIShareActionSheetStyle.setItemNameFont(UIFont.systemFontOfSize(10.0))
        
        
        //MARK: - 分享编辑界面UI调整
        SSUIEditorViewStyle.setTitle("分享")
        SSUIEditorViewStyle.setTitleColor(UIColor.orangeColor())
        SSUIEditorViewStyle.setCancelButtonLabel("取消")
        SSUIEditorViewStyle.setCancelButtonLabelColor(UIColor.redColor())
        SSUIEditorViewStyle.setShareButtonLabel("分享")
        SSUIEditorViewStyle.setShareButtonLabelColor(UIColor.redColor())
//        SSUIEditorViewStyle.setContentViewBackgroundColor(UIColor.greenColor())
//        SSUIEditorViewStyle.setiPhoneNavigationBarBackgroundColor(UIColor.whiteColor())
        
        
        //MARK: - 授权登录界面UI调整
        SSDKAuthViewStyle.setTitle("授权登录")
        SSDKAuthViewStyle.setTitleColor(UIColor.orangeColor())
        SSDKAuthViewStyle.setCancelButtonLabel("取消")
        SSDKAuthViewStyle.setCancelButtonLabelColor(UIColor.redColor())
        SSDKAuthViewStyle.setNavigationBarBackgroundColor(UIColor.whiteColor())
        
        
        
    
        //2.进行分享
//        ShareSDK.share(SSDKPlatformType.TypeSinaWeibo, parameters: shareParames) { (state : SSDKResponseState, userData : [NSObject : AnyObject]!, contentEntity :SSDKContentEntity!, error : NSError!) -> Void in
//            
//            switch state{
//                
//            case SSDKResponseState.Success:
//                print("分享成功")
////                let alert = UIAlertView(title: "分享成功", message: "分享成功", delegate: self, cancelButtonTitle: "取消")
////                alert.show()
//            case SSDKResponseState.Fail:    print("分享失败,错误描述:\(error)")
//            case SSDKResponseState.Cancel:  print("分享取消")
//                
//            default:
//                break
//            }
//            
//        }
        
        ShareSDK.showShareActionSheet(view, items: nil, shareParams: shareParames) { (state : SSDKResponseState, platformType: SSDKPlatformType, userData : [NSObject : AnyObject]!, contentEntity :SSDKContentEntity!, error : NSError!, end: Bool) -> Void in
            
                switch state{
    
                case SSDKResponseState.Success:
                    print("分享成功")
                    print("platformType---\(platformType)")
                    print("userData---\(userData)")
                    print("contentEntity--\(contentEntity)")
    //                let alert = UIAlertView(title: "分享成功", message: "分享成功", delegate: self, cancelButtonTitle: "取消")
    //                alert.show()
                case SSDKResponseState.Fail:    print("分享失败,错误描述:\(error)")
                case SSDKResponseState.Cancel:  print("分享取消")
    
                default:
                    break
                }
            
        }
        
        

        
    
    }
    
    //MARK: - 登录判断
    func clickloginBtn(){
    
        let logiResult = HYLoginViewModel.login(usernameTextField.text!, password:passwordTextField.text!)
        
        if logiResult == HYLoginViewModel.LoginResult.Sucess {
            
            SVProgressHUD.showSuccessWithStatus("登录成功")
            print("登录成功,跳转到主界面或者新特性界面")
        
        }else if logiResult == HYLoginViewModel.LoginResult.UserNameError {
        
            SVProgressHUD.showErrorWithStatus("用户名称错误，请重新输入!")
            print("用户名称错误，请重新输入")
        
        }else {
            SVProgressHUD.showErrorWithStatus("用户密码错误，请重新输入!")
            print("用户密码错误，请重新输入!")
        
        }
        
    
    }

    //MARK: - 注册通知
    func registerNotification(){
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldDidChange", name: UITextFieldTextDidChangeNotification, object: usernameTextField)
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldDidChange", name: UITextFieldTextDidChangeNotification, object: passwordTextField)
    
    }

    func textFieldDidChange(){
    
        //MARK: - 注意，这里的判断标准是，textfield的文本是否为 “”，不是nil
        if usernameTextField.text != "" && passwordTextField.text != "" {
        
            loginBtn.enabled = true
        
        }else {
        
            loginBtn.enabled = false
        
        }
        
        
        if usernameTextField.text != "" {
        
            leftViewOfusername.backgroundColor = UIColor.blueColor()
        
        }else {
            
            leftViewOfusername.backgroundColor = UIColor.orangeColor()
            
        }
        
        
        if passwordTextField.text != "" {
        
            leftViewOfpassword.backgroundColor = UIColor.blueColor()
            
        }else {
        
            leftViewOfpassword.backgroundColor = UIColor.orangeColor()
        
        }
        
//        print("textFieldDidChange")
    
    }
    
    func jumpToOthers(){
    
        print("跳转到第三方登录")
        //
        ShareSDK.getUserInfo(SSDKPlatformType.TypeSinaWeibo) { (state: SSDKResponseState, user: SSDKUser!, error: NSError!) -> Void in
            
            switch state {
            
            case SSDKResponseState.Success:
                print("sucess---\(user.uid)---\(user.credential)---\(user.credential.token)---\(user.nickname)")
                
            case SSDKResponseState.Fail:
                print("fail--\(error)")
                
            case SSDKResponseState.Cancel:
                print("cancel")
            
            default:
                print("other")
            
            }
            
        }
  
    }
    
    //MARK: - 销毁方法，移除监听者
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    

}