//
//  AppDelegate.swift
//  swift_two
//
//  Created by ocean on 16/6/17.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //MARK: - 进行界面跳转判断，
//        let account: HYAccessTokenModel? = HYAccountTool.getAccount()
//        
//        if account == nil {
//            
//            let oauthViewController = HYNavigationViewController(rootViewController: HYOAuthViewController())
//            
//            window?.rootViewController = oauthViewController
//            
//        }else {
//            
//            window?.rootViewController = HYTabbarViewController()
//            
//        }
        
        //MARK: - 应用程序的主窗口默认的背景颜色为黑色，所以需要自己设置颜色
        window?.rootViewController = HYLoginViewController()
        
        window?.makeKeyAndVisible()
        
        //MARK: - 第三方分享和登录
        /**
        *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
        *  在将生成的AppKey传入到此方法中。
        *  方法中的第二个参数用于指定要使用哪些社交平台，以数组形式传入。第三个参数为需要连接社交平台SDK时触发，
        *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
        *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
        */
        
        ShareSDK.registerApp("14084daaa97b6",
            
            activePlatforms: [SSDKPlatformType.TypeSinaWeibo.rawValue,
                SSDKPlatformType.TypeTencentWeibo.rawValue,
                SSDKPlatformType.TypeFacebook.rawValue,
                SSDKPlatformType.TypeWechat.rawValue,
                SSDKPlatformType.TypeQQ.rawValue],
            
            onImport: {(platform : SSDKPlatformType) -> Void in
                
                switch platform{
                    
                case SSDKPlatformType.TypeWechat:
                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                    
                case SSDKPlatformType.TypeQQ:
                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
//                    
                case SSDKPlatformType.TypeSinaWeibo:
                    ShareSDKConnector.connectWeibo(WeiboSDK.classForCoder())
                default:
                    break
                }
            },
            
            onConfiguration: {(platform : SSDKPlatformType,appInfo : NSMutableDictionary!) -> Void in
                switch platform {
                    
                case SSDKPlatformType.TypeSinaWeibo:
                    //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                    appInfo.SSDKSetupSinaWeiboByAppKey("50859610",
                        appSecret : "6c866d793f505dba472b3d6868656426",
                        redirectUri : "http://weibo.com/u/3216382533/home?wvr=5",
                        authType : SSDKAuthTypeBoth)
                    break
                    
                case SSDKPlatformType.TypeWechat:
                    //设置微信应用信息
                    appInfo.SSDKSetupWeChatByAppId("wx4868b35061f87885", appSecret: "64020361b8ec4c99936c0e3999a9f249")
                    break
                    
                case SSDKPlatformType.TypeTencentWeibo:
                    //设置腾讯微博应用信息，其中authType设置为只用Web形式授权
                    appInfo.SSDKSetupTencentWeiboByAppKey("50859610",
                        appSecret : "6c866d793f505dba472b3d6868656426",
                        redirectUri : "http://www.sharesdk.cn")
                    break
//                case SSDKPlatformType.TypeFacebook:
//                    //设置Facebook应用信息，其中authType设置为只用SSO形式授权
//                    appInfo.SSDKSetupFacebookbyapikey("107704292745179",
//                        appSecret : "38053202e1a5fe26c80c753071f0b573",
//                        authType : SSDKAuthTypeBoth)
//                    break
                default:
                    break
                    
                }
        })
        
        
        //MARK: - 第三方短信验证码
//        SMSSDK.registerApp("140b4fbf91f54", withSecret: "67fee50bc2eb044dcdaf467c8b0fa417")
//        
////        SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethodSMS, phoneNumber: "15876580585", zone: "86", customIdentifier: "我来了") { (<#NSError!#>) in
////            <#code#>
////        }
//        
//        SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethodSMS, phoneNumber: "15876580585", zone: "86", customIdentifier: "我来了") { (error: NSError!) in
//            
//            if (error == nil) {
//            
//                print("发送成功")
//                
//            }else {
//            
//                print("发送失败")
//            }
//            
//        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

