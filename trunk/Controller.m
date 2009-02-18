//
//  Controller.m
//  Calculator
//
//  Created by Jason Allum on 1/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller

@synthesize numDisplayValue;
@synthesize opDisplayValue;
@synthesize curOp;
@synthesize total;

// This method is called once when the object is unarchived from
// the nib.  Setup and initialization code can go here.
- (void) awakeFromNib
{
    [self setNumDisplayValue:@"0"];
	[self setOpDisplayValue:@""];
	[self setCurOp:None];
	isNumberBeingEntered = NO;
}


- (IBAction) digitButtonClicked:(id)sender
{
    NSString* text = [sender title];
    NSLog(@"%@", text);

	if( !isNumberBeingEntered )
	{
		// this is NO (false) after an operation is performed and the result
		// of the operation is display in numDisplayField.  We don't want to
		// concatenate the new digit in the case, we want to clear the current
		// display and start building a new number
		
		[self setNumDisplayValue:@""];
		isNumberBeingEntered = YES;
	}
	
	// parse digits
	//
	// This basically takes the title of the number button and concatentets it
	// to the previous value, which is stored in numDisplayValue.
	//
	// There is an special case for 0 to prevent entering 0's before a non-zero integer
	//
    if ([@"0" isEqualToString:text] && ([[self numDisplayValue] length] > 0)) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"0"]];
    } else if ([@"1" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"1"]];
    } else if ([@"2" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"2"]];
    } else if ([@"3" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"3"]];
    } else if ([@"4" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"4"]];
	} else if ([@"5" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"5"]];
    } else if ([@"6" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"6"]];
	} else if ([@"7" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"7"]];
	} else if ([@"8" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"8"]];
    } else if ([@"9" isEqualToString:text]) {
        [self setNumDisplayValue:[[self numDisplayValue] stringByAppendingString:@"9"]];
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
		// if an operation button has already been pressed OR
		// the equals button was pressed, run the calculation
		// with the current operation
		
		newTotal  = [self integerResultFromOperand:[self total]
													operand:[[self numDisplayValue] integerValue]
												   operator:[self curOp]];
	}
	else
	{
		// if this is the first operation, just save the currently displayed value
		
		newTotal = [[self numDisplayValue] integerValue];
	}
	
	// update the internal total
	[self setTotal:newTotal];
	
	// update the displayed value
	[self setNumDisplayValue:[[NSNumber numberWithInteger:newTotal] stringValue]];

	// clear the isNumberBeingEntered flag
	isNumberBeingEntered = NO;
	
	// set the current operation to the operation we just parsed
	[self setCurOp:newOperation];

	if (newOperation != None)
	{
		// update the operation display field
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
