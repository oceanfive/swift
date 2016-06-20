//
//  HYHomeTableCell.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYHomeTableCell: UITableViewCell {

    //MARK: - 这里注意不要和父类有相同的属性名称，否则会冲突
    let statusContentView = HYStatusContentView()
    let toolBarView = HYStatusToolBarView()
    
    class func homeTableCell(tableView: UITableView) -> HYHomeTableCell {
    
        //MARK: - 这里在oc中可以不需要进行类型转换，但是在swift中需要进行类型转换，即父类向子类进行类型转换
        var cell = tableView.dequeueReusableCellWithIdentifier(kHomeTableCellIdentifier) as? HYHomeTableCell
        
        if cell == nil {
        
            cell = HYHomeTableCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: kHomeTableCellIdentifier)
            
        }
        
        return cell!
    }
    
    //MARK: - 重写实例化方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)


        statusContentView.backgroundColor = UIColor.orangeColor()
        
        toolBarView.backgroundColor = UIColor.greenColor()
        
        
        
        
//        if self == super.init(style: style, reuseIdentifier: reuseIdentifier) {
//        
//        
//        }
//
//        
//        return self
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    
        
        
    }


}
