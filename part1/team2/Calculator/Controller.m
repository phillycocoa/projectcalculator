//
//  Controller.m
//  Calculator
//
//  Created by Jason Allum on 1/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"


@implementation Controller
@synthesize value;

- (void) awakeFromNib
{
    [self setValue:@""];
}

- (IBAction) buttonClicked:(id)sender
{
    NSString* text = [sender title];
    
    int x = 2;
    
    if (x = 3) {
        /*go*/
    }
    
    
    
    if ([@"0" isEqualToString:text]) {
        [self setValue:[[self value] stringByAppendingString:@"0"]];
    } else if ([@"1" isEqualToString:text]) {
        [self setValue:[[self value] stringByAppendingString:@"1"]];
    } else if ([@"2" isEqualToString:text]) {
        [self setValue:[[self value] stringByAppendingString:@"2"]];
    } else if ([@"3" isEqualToString:text]) {
        [self setValue:[[self value] stringByAppendingString:@"3"]];
    } else if ([@"+" isEqualToString:text]) {
        operation = Add;
    } else if ([@"-" isEqualToString:text]) {
        operation = Subtract;
    } else if ([@"*" isEqualToString:text]) {
        operation = Multiply;
    } else if ([@"/" isEqualToString:text]) {
        operation = Divide;
    }
    
    NSLog(@"%@", text);
}

@end
