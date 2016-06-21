//
//  NSDate+HYCategory.m
//  日期和时间研究
//
//  Created by ocean on 16/5/24.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import "NSDate+HYCategory.h"

@implementation NSDate (HYCategory)


/**
 *  判断一个时间和当前时间是不是在同一分钟内
 *
 *  @return YES，是；NO，不是
 */
- (BOOL)isMinute{ //目标日期和当前日期的 年，月，日，时，分相同
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    
    NSDateComponents *current = [calendar components:unit fromDate:[NSDate date]];
    
    NSDateComponents *destination = [calendar components:unit fromDate:self];
    
    return  (current.year == destination.year)&&
            (current.month == destination.month)&&
            (current.day == destination.day)&&
            (current.hour == destination.hour)&&
            (current.minute == destination.minute);

}


/**
 *  判断一个时间和当前时间是不是在同一小时内
 *
 *  @return YES，是；NO，不是
 */
- (BOOL)isHour{ //目标日期和当前日期的 年，月，日，时相同

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour;
    
    NSDateComponents *current = [calendar components:unit fromDate:[NSDate date]];
    
    NSDateComponents *destination = [calendar components:unit fromDate:self];
    
    return  (current.year == destination.year)&&
    (current.month == destination.month)&&
    (current.day == destination.day)&&
    (current.hour == destination.hour);

}


/**
 *  判断一个时间是不是今天
 *
 *  @return YES，是今天；NO，不是今天
 */
- (BOOL)isToday{ //目标日期和当前日期的年，月，日相同，则两个日期在同一天

    //获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //设置需要从日历（日期）中取出的元素
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    //取出当前日期中的元素
    NSDateComponents *currentDateComponents = [calendar components:unit fromDate:[NSDate date]];
    
    //取出目标日期中的元素
    NSDateComponents *destinationDateComponents = [calendar components:unit fromDate:self];
    
    //当前日期的年，月，日 和 目标日期的年，月，日比较
    return  (currentDateComponents.year == destinationDateComponents.year) &&
            (currentDateComponents.month == destinationDateComponents.month) &&
            (currentDateComponents.day == destinationDateComponents.day);
    
}


/**
 *  判断一个日期是不是昨天
 *
 *  @return YES, 是昨天；NO，不是昨天
 */
- (BOOL)isYesterday{ //判断两个日期的年，月，日的情况，昨天日期和目标进行比较
    
    //取出当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //设置取出日历中的元素
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    //获取当前日期
    NSDate *currentDate = [NSDate date];
    
    //获取昨天日期
    NSDate *yesterdayDate = [NSDate dateWithTimeInterval:-86400 sinceDate:currentDate];
    
    //获取昨天日期的元素，年，月，日
    NSDateComponents *yesterdayDateComponents = [calendar components:unit fromDate:yesterdayDate];
    
    //获取目标日期的元素，年，月，日
    NSDateComponents *destinationDateComponents = [calendar components:unit fromDate:self];
    
    //昨天日期中的元素和目标日期中的元素比较
    return (yesterdayDateComponents.year == destinationDateComponents.year)&&
           (yesterdayDateComponents.month == destinationDateComponents.month)&&
           (yesterdayDateComponents.day == destinationDateComponents.day);


}

/**
 *  判断一个时间和当前时间是不是在同一周内
 *
 *  @return YES, 是；NO，不是
 */
- (BOOL)isThisWeek{ //目标日期和当前日期的 年，月，周相同
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth;
    
    NSDateComponents *current = [calendar components:unit fromDate:[NSDate date]];
    
    NSDateComponents *destination = [calendar components:unit fromDate:self];
    
    return  (current.year == destination.year)&&
            (current.month == destination.month)&&
            (current.weekOfMonth == destination.weekOfMonth);

}

/**
 *  判断一个时间和当前时间是不是在同一个月内
 *
 *  @return YES, 是；NO，不是
 */
- (BOOL)isThisMonth{

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth;
    
    NSDateComponents *current = [calendar components:unit fromDate:[NSDate date]];
    
    NSDateComponents *destination = [calendar components:unit fromDate:self];
    
    return  (current.year == destination.year)&&
            (current.month == destination.month);

}


/**
 *  判断一个日期是不是今年
 *
 *  @return YES, 是；NO，不是
 */
- (BOOL)isThisYear{ //目标日期和当前日期的 年 相同

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear;
    
    NSDateComponents *current = [calendar components:unit fromDate:[NSDate date]];
    
    NSDateComponents *destination = [calendar components:unit fromDate:self];
    
    return  (current.year == destination.year);

}


/**
 *  判断两个时间相隔了多少秒，注意一般使用当前时间减去目标时间（一般为过去时间）
 *
 *  @param date 目标时间，需要判断的时间
 *
 *  @return 相隔多少秒，正数表示在目标时间未来，负数表示在目标时间以前
 */
- (NSTimeInterval)distanceDate:(NSDate *)date{
    
    return [self timeIntervalSinceDate:date];

}


@end
