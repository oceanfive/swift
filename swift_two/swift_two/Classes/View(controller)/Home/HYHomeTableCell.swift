//
//  HYHomeTableCell.swift
//  swift_two
//
//  Created by ocean on 16/6/20.
//  Copyright © 2016年 ocean. All rights reserved.
//

import UIKit

class HYHomeTableCell: UITableViewCell, HYStatusToolBarViewDelegate {

    //MARK: - 这里注意不要和父类有相同的属性名称，否则会冲突
    let statusContentView = HYStatusContentView()
    let toolBarView = HYStatusToolBarView()
    
    var statusFrame = HYStatusesFrame(){
    
        willSet(newValue){
        
//            self.frame = newValue.frame!
            
            statusContentView.contentViewFrame = newValue.contentFrame!
            
            toolBarView.frame = newValue.toolBarFrame!
 
            toolBarView.status = newValue.status
            
//            setNeedsLayout()
            
        }

    }
    
    class func homeTableCell(tableView: UITableView) -> HYHomeTableCell {
    
        //MARK: - 这里在oc中可以不需要进行类型转换，但是在swift中需要进行类型转换，即父类向子类进行类型转换
        var cell = tableView.dequeueReusableCellWithIdentifier(kHomeTableCellIdentifier) as? HYHomeTableCell
        
        if cell == nil {
        
            cell = HYHomeTableCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: kHomeTableCellIdentifier)
//            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: kHomeTableCellIdentifier)
            
        }
        
        
        return cell!
    }
    
    //MARK: - 重写实例化方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
// Super.init isn't called before returning from initializer
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(statusContentView)

        addSubview(toolBarView)
        toolBarView.delegate = self
       
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func statusToolBarRepostsButtonDidClick() {
        
        print("点击转发按钮")
        
    }
    
    func statusToolBarCommentsButtonDidClick() {
        print("点击转发按钮")
    }
    
    func statusToolBarAttitudesButtonDidClick() {
         print("点击转发按钮")
    }

}
