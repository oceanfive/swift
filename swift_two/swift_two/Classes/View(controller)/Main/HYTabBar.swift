//
//  HYTabBar.swift
//  weibo_swift
//
//  Created by ocean on 16/6/16.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYTabBar: UITabBar {
    
    
    //MARK: -  这里的plusButton是一个属性！！！只不过设置设置属性的时候就有一个button，通过闭包（尾随闭包）创建。 使用lazy懒加载的话，这里必须使用var修饰， 懒加载，需要使用的时候调用
    //MARK: - 注意，这里plusButton的访问控制默认为internal，这样的话，外界可以访问到plusButton，从而添加点击事件，不需要设置代理了
    lazy  var plusButton: UIButton = {
        
        //MARK: - 调用父类的方法 --- oc中也一样
        let plusButton: UIButton = UIButton(type: UIButtonType.Custom)
        
        plusButton.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        plusButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        plusButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        plusButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        //MARK: - 使用sizeToFit方法，就可以显示出来了，只不过位置还需要调整
//        plusButton.sizeToFit()
        
        return plusButton
        
    }()


    //MARK: - 重写init（frame： ）方法，而不是init方法 ---- oc中也一样
    override init(frame: CGRect) {
        //MARK: - 调用父类的方法 --- oc中也一样
        super.init(frame: frame)
        
        setup()
    }

    //MARK: - swift中默认所有的函数都是对外开放的，所以使用private进行封装
    private func setup(){
        addSubview(plusButton)
        
        //MARK: - 可以不需要
//        bringSubviewToFront(plusButton)
    }
    
    
    //MARK: - 这个方法是必须的，不可缺少
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - 重新布局子控件 --- 和oc一样
    override func layoutSubviews() {
        
        //MARK: - 调用父类的方法  --- 和oc一样
        super.layoutSubviews()
        
//        print(subviews)
        /*
        _UITabBarBackgroundView
        UIButton
        UITabBarButton * 4  //私有的类，无法敲出
        UIImageView
        */
        
        let width = bounds.size.width / 5
        let height = bounds.size.height
        
        //MARK: - 设置加号按钮的frame
        plusButton.frame = CGRectMake(2.0 * width, 0.0, width, height)
        
        //MARK: - 设置UITabBarButton的frame
        var index: Int = 0
        for temp in subviews{
            
            if temp.isKindOfClass(NSClassFromString("UITabBarButton")!) {
               
                if index < 2 {
                
                    temp.frame = CGRectMake(CGFloat(index) * width , 0.0, width, height)
                    
                }else {
                
                    temp.frame = CGRectMake(CGFloat(index + 1) * width, 0.0, width, height)
                
                }
                
                index++
            }
          }
            
            //MARK: - 这种方法会报错，不适用
//                        if temp is NSClassFromString("UITabBarButton")!{
//            
//                        }

    }

}
