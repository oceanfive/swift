//
//  HYTabbarViewController.swift
//  weibo_swift
//
//  Created by ocean on 16/6/15.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - 启动HYTabbarViewController
        setup()
       
    }
    
    /**
     启动HYTabbarViewController
     */
    private func setup(){
    
        //首页
        addChildVC(HYHomeVC(), title: "首页", imageName: "tabbar_home", selectedImageName: "tabbar_home_highlighted")
        
        //消息
        addChildVC(HYMessageVC(), title: "消息", imageName: "tabbar_message_center", selectedImageName: "tabbar_message_center_highlighted")
        
        //发现
        addChildVC(HYDiscoverVC(), title: "发现", imageName: "tabbar_discover", selectedImageName: "tabbar_discover_highlighted")
        
        //我
        addChildVC(HYProfileVC(), title: "我", imageName: "tabbar_profile", selectedImageName: "tabbar_profile_highlighted")
        
        //MARK: - 自定义tabBar，替换掉系统的，然后添加加号按钮
        let myTabBar = HYTabBar()
        setValue(myTabBar, forKey: "tabBar")
        
        //添加点击事件，弹出发微博界面，-----这种方法就不需要使用代理了
        myTabBar.plusButton.addTarget(self, action: "clickComposeBtn", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        //        print(view.subviews)
        /*
        UITransitionView
        weibo_swift.HYTabBar    UITabBar
        */
        
        //MARK: - 这里的HYTabBar和在文件中的子控件不一样？？？为什么？？？？
        //        for temp in view.subviews{
        ////              print(temp)
        //            if temp is weibo_swift.HYTabBar{
        //                for btn in temp.subviews{
        //                    print(btn)
        //                }
        //            }
        //        }
        
        //        for temp in view.subviews{
        //            if temp.isKindOfClass(NSClassFromString("UITabBar")!){
        //                print(temp)
        //            }
        //        }
        
    
    }
    
    /**
     弹出发微博界面
     */
    //MARK: - 这里不能使用private，否则会崩溃,为什么？？？？
    func clickComposeBtn(){
    
        print("clickComposeBtn")
    }
    
    /**
     设置主题
     */
    override class func initialize(){
    
        let appearanceOfTabBarItem: UITabBarItem = UITabBarItem.appearance()
        appearanceOfTabBarItem.setTitleTextAttributes([NSFontAttributeName: kTabBarTtitleFont], forState: UIControlState.Normal)
        
        let appearanceOfTabBar: UITabBar = UITabBar.appearance()
        appearanceOfTabBar.tintColor = kTabBarTintColor
    }
    
    /**
     快速添加子控制器的方法
     
     - parameter viewcontroller: 子控制器
     - parameter title:          标题
     - parameter image:          默认状态下显示的图片
     - parameter selectedImage:  选中状态下显示的图片
     */
    func addChildVC(viewcontroller: UIViewController, title: String, imageName: String, selectedImageName: String){
    
        let childVC: HYNavigationViewController = HYNavigationViewController(rootViewController: viewcontroller)
        viewcontroller.title = title
        viewcontroller.tabBarItem.image = UIImage(named: imageName)
        viewcontroller.tabBarItem.selectedImage = UIImage(named: selectedImageName)//!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        addChildViewController(childVC)
    }

}
