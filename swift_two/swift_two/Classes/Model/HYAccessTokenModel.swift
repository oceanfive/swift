//
//  HYAccessTokenModel.swift
//  weibo_swift
//
//  Created by ocean on 16/6/17.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYAccessTokenModel: NSObject {

    var access_token: String?
    var expires_in: String?
    var remind_in: String?
    var uid: String?
    
}

/*
{
"access_token" = "2.00dBcfVDtOFu4E6c7ef71c44GliulB";
"expires_in" = 157679999;
"remind_in" = 157679999;
uid = 3216382533;
}

*/