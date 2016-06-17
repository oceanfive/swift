//
//  Global.swift
//  weibo_swift
//
//  Created by ocean on 16/6/17.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

//MARK: - 屏幕尺寸
let kScreenW = UIScreen.mainScreen().bounds.size.width
let kScreenH = UIScreen.mainScreen().bounds.size.height



//MARK: - 沙盒保存用户的文件名称
let kUserAccountName = "account.plist"


//MARK: - OAuth授权登录
let oauthURLString = "https://api.weibo.com/oauth2/authorize"
let redirect_uri = "http://weibo.com/u/3216382533/home?wvr=5"
let accessTokenURLString = "https://api.weibo.com/oauth2/access_token"
let client_id = "4017753567"
let client_secret = "528d174ef961f18dfe3acce2be8b1e69"
let grant_type = "authorization_code"


//MARK: - tabBar属性
let kTabBarTtitleFont = UIFont.systemFontOfSize(12.0)
let kTabBarTintColor = UIColor.orangeColor()



//MARK: - navigationBar 和 左右item不同状态下的 的属性
let kNaviBarTitleFont = UIFont.systemFontOfSize(20.0)
let kNaviBarTitleColor = UIColor.blackColor()

let kNaviItemTitleFontOfNormal = UIFont.systemFontOfSize(15.0)
let kNaviItemTitleColorOfNormal = UIColor.orangeColor()

let kNaviItemTitleFontOfHighlighted = UIFont.systemFontOfSize(15.0)
let kNaviItemTitleColorOfHighlighted = UIColor.redColor()













