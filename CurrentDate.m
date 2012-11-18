//
//  CurrentDate.m
//  NSInvocationDemo
//
//  Created by Yang David on 11/18/12.
//  Copyright (c) 2012 Yang David. All rights reserved.
//

#import "CurrentDate.h"

@implementation CurrentDate

-(NSString *)stringForDate:(NSDate *)date
            usingFormatter:(NSDateFormatter *)formatter{
    return[formatter stringFromDate: date];

}
@end
