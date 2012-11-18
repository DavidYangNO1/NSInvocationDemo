//
//  ViewController.m
//  NSInvocationDemo
//
//  Created by Yang David on 11/18/12.
//  Copyright (c) 2012 Yang David. All rights reserved.
//

#import "ViewController.h"
#import "CurrentDate.h"
@interface ViewController ()

@end

@implementation ViewController


-(void)demo1{
   
    //原始调用
    NSDateFormatter * dateFormat=[[NSDateFormatter alloc]init];
    
    CurrentDate * currentDateClassObject=[[CurrentDate alloc] init];
    
    NSString*currentDate=[currentDateClassObject
                          stringForDate: [NSDate date]
                          usingFormatter: dateFormat];
    NSLog(@"currentDate: %@", currentDate);


}

-(void)demo2{
    //NSInvocation调用
    
    SEL mySelector=@selector(stringForDate:usingFormatter:);
    
    CurrentDate * currentDateClassObject=[[CurrentDate alloc] init];
    
    NSMethodSignature*sig=[[currentDateClassObject class]
                           instanceMethodSignatureForSelector: mySelector];
   
    NSInvocation*myInvocation=[NSInvocation invocationWithMethodSignature: sig];
    
    [myInvocation setTarget: currentDateClassObject];
    
    [myInvocation setSelector: mySelector];
    
    NSDate*myDate=[NSDate date];
    
    [myInvocation setArgument:&myDate atIndex:2];
    
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle: NSDateFormatterMediumStyle];
    
    [myInvocation setArgument:&dateFormatter atIndex:3];
    
    NSString*result=nil;
    
    [myInvocation retainArguments];
    
    [myInvocation invoke];
    
    [myInvocation getReturnValue:&result];
    
    NSLog(@"The result is: %@", result);

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
