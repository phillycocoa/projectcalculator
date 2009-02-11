//
//  Controller.h
//  Calculator
//
//  Created by Jason Allum on 1/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum {
    None = 0,
    /**/
    Add,
    Subtract,
    Multiply,
    Divide,
} CalcOp;

@interface Controller : NSObject {
    
	IBOutlet NSTextField *totalField;
	IBOutlet NSTextField *opField;
	
    NSString* totalDisplayValue;
	NSString* opDisplayValue;
	
    CalcOp curOp;
	
	BOOL hasCurNum;
	NSInteger accumulator;
}

@property (retain) NSString* totalDisplayValue;
@property (retain) NSString* opDisplayValue;
@property (assign) CalcOp curOp;
@property (assign) NSInteger accumulator;

- (IBAction) digitButtonClicked:(id)sender;
- (IBAction) opButtonClicked:(id)sender;

- (NSInteger)integerResultFromOperand:(NSInteger)int1 operand:(NSInteger)int2 operator:(CalcOp)operator;
@end


