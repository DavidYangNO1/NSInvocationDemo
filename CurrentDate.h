//
//  CurrentDate.h
//  NSInvocationDemo
//
//  Created by Yang David on 11/18/12.
//  Copyright (c) 2012 Yang David. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentDate : NSObject

-(NSString *)stringForDate:(NSDate *)date
              usingFormatter:(NSDateFormatter *)formatter;
@end
