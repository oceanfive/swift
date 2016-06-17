//
//  HYOAuthViewController.swift
//  weibo_swift
//
//  Created by ocean on 16/6/16.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit
import AFNetworking
import MJExtension
import SVProgressHUD


class HYOAuthViewController: UIViewController, UIWebViewDelegate {

    
    let webView = UIWebView()
    var code: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - 启动webView,设置初始信息
        setup()
        
        //MARK: - 发送网络请求
        sendNetWork()

        print(NSHomeDirectory())
   
    }

    //启动webView ，设置初始信息
    func setup() {
    
        view.addSubview(webView)
        webView.frame = view.frame
        webView.delegate = self
        
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.scrollView.showsVerticalScrollIndicator = false
//        webView.scrollView.scrollEnabled = false
        
        //MARK: - 这里自定义的不包含设置的主题？？
        let registerBtn = UIButton(type: UIButtonType.Custom)
        registerBtn.frame = CGRectMake(0, 0, 40, 40)
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
        registerBtn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        registerBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        registerBtn.addTarget(self, action: "clickRegisterBtn", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: registerBtn)
        
        let autoRememberBtn = UIButton(type: UIButtonType.Custom)
        autoRememberBtn.frame = CGRectMake(0, 0, 80, 40)
        autoRememberBtn.setTitle("自动填充", forState: UIControlState.Normal)
        autoRememberBtn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        autoRememberBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        autoRememberBtn.addTarget(self, action: "clickAutoRememberBtn", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: autoRememberBtn)
    
    }
    
    //MARK: - 点击注册按钮
    func clickRegisterBtn(){
    
        print("跳转到注册界面")
    }
    
    //MARK: - 点击自动填充按钮
    func clickAutoRememberBtn(){
        
        print("点击自动填充按钮")
        
    }
    
    //发送网络请求
    func sendNetWork(){
        //MARK: - 这里不需要使用第三方框架，webView自带的就可以了
        let urlString = oauthURLString + "?client_id=\(client_id)" + "&redirect_uri=\(redirect_uri)"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
    }
    
    //MARK: - UIWebViewDelegate
    //网络请求错误
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
    }
    //每次网络前都会调用这个方法
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let tempString = request.URL!.absoluteString
        
        if tempString.hasPrefix(redirect_uri) {
        
            let range: Range = tempString.rangeOfString("code=")!
            
//            print(range)  //41..<46
            
            code = tempString.substringFromIndex(range.endIndex)
            
            //MARK: - 获取accessToken
            getAccessToken()
            
//            print(range.startIndex) //http://weibo.com/u/3216382533/home?wvr=5&code=fb1813827f813cfbc49815014d443f4e
//            print(range.endIndex)
            return false
        
        }
        
        return true
        
        /*
        https://api.weibo.com/oauth2/authorize?client_id=4017753567&redirect_uri=http://weibo.com/u/3216382533/home?wvr=5
        https://api.weibo.com/oauth2/authorize
        https://api.weibo.com/oauth2/authorize#
        https://api.weibo.com/oauth2/authorize
        http://weibo.com/u/3216382533/home?wvr=5&code=02a19e23c67e0d74da7c46fc094b901f
        http://weibo.cn/u/3216382533/home?wvr=5&code=02a19e23c67e0d74da7c46fc094b901f&jumpfrom=weibocom&wvr=5&code=02a19e23c67e0d74da7c46fc094b901f
        http://m.weibo.cn//?jumpfrom=weibocom
        https://passport.weibo.cn/signin/welcome?entry=mweibo&r=http%3A%2F%2Fm.weibo.cn%2F%2F%3Fjumpfrom%3Dweibocom&jumpfrom=weibocom
        
        */
        
    }
    
    //开始网络请求
    func webViewDidStartLoad(webView: UIWebView) {
        
        SVProgressHUD.showWithStatus("正在加载中...")
        
    }
    
    //完成网络请求
    func webViewDidFinishLoad(webView: UIWebView) {
        
        SVProgressHUD.dismiss()
        
    }

    //获取accessToken - 使用第三方框架
    func getAccessToken(){
    
        let manager = AFHTTPSessionManager()
        //MARK: - 如果AFN提示不接受文件类型，那么需要自己手动添加
        manager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        let dict = ["client_id": client_id, "client_secret": client_secret, "grant_type": grant_type, "code": code!, "redirect_uri": redirect_uri]
        
        manager.POST(accessTokenURLString, parameters: dict, success: { (task, response) -> Void in
            
//            print("task--\(task)")
//            print("response--\(response)")
            
            HYAccountTool.saveAccount(response! as! [String : AnyObject])
//
//            let model: HYAccessTokenModel? = HYAccountTool.getAccount()
//            
//            if model == nil {
//                
//                print("值为空")
//            
//            }else {
//                
//                print("不为空")
//    
//            }
//            
//            if let model: HYAccessTokenModel = HYAccountTool.getAccount() {
//            
//                print(model.access_token)
//                
//            
//            }
//            

            
            
            let keyWindow = UIApplication.sharedApplication().keyWindow
            
            keyWindow?.rootViewController = HYNewFeatureViewController()
            
            
            
            //MARK: - 用MJ第三方框架转模型时，如果为nil会崩溃，这时需要添加一个判断，是否为空的判断
//            if let accessTokenModel = HYAccessTokenModel.mj_objectWithKeyValues(response){

            
//            }
            
//            let accessTokenModel = HYAccessTokenModel.mj_objectArrayWithKeyValuesArray(response)
            
            /*
            Optional({
            "access_token" = "2.00dBcfVDtOFu4E6c7ef71c44GliulB";
            "expires_in" = 157679999;
            "remind_in" = 157679999;
            uid = 3216382533;
            })

            
            */
            }) { (errorTask, error) -> Void in
                
                print("error---\(error)")
                
        }
        
    
    }

}
