//
//  NSDate+HYCategory.h
//  日期和时间研究
//
//  Created by ocean on 16/5/24.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HYCategory)

/**
 *  判断一个时间和当前时间是不是在同一分钟内
 *
 *  @return YES，是；NO，不是
 */
- (BOOL)isMinute;


/**
 *  判断一个时间和当前时间是不是在同一小时内
 *
 *  @return YES，是；NO，不是
 */
- (BOOL)isHour;


/**
 *  判断一个时间是不是今天
 *
 *  @return YES，是；NO，不是
 */
- (BOOL)isToday;

/**
 *  判断一个时间是不是昨天
 *
 *  @return YES, 是；NO，不是
 */
- (BOOL)isYesterday;


/**
 *  判断一个时间和当前时间是不是在同一周内
 *
 *  @return YES, 是；NO，不是
 */
- (BOOL)isThisWeek;


/**
 *  判断一个时间和当前时间是不是在同一个月内
 *
 *  @return YES, 是；NO，不是
 */
- (BOOL)isThisMonth;


/**
 *  判断一个时间是不是今年
 *
 *  @return YES, 是；NO，不是
 */
- (BOOL)isThisYear;

/**
 *  判断两个时间相隔了多少秒
 *
 *  @param date 目标时间
 *  
 *  @return 相隔多少秒，正数表示在目标时间未来，负数表示在目标时间以前
 */
- (NSTimeInterval)distanceDate:(NSDate *)date;


@end
