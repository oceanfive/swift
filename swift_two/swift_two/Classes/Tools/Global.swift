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


//MARK: - 微博相关接口
//获取当前登录用户及其所关注（授权）用户的最新微博
let kHome_timelineString = "https://api.weibo.com/2/statuses/home_timeline.json"


//MARK: - 微博cell相关属性设置
//原创微博nameLabel
let kHomeCellNameLableFont = UIFont.systemFontOfSize(14.0)
let kHomeCellNameLableColorVip = UIColor.orangeColor()
let kHomeCellNameLableColorNormal = UIColor.blackColor()
//原创微博timeLable
let kHomeCellTimeLableFont = UIFont.systemFontOfSize(11.0)
let kHomeCellTimeLableColor = UIColor.orangeColor()
//原创微博sourceLabel
let kHomeCellSourceLabelFont = UIFont.systemFontOfSize(11.0)
let kHomeCellSourceLabelColor = UIColor.blackColor()
//原创微博text
let kHomeCellTextLabelFont = UIFont.systemFontOfSize(14.0)
let kHomeCellTextLabelColor = UIColor.blackColor()
//转发微博name
let kHomeCellRetweetedNameLabelFont = UIFont.systemFontOfSize(12.0)
let kHomeCellRetweetedNameLabelColor = UIColor.blueColor()
//转发微博text
let kHomeCellRetweetedTextLabelFont = UIFont.systemFontOfSize(12.0)
let kHomeCellRetweetedTextLabelColor = UIColor.blackColor()


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

//MARK: - cell的重用标示符
//主页
let kHomeTableCellIdentifier = "homeTableCellIdentifier"


//MARK: - 第三方登录信息

/*
App Key
14084daaa97b6

App Secret
eb42509eea896a142ba669eb0b071929

*/










