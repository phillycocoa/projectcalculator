//
//  Controller.m
//  Calculator
//
//  Created by Jason Allum on 1/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller

@synthesize totalDisplayValue;
@synthesize opDisplayValue;
@synthesize curOp;
@synthesize accumulator;


- (void) awakeFromNib
{
    [self setTotalDisplayValue:@"0"];
	[self setOpDisplayValue:@""];
	[self setCurOp:None];
	hasCurNum = NO;
}


- (IBAction) digitButtonClicked:(id)sender
{
    NSString* text = [sender title];
    NSLog(@"%@", text);

	if( !hasCurNum )
	{
		[self setTotalDisplayValue:@""];
		hasCurNum = YES;
	}
	
	// parse digits
    if ([@"0" isEqualToString:text] && ([[self totalDisplayValue] length] > 0)) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"0"]];
    } else if ([@"1" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"1"]];
    } else if ([@"2" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"2"]];
    } else if ([@"3" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"3"]];
    } else if ([@"4" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"4"]];
	} else if ([@"5" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"5"]];
    } else if ([@"6" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"6"]];
	} else if ([@"7" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"7"]];
	} else if ([@"8" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"8"]];
    } else if ([@"9" isEqualToString:text]) {
        [self setTotalDisplayValue:[[self totalDisplayValue] stringByAppendingString:@"9"]];
	}
}

- (IBAction) opButtonClicked:(id)sender
{	
	NSString* text = [sender title];
    NSLog(@"%@", text);
	
	CalcOp newOperation = None;
	BOOL isEqualsButton = NO;
	
	// parse operators	
	if ([@"+" isEqualToString:text]) {
		newOperation = Add;
	} else if ([@"-" isEqualToString:text]) {
		newOperation = Subtract;
	} else if ([@"*" isEqualToString:text]) {
		newOperation = Multiply;
	} else if ([@"/" isEqualToString:text]) {
		newOperation = Divide;
	} else if ([@"=" isEqualToString:text]) {
		isEqualsButton = YES;
	}
	
	NSInteger newTotal = 0;
	if ([self curOp] || isEqualsButton)
	{
		newTotal  = [self integerResultFromOperand:[self accumulator]
													operand:[[self totalDisplayValue] integerValue]
												   operator:[self curOp]];
	}
	else
	{
		newTotal = [[self totalDisplayValue] integerValue];
	}
	
	[self setAccumulator:newTotal];
	[self setTotalDisplayValue:[[NSNumber numberWithInteger:newTotal] stringValue]];

	
	hasCurNum = NO;		
	[self setCurOp:newOperation];

	if (newOperation != None)
	{
		[self setOpDisplayValue:text];
		
	}
}


- (NSInteger)integerResultFromOperand:(NSInteger)int1 operand:(NSInteger)int2 operator:(CalcOp)operator
{
	NSInteger result = 0;
	
	switch (operator)
	{
		case Add:
			result = int1 + int2;
			break;
		case Subtract:
			result = int1 - int2;
			break;
		case Multiply:
			result = int1 * int2;
			break;
		case Divide:
			result = int1 / int2;
			break;
	}
	return result;
}

@end
